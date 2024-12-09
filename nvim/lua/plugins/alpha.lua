
return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local theta = require("alpha.fortune")

    local bright_green = "#f7768e"
    local orange = vim.g.terminal_color_9
    vim.api.nvim_set_hl(0, "header", {fg = bright_green})
    vim.api.nvim_set_hl(0, "footer", {fg = orange})
    local logo = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    }
    dashboard.section.header.val = logo
    dashboard.section.header.opts.hl = "header"

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("q", "  Quit NVIM", "<cmd>qa<CR>"),
    }

    dashboard.section.footer.val = theta()

    alpha.setup(dashboard.opts)
    vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
      ]])

  end,
}
