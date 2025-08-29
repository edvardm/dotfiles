-- Configuration for luacheck
-- For LazyVim/Neovim configuration

-- Allow access to vim global
globals = {
  "vim"
}

-- Ignore specific warnings
ignore = {
  "211", -- Unused local variable
  "212", -- Unused argument
  "213", -- Unused loop variable
  "631", -- Line too long (we use stylua for formatting)
}

-- Allow unreachable code in example files
files["lua/plugins/example.lua"] = {
  ignore = {"511"} -- unreachable code
}