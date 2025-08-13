return {
  n = {
    ["<leader>rb"] = {
      function() require("refactoring").refactor "Inline Variable" end,
      desc = "Refactor: Inline Variable (cursor)",
    },
    ["<leader>rp"] = {
      function() require("refactoring").debug.printf { below = false } end,
      desc = "Refactor: Debug Print",
    },
    ["<leader>rP"] = {
      function() require("refactoring").debug.print_var { normal = true } end,
      desc = "Refactor: Debug Print Variable",
    },
    ["<leader>rc"] = {
      function() require("refactoring").debug.cleanup {} end,
      desc = "Refactor: Debug Cleanup",
    },
  },
  v = {
    ["<leader>re"] = {
      function() require("refactoring").refactor "Extract Function" end,
      desc = "Refactor: Extract Function",
    },
    ["<leader>rf"] = {
      function() require("refactoring").refactor "Extract Function To File" end,
      desc = "Refactor: Extract Function to File",
    },
    ["<leader>rv"] = {
      function() require("refactoring").refactor "Extract Variable" end,
      desc = "Refactor: Extract Variable",
    },
    ["<leader>ri"] = {
      function() require("refactoring").refactor "Inline Variable" end,
      desc = "Refactor: Inline Variable",
    },
    ["<leader>rP"] = {
      function() require("refactoring").debug.print_var { normal = false } end,
      desc = "Refactor: Debug Print Variable",
    },
  },
}
