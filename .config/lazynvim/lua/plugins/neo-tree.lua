return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
      },
    },
    filesystem = {
      window = {
        -- Make preview window smaller
        popup = {
          size = {
            height = "10%", -- Smaller height
            width = "10%", -- Smaller width
          },
        },
      },
      -- Uncomment to disable image preview completely:
      commands = {
        toggle_preview = function(_state)
          -- Override to disable image preview
        end,
      },
    },
  },
}
