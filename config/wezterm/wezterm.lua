-- Pull in the wezterm API
local wezterm = require 'wezterm'

local mux = wezterm.mux
local config = wezterm.config_builder()

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

config.color_scheme = 'Catppuccin Frappe'
config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 1
config.window_padding = {
    left = 3,
    right = 3,
    top = 3,
    bottom = 3,
}

return config
