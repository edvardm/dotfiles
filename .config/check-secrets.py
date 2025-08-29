#!/usr/bin/env python3
import sys

if sys.version_info < (3, 12):
    print("Error: Python 3.12 or higher is required", file=sys.stderr)
    sys.exit(1)
# ruff: noqa: E731
import argparse
import json
import subprocess
import sys
from pathlib import Path
import hashlib
from itertools import groupby
from typing import Dict, Set, List, Tuple, TypeGuard


def _is_finding(parsed: Dict) -> TypeGuard[Dict]:
    return "DetectorName" in parsed


def _has_content(line: str) -> TypeGuard[str]:
    return bool(line.strip() and not line.startswith("#"))


def load_ignore_rules() -> Set[str]:
    ignore_file = Path.home() / ".config" / ".trufflehog-ignore"
    if not ignore_file.exists():
        return set()
    return {
        line.strip()
        for line in ignore_file.read_text().strip().split("\n")
        if _has_content(line)
    }


def get_file_path(finding: Dict) -> str:
    return (
        finding.get("SourceMetadata", {})
        .get("Data", {})
        .get("Filesystem", {})
        .get("file", "")
    )


def get_detector(finding: Dict) -> str:
    return finding.get("DetectorName", "")


def get_raw(finding: Dict) -> str:
    return finding.get("Raw", "")


def generate_finding_hash(finding: Dict) -> str:
    content = (
        f"{get_file_path(finding)}|{get_detector(finding)}|{get_raw(finding)[:50]}"
    )
    return hashlib.sha256(content.encode()).hexdigest()[:16]


def load_findings(report_file: Path) -> List[Dict]:
    findings = []
    for line in report_file.read_text().split("\n"):
        if not line.strip():
            continue
        try:
            parsed = json.loads(line)
            if _is_finding(parsed):
                findings.append(parsed)
        except json.JSONDecodeError:
            continue
    return findings


def partition_findings(
    findings: List[Dict], ignored_hashes: Set[str]
) -> Tuple[List[Dict], List[Dict]]:
    ignored, active = [], []
    for finding in findings:
        if generate_finding_hash(finding) in ignored_hashes:
            ignored.append(finding)
        else:
            active.append(finding)
    return ignored, active


truncate_secret = lambda secret: secret[:100] + "..." if len(secret) > 100 else secret
format_status = lambda verified: "✓ VERIFIED" if verified else "? UNVERIFIED"


def format_finding(finding: Dict, show_hash: bool = False) -> str:
    file_info = finding.get("SourceMetadata", {}).get("Data", {}).get("Filesystem", {})
    line_parts = [
        f"[{format_status(finding.get('Verified', False))}] {get_detector(finding)}",
        f"  File: {get_file_path(finding)}:{file_info.get('line', 'Unknown')}",
        f"  Secret: {truncate_secret(get_raw(finding))}",
    ]
    if show_hash:
        line_parts.append(f"  Hash: {generate_finding_hash(finding)}")
    return "\n".join(line_parts)


def format_finding_compact(finding: Dict, verbosity: int = 0) -> str:
    file_path = get_file_path(finding)
    detector = get_detector(finding)
    verified = finding.get("Verified", False)
    file_info = finding.get("SourceMetadata", {}).get("Data", {}).get("Filesystem", {})
    line_num = file_info.get("line", "?")

    if verbosity == 0:
        status = "✓" if verified else "?"
        return f"{status} {detector}: {file_path}:{line_num}"
    elif verbosity == 1:
        status = format_status(verified)
        raw_secret = get_raw(finding)
        secret_preview = raw_secret[:30] + "..." if len(raw_secret) > 30 else raw_secret
        return f"[{status}] {detector}: {file_path}:{line_num} | {secret_preview}"
    else:
        return format_finding(finding, verbosity >= 3)


def group_by_detector(findings: List[Dict]) -> Dict[str, List[Dict]]:
    sorted_findings = sorted(findings, key=get_detector)
    return {k: list(g) for k, g in groupby(sorted_findings, key=get_detector)}


def get_changed_files() -> List[str]:
    try:
        result = subprocess.run(
            ["yadm", "diff", "--cached", "--name-only", "--diff-filter=ACM"],
            capture_output=True,
            text=True,
            check=True,
        )
        config_dir = Path.home() / ".config"
        return [
            str(config_dir / f)
            for f in result.stdout.strip().split("\n")
            if f and (config_dir / f).exists()
        ]
    except subprocess.CalledProcessError:
        return []


def run_trufflehog_scan(file_paths: List[str], output_file: Path) -> bool:
    if not file_paths:
        return False

    cmd = [
        "trufflehog",
        "filesystem",
        "--json",
        "--no-verification",
        "--exclude-paths",
        str(Path.home() / ".config" / ".trufflehog-ignore"),
    ] + file_paths

    try:
        with open(output_file, "w") as f:
            result = subprocess.run(
                cmd, stdout=f, stderr=subprocess.DEVNULL, check=False
            )
        return result.returncode == 0
    except Exception:
        return False


def get_yadm_tracked_files() -> List[str]:
    try:
        result = subprocess.run(
            ["yadm", "list"],
            capture_output=True,
            text=True,
            check=True,
        )
        config_dir = Path.home() / ".config"
        return [
            str(config_dir / f)
            for f in result.stdout.strip().split("\n")
            if f and (config_dir / f).exists()
        ]
    except subprocess.CalledProcessError:
        return []


