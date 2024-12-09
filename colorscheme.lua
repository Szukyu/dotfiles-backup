return {
	{
		"folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      lualine_bold = true,
			on_colors = function(colors)
				colors.bg = "#080A18"
				colors.bg_float = "#04050B"
				colors.bg_sidebar = "#03040A"
				colors.bg_statusline = "#06080E"
			end
		},
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end
  },
}

