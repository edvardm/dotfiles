return {
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"pyright",
			}
		},
		config = function() 
			require("mason").setup()
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function() 
			require "plugins.configs.lspconfig"
			require "custom.configs.lspconfig"
		end
	},
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
	-- { "vmchale/dhall-vim", name="dhall-nvim", lazy=false, opts={} },
	-- {
	-- 	"kevinhwang91/nvim-ufo", -- modern folding
	-- 	dependencies = { "kevinhwang91/promise-async" },
	-- 	opts = {
	-- 		filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
	-- 	},
	-- 	config = function(_, opts)
	-- 		vim.api.nvim_create_autocmd("FileType", {
	-- 			group = vim.api.nvim_create_augroup("local_detach_ufo", {
	-- 				clear = true,
	-- 			}),
	-- 			pattern = opts.filetype_exclude,
	-- 			callback = function()
	-- 				require("ufo").detach()
	-- 			end,
	-- 		})
	--
	-- 		vim.opt.foldlevelstart = 8
	-- 		require("ufo").setup(opts)
	-- 	end,
	-- },
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
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				-- "go",
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
}
