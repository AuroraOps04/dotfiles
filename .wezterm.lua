local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Nord (base16)"
config.enable_tab_bar = false
config.window_background_opacity = 0.85
config.font_size = 13.0
config.font = wezterm.font_with_fallback({
	{ family = "FiraCode Nerd Font" },
	{ family = "JetBrainsMono Nerd Font" },
	{ family = "Source Han Sans CN" },
	{ family = "WenQuanYi Micro Hei" },
})
local color_schemes = wezterm.get_builtin_color_schemes()
local color_scheme = color_schemes["nord"]
-- -- color
config.color_schemes = color_schemes
-- config.padding = 0
-- color_scheme["ansi"][1] = "#1e131d"
--
config.window_padding = {
	left = 10,
	right = 0,
	top = 10,
	bottom = 0,
}
--
-- config.window_padding = 0
config.keys = {
	{
		key = "=",
		mods = "ALT",
		action = wezterm.action.IncreaseFontSize,
	},
	{
		key = "-",
		mods = "ALT",
		action = wezterm.action.DecreaseFontSize,
	},
}

return config
