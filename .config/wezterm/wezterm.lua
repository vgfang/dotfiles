local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.colors = {
	cursor_bg = "#ffffff",
	cursor_border = "#ffffff",
}
config.color_scheme = "tokyonight-storm"

config.wsl_domains = {
	{
		name = "WSL:Ubuntu",
		distribution = "Ubuntu",
	},
}
config.default_domain = "WSL:Ubuntu"
config.window_background_image = "./wallpaper-mixed.png"
config.window_background_image_hsb = {
	brightness = 1.0,
	hue = 1.0,
	saturation = 1.0,
}

return config
