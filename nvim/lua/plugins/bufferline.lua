return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "famiu/bufdelete.nvim",
  },
  version = "*",
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        themable = true,
        numbers = "none",
        middle_mouse_command = nil,
        indicator = {
          style = "none",
        },
        modified_icon = "+",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30,
        truncate_names = false,
        tab_size = 1,
        diagnostics = false,
        diagnostics_update_in_insert = false,
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        show_duplicate_prefix = false,
        persist_buffer_sort = true,

        separator_style = "slope",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = {
          enabled = true,
          delay = 150,
          reveal = { "close" },
        },
        style_preset = {
          bufferline.style_preset.no_italic,
          bufferline.style_preset.no_bold,
        },
      },
    })
  end,
}
