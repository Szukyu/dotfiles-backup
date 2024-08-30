local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.color_scheme_dirs = { wezterm.home_dir .. "/projects/tokyonight.nvim/extras/wezterm" }
config.color_scheme = "tokyonight_night"
wezterm.add_to_config_reload_watch_list(config.color_scheme_dirs[1] .. config.color_scheme .. ".toml")

config.colors = {
  indexed = { [241] = "#65bcff" },
}

config.underline_thickness = 3
config.cursor_thickness = 4
config.underline_position = -6

config.font_size = 19
config.font = wezterm.font({ family = "Fira Code" })
config.bold_brightens_ansi_colors = true

config.default_cursor_style = "BlinkingBar"
config.force_reverse_video_cursor = true
config.scrollback_lines = 10000

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.75
config.macos_window_background_blur = 10

config.window_close_confirmation = 'NeverPrompt'

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

return config

