return {
  {
    "folke/flash.nvim",
    keys = {
      -- Disable default mapping for 's'
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "x", "o" }, false },
      -- { "<leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
  },
}
