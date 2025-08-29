# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a LazyVim configuration directory for Neovim. LazyVim is a Neovim setup powered by lazy.nvim with sane defaults for options, autocmds, and keymaps, ready to extend and customize.

## Key Commands

### Linting and Formatting
- `task lint` - Run all linting checks (luacheck + stylua format check)
- `task luacheck` - Run luacheck for static analysis
- `task stylua` - Check formatting with stylua
- `task stylua-fix` - Format Lua files using stylua (configured in stylua.toml)

### Configuration Management
- Configuration changes require restarting Neovim to take effect
- Plugin changes are automatically detected by lazy.nvim's update checker

## Architecture

### Core Structure
- `init.lua` - Entry point that bootstraps lazy.nvim and LazyVim
- `lua/config/` - Core configuration files:
  - `lazy.lua` - lazy.nvim setup and plugin specification
  - `options.lua` - Neovim options overrides
  - `keymaps.lua` - Custom keymaps
  - `autocmds.lua` - Auto commands
- `lua/plugins/` - Custom plugin configurations that extend or override LazyVim defaults

### Plugin System
- Uses lazy.nvim for plugin management with lazy loading
- LazyVim provides base plugin specifications imported from "lazyvim.plugins"
- Custom plugins in `lua/plugins/` are automatically loaded
- Plugin specifications can add, configure, or disable LazyVim plugins

### Language Support
- Enabled extras (lazyvim.json): Docker, Gleam, JSON, Markdown, TOML
- Mason automatically installs language servers and tools
- Custom Gleam LSP setup in `lua/plugins/gleam.lua`

### Configuration Patterns
- Plugin files should return a table/array of plugin specifications
- Use `opts` to merge configuration with defaults
- Use `opts = function(_, opts)` to modify existing configurations
- Set `enabled = false` to disable plugins
- Import language extras with `{ import = "lazyvim.plugins.extras.lang.X" }`

## Customization Notes
- Example plugin configurations are in `lua/plugins/example.lua` (currently disabled)
- stylua configuration uses 2-space indentation with 120 column width
- LazyVim's update checker is enabled but notifications are disabled