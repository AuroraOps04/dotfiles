local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.window_padding = {
  top = 0,
  right = 0,
  bottom = 0,
  left = 8,
}
config.color_scheme = "AdventureTime"
config.font = wezterm.font_with_fallback({ "FiraCode Nerd Font Mono", "Noto Color Emoji" })
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.75

return config
