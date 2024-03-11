vim.opt.number = true -- show line numbers
vim.opt.rnu = true -- show relative numbers

vim.opt.ignorecase = true -- ignore case when searching

vim.opt.smartcase = true -- if search has case use it

vim.opt.hlsearch = true -- highlight search results

vim.opt.ai = true -- auto indent
vim.opt.si = true -- smart indent
vim.opt.wrap = true -- wrap long lines
vim.opt.breakindent = true -- preserve indentation when wrapping

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.showmatch = true -- show matching bracket
vim.opt.mat = 2

vim.g.mapleader = " " -- space leader

vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', {
	desc = "Copy to clipboard",
})
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', {
	desc = "Paste from clipboard",
})
vim.keymap.set("n", "<leader>a", ":keepjumps normal! ggVG<cr>", {
	desc = "Select all",
})

vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {
	desc = "Go to definition",
})
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {
	desc = "Describe",
})

vim.keymap.set("n", "<leader>o", "<C-O>", {
	desc = "Jump backward",
})
vim.keymap.set("n", "<leader>i", "<C-I>", {
	desc = "Jump forward",
})

-- setup plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
-- end of plugins

vim.cmd([[colorscheme catppuccin]])

-- format on write
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- Run gofmt + goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
	group = format_sync_grp,
})
