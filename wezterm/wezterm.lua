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
config.font = wezterm.font_with_fallback({  "FiraCode Nerd Font Mono", "Noto Color Emoji", "WenQuanYi Micro Hei Mono" })
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.80
config.initial_cols = 120
config.initial_rows = 36
config.font_size = 14
-- config.background = {
-- 	height = "1cell",
-- 	opacity = 0.75,
-- }

return config
