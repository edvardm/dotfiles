-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>lf", "LspStop", { desc = "Add new task to Taskfile.yml" })

-- Make C-c behave like Esc in all modes
vim.keymap.set({ "i", "n", "s", "v", "x", "o", "t", "c" }, "<C-c>", "<Esc>", { desc = "Escape" })
