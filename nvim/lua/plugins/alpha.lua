return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  init = false,
  opts = function()
    local dashboard = require("alpha.themes.dashboard")

    -- Define gradient colors
    local colors = {
      "#5424b5",   -- Darker Purple
      "#5E35B1",   -- Deep Purple
      "#7E57C2",   -- Purple
      "#9575CD",   -- Medium Purple
      "#B39DDB",   -- Light Purple
      "#D1C4E9",   -- Very Light Purple
      "#E1D5F5",   -- Pale Purple
      "#F3E5F5",   -- Very Pale Purple
    }

    -- Set up dashboard header with gradient colors
    for i, color in ipairs(colors) do
      local hl_group = "NeovimDashboardLogo" .. i
      vim.api.nvim_set_hl(0, hl_group, { fg = color })
    end

    -- Customize dashboard sections
    dashboard.section.header.type = "group"
    dashboard.section.header.val = {
      { type = "text", val = "                                                                       ", opts = { shrink_margin = false, position = "center" }},
      { type = "text", val = "                                                                     ", opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" }},
      { type = "text", val = "       ████ ██████           █████      ██                     ", opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" }},
      { type = "text", val = "      ███████████             █████                             ", opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" }},
      { type = "text", val = "      █████████ ███████████████████ ███   ███████████   ", opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" }},
      { type = "text", val = "     █████████  ███    █████████████ █████ ██████████████   ", opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" }},
      { type = "text", val = "    █████████ ██████████ █████████ █████ █████ ████ █████   ", opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" }},
      { type = "text", val = "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ", opts = { hl = "NeovimDashboardLogo7", shrink_margin = false, position = "center" }},
      { type = "text", val = " ██████  █████████████████████ ████ █████ █████ ████ ██████ ", opts = { hl = "NeovimDashboardLogo8", shrink_margin = false, position = "center" }},
      { type = "padding", val = 1 },
    }

    -- Customize dashboard buttons
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Set highlight colors for buttons
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end

    -- Set highlight colors for sections
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    -- Define additional highlight groups
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#311B92" })    -- Dark Indigo
    vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#D1C4E9" })   -- Light Purple
    vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#8BC34A" })  -- Greenish
    vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#edd691" })    -- Light Yellow

    dashboard.opts.layout[1].val = 3
    return dashboard
  end,
  config = function(_, dashboard)
    -- Close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    -- Setup Alpha dashboard
    require("alpha").setup(dashboard.opts)

    -- Autocommand to show startup stats
    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "Neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
