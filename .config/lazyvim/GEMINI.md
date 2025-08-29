# GEMINI.md

## Project Overview

This directory contains a Neovim configuration based on the [LazyVim](https://www.lazyvim.org/) framework. The configuration is written in Lua and managed using the `lazy.nvim` plugin manager.

The entry point for the configuration is `init.lua`, which bootstraps `lazy.nvim` and loads the main configuration from `lua/config/lazy.lua`. Custom plugin configurations and additional plugins are defined in the `lua/plugins/` directory.

## Building and Running

This is a Neovim configuration, so there is no traditional "build" process. To "run" the project, you simply need to start Neovim.

It is assumed that you have [Neovim](https://neovim.io/) installed and that this directory is located at `~/.config/nvim`. If you are using a different location, you will need to create a symbolic link.

## Development Conventions

### Linting and Formatting

The project uses `luacheck` for static analysis and `stylua` for code formatting. The following tasks are defined in `Taskfile.yml` and can be run using a task runner like [Task](https://taskfile.dev/):

*   `task luacheck`: Run luacheck for static analysis.
*   `task stylua`: Check formatting with stylua.
*   `task stylua-fix`: Fix formatting with stylua.
*   `task lint`: Run all linting checks (`luacheck` and `stylua`).

### Plugin Management

Plugins are managed using `lazy.nvim`. To add or remove plugins, or to customize their configuration, modify the files in the `lua/plugins/` directory.

*   **Adding Plugins:** Add a new spec to a file in `lua/plugins/`.
*   **Disabling Plugins:** Add an entry to the `lua/plugins/disabled.lua` file.
*   **Customizing Plugins:** Modify the `opts` of a plugin's spec in the relevant file in `lua/plugins/`.