def scan_all_files(output_file: Path) -> bool:
    tracked_files = get_yadm_tracked_files()
    if not tracked_files:
        print("No yadm tracked files found", file=sys.stderr)
        return False
    return run_trufflehog_scan(tracked_files, output_file)


def scan_changed_files(output_file: Path) -> List[str]:
    changed_files = get_changed_files()
    if changed_files:
        run_trufflehog_scan(changed_files, output_file)
    return changed_files


def generate_report(
    report_file: Path, show_hashes: bool = False
) -> Tuple[int, int, int]:
    if not report_file.exists():
        print("Error: report file not found", file=sys.stderr)
        return 0, 0, 0

    ignored_hashes = load_ignore_rules()
    findings = load_findings(report_file)
    ignored_findings, active_findings = partition_findings(findings, ignored_hashes)

    print("TruffleHog Secret Scan Report")
    print("=" * 50)
    print(f"Total findings: {len(findings)}")
    print(f"Active findings: {len(active_findings)}")
    print(f"Ignored findings: {len(ignored_findings)}")
    print(
        f"Verified secrets: {sum(1 for f in active_findings if f.get('Verified', False))}"
    )
    print()

    if active_findings:
        print("ACTIVE FINDINGS:")
        print("-" * 50)

        for detector, detector_findings in sorted(
            group_by_detector(active_findings).items()
        ):
            print(f"\n{detector} ({len(detector_findings)} findings):")
            for finding in detector_findings:
                print(format_finding(finding, show_hashes))
                print()

    if active_findings and not show_hashes:
        ignore_file = Path.home() / ".config" / ".trufflehog-ignore"
        print("\nTo ignore specific findings:")
        print(f"  python3 {__file__} --show-hashes")
        print(f"  echo HASH_VALUE >> {ignore_file}")
        print(f"To exclude files: add regex pattern to {ignore_file}")

    return len(findings), len(active_findings), len(ignored_findings)


def list_findings(report_file: Path, verbosity: int = 0) -> Tuple[int, int, int]:
    if not report_file.exists():
        print("Error: report file not found", file=sys.stderr)
        return 0, 0, 0

    ignored_hashes = load_ignore_rules()
    findings = load_findings(report_file)
    ignored_findings, active_findings = partition_findings(findings, ignored_hashes)

    if verbosity >= 2:
        print("TruffleHog Secret Scan Report")
        print("=" * 50)
        print(f"Total findings: {len(findings)}")
        print(f"Active findings: {len(active_findings)}")
        print(f"Ignored findings: {len(ignored_findings)}")
        print(
            f"Verified secrets: {sum(1 for f in active_findings if f.get('Verified', False))}"
        )
        print()

    if active_findings:
        if verbosity >= 2:
            print("ACTIVE FINDINGS:")
            print("-" * 50)

        for finding in active_findings:
            print(format_finding_compact(finding, verbosity))

    if verbosity == 0 and active_findings:
        print(f"\n{len(active_findings)} active findings. Use -v for more details.")

    return len(findings), len(active_findings), len(ignored_findings)


def main():
    parser = argparse.ArgumentParser(description="Scan for secrets using TruffleHog")
    parser.add_argument(
        "--all",
        action="store_true",
        help="Scan all yadm tracked files (default: scan only yadm staged files)",
    )
    parser.add_argument(
        "--show-hashes",
        action="store_true",
        help="Show hashes for findings to enable specific ignoring",
    )
    parser.add_argument(
        "--list",
        action="store_true",
        help="List findings from existing JSON report (no scanning)",
    )
    parser.add_argument(
        "-v",
        "--verbose",
        action="count",
        default=0,
        help="Increase verbosity (can be used multiple times)",
    )

    args = parser.parse_args()

    config_dir = Path.home() / ".config"
    report_file = config_dir / "trufflehog-report.json"

    if args.list:
        total, active, ignored = list_findings(report_file, args.verbose)
        sys.exit(1 if active > 0 else 0)
    elif args.all:
        print("🔍 Scanning all yadm tracked files for secrets...")
        if not scan_all_files(report_file):
            print("❌ TruffleHog scan failed", file=sys.stderr)
            sys.exit(1)

        total, active, ignored = generate_report(report_file, args.show_hashes)
        sys.exit(1 if active > 0 else 0)
    else:
        print("🔍 Scanning changed files for secrets...")
        changed_files = scan_changed_files(report_file)

        if not changed_files:
            print("✅ No changed files to scan")
            sys.exit(0)

        if not report_file.exists() or report_file.stat().st_size == 0:
            print("✅ No secrets detected in changed files")
            sys.exit(0)

        ignored_hashes = load_ignore_rules()
        findings = load_findings(report_file)
        active_findings = [
            f for f in findings if generate_finding_hash(f) not in ignored_hashes
        ]

        if active_findings:
            print(
                f"❌ Found {len(active_findings)} potential secrets in changed files!"
            )
            print(f"cmd: python3 {__file__} --show-hashes")
            print("To ignore: echo 'HASH' >> ~/.config/.trufflehog-ignore")
            sys.exit(1)
        else:
            print("✅ All findings are ignored")
            sys.exit(0)


if __name__ == "__main__":
    main()
