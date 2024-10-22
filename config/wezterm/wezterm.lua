-- Pull in the wezterm API
local wezterm = require 'wezterm'

local mux = wezterm.mux
local config = wezterm.config_builder()

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

config.color_scheme = 'tokyonight_moon'
config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 1
config.window_padding = {
    left = 1,
    right = 1,
    top = 1,
    bottom = 1,
}

return config
