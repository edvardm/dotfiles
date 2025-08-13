# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This repository contains personal Neomutt email configuration using notmuch as the backend for email indexing and searching. The setup provides a terminal-based email workflow with powerful search capabilities and automated email organization through tagging.

## Architecture

The configuration follows a modular structure:
- **neomuttrc**: Main configuration that sets up notmuch integration, virtual mailboxes, and core settings
- **themes/**: Color scheme configurations (currently using spacechalk.muttrc)
- **macros/**: Keyboard macros for common operations (notmuch.macros for quick filtering)
- **notmuch-tag-mail**: Shell script for automated email tagging based on sender patterns

## Key Dependencies

- **neomutt**: Terminal email client
- **notmuch**: Email indexing and search engine
- **msmtp**: SMTP client for sending mail (expects at `/opt/homebrew/bin/msmtp`)
- **nvim**: Text editor for composing emails
- Mail directory at `/Users/ed/Mail` in Maildir format

## Common Tasks

### Running Email Tagging
```bash
./notmuch-tag-mail
```
This script applies tags based on sender patterns (spam, github, newsletters, etc.) and should be run periodically to organize new mail.

### Testing Configuration Changes
```bash
neomutt -n  # Dry run to test configuration without opening mailboxes
```

### Notmuch Database Operations
```bash
notmuch new        # Index new mail
notmuch search tag:unread  # Test notmuch queries used in virtual mailboxes
```

## Configuration Notes

- Virtual mailboxes are defined using notmuch queries (e.g., `tag:inbox and NOT tag:archive`)
- The `keys.neomuttrc` file exists but is NOT currently sourced - add `source ~/.config/neomutt/keys.neomuttrc` to neomuttrc if vim-style bindings are desired
- Sidebar navigation uses Ctrl+B (previous) and Ctrl+N (next)
- Quick filters in macros/notmuch.macros use Ctrl+letter combinations (e.g., Ctrl+u for unread)

## Important File Locations

- Main config: `neomuttrc`
- Active theme: `themes/spacechalk.muttrc`
- Notmuch macros: `macros/notmuch.macros`
- Email tagging: `notmuch-tag-mail`