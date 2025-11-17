local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.keys = {
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}

config.window_background_opacity = 0.8

config.colors = {
    split = '#00ff00', -- Red color for split lines (use any hex color code)
}
config.font = wezterm.font("JetBrains Mono")
config.font_size = 12

return config