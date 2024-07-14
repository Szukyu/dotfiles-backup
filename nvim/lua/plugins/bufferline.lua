return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"famiu/bufdelete.nvim",
	},
	version = "*",
	config = function()
		local bufferline = require("bufferline")
		local mocha = require("catppuccin.palettes").get_palette("mocha")

		bufferline.setup({
			highlights = {
				fill = {
					fg = mocha.text,
					bg = mocha.base,
				},
				tab = {
					fg = mocha.blue,
					bg = mocha.rosewater,
				},
				tab_selected = {
					fg = mocha.blue,
					bg = mocha.rosewater,
				},
				background = {
					fg = mocha.text,
					bg = mocha.surface1,
				},
				buffer_visible = {
					fg = mocha.text,
					bg = mocha.surface1,
				},
				buffer_selected = {
					fg = mocha.base,
					bg = mocha.blue,
					bold = true,
					italic = false,
				},
				close_button = {
					fg = mocha.blue,
					bg = mocha.base,
				},
				close_button_visible = {
					fg = mocha.blue,
					bg = mocha.surface1,
				},
				close_button_selected = {
					fg = mocha.base,
					bg = mocha.blue,
				},
				indicator_visible = {
					fg = mocha.surface1,
					bg = mocha.surface1,
				},
				indicator_selected = {
					fg = mocha.base,
					bg = mocha.blue,
				},
				modified = {
					fg = mocha.blue,
					bg = mocha.surface1,
				},
				modified_visible = {
					fg = mocha.blue,
					bg = mocha.surface1,
				},
				modified_selected = {
					fg = mocha.base,
					bg = mocha.blue,
				},
				numbers = {
					fg = mocha.blue,
					bg = mocha.surface1,
				},
				numbers_visible = {
					fg = mocha.blue,
					bg = mocha.surface1,
				},
				numbers_selected = {
					fg = mocha.base,
					bg = mocha.blue,
					bold = false,
					italic = false,
				},
				separator_selected = {
					fg = mocha.base,
					bg = mocha.blue,
				},
				separator_visible = {
					fg = mocha.base,
					bg = mocha.surface1,
				},
				separator = {
					fg = mocha.base,
					bg = mocha.surface1,
				},
			},
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
