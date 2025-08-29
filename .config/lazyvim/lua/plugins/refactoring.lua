return {
  "ThePrimeagen/refactoring.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = false,
  opts = {},
  config = function(_, opts)
    require("refactoring").setup(opts)
  end,
}
