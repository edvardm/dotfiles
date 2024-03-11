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
-- Plugins

-- plugin manager
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

require("lazy").setup({
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"kevinhwang91/nvim-ufo", -- modern folding
		dependencies = { "kevinhwang91/promise-async" },
		opts = {
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("local_detach_ufo", {
					clear = true,
				}),
				pattern = opts.filetype_exclude,
				callback = function()
					require("ufo").detach()
				end,
			})

			vim.opt.foldlevelstart = 8
			require("ufo").setup(opts)
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local ih = require("inlay-hints")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.gopls.setup({
				on_attach = function(c, b)
					ih.on_attach(c, b)
				end,
				capabilities = capabilities,
				inlay_hints = {
					enabled = true,
				},
				settings = {
					gopls = {
						experimentalPostfixCompletions = true,
						analyses = {
							unusedparams = true,
							shadow = true,
						},
						staticcheck = true,
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
				init_options = {
					usePlaceholders = true,
				},
			})

			lspconfig.golangci_lint_ls.setup({})

			lspconfig.rust_analyzer.setup({
				settings = {
					["rust-analyzer"] = {},
				},
			})
		end,
		dependencies = { -- Replace with native support when nvim 0.10 is released
			{
				"simrat39/inlay-hints.nvim",
				config = function()
					require("inlay-hints").setup({
						renderer = "inlay-hints/render/eol",
					})
				end,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"go",
				"rust",
				"haskell",
				"python",
				"yaml",
				"bash",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
			},
		},
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		keys = {
			{
				"<leader>tf",
				"<cmd>Telescope find_files<cr>",
				desc = "Telescope fd",
			},
			{
				"<leader>tg",
				"<cmd>Telescope live_grep<cr>",
				desc = "Telescope rg",
			},
		},
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						n = {
							["<A-j>"] = require("telescope.actions").move_selection_next,
							["<A-k>"] = require("telescope.actions").move_selection_previous,
						},
						i = {
							["<A-j>"] = require("telescope.actions").move_selection_next,
							["<A-k>"] = require("telescope.actions").move_selection_previous,
						},
					},
				},
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		keys = { {
			"<leader>n",
			"<cmd>Neotree toggle<cr>",
			desc = "NeoTree",
		} },
		dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
		config = function()
			require("neo-tree").setup({
				default_component_configs = {
					icon = {
						folder_closed = "+",
						folder_open = "-",
						folder_empty = "o",
						default = " ",
						highlight = "NeoTreeFileIcon",
					},
					git_status = {
						symbols = {
							added = "a",
							modified = "m",
							deleted = "✖",
							renamed = "r",
							untracked = "u",
							ignored = "",
							unstaged = "",
							staged = "",
							conflict = "!",
						},
					},
				},
			})
		end,
	},
	{ "RRethy/vim-illuminate" },
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = false,
					component_separators = {
						left = "|",
						right = "|",
					},
					section_separators = {
						left = "",
						right = "",
					},
				},
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = {
					["<A-j>"] = cmp.mapping.select_next_item(),
					["<A-k>"] = cmp.mapping.select_prev_item(),
					["<TAB>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({
								select = true,
							})
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-TAB>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				},
				sources = cmp.config.sources(
					{ {
						name = "nvim_lsp",
					}, {
						name = "luasnip",
					} },
					{ {
						name = "buffer",
					} }
				),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = { {
					name = "buffer",
				} },
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({ {
					name = "path",
				} }, { {
					name = "cmdline",
				} }),
			})
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"saadparwaiz1/cmp_luasnip",
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
		},
	},
	{
		"mrcjkb/haskell-tools.nvim",
		version = "^3", -- Recommended
		ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
	},
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{
		"tpope/vim-fugitive",
		event = "BufWinEnter",
	},
})

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
