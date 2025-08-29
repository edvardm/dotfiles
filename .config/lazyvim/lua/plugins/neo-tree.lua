return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = false } },
      },
    },
    filesystem = {
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      -- Disable all preview functionality
      preview = {
        enabled = false,
      },
      commands = {
        -- Override preview command to do nothing
        toggle_preview = function(_state)
          -- Disabled - do nothing
        end,
      },
    },
  },
}
