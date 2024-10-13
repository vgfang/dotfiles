local wezterm = require("wezterm")
local config = wezterm.config_builder()
local home = os.getenv("HOME")

function GetOS()
	-- Unix, Linux variants
	local fh, _ = assert(io.popen("uname -o 2>/dev/null", "r"))
	local osname = nil
	if fh then
		osname = fh:read()
	end

	return osname or "Windows"
end

config.colors = {
	cursor_bg = "#ffffff",
	cursor_border = "#ffffff",
}
-- config.color_scheme = "Tokyo Night"
config.color_scheme = "Kanagawa (Gogh)"

if GetOS() == "Windows" then
	-- if in windows launch wsl:ubuntu instead of powershell
	config.wsl_domains = {
		{
			name = "WSL:Ubuntu",
			distribution = "Ubuntu",
		},
	}
	config.default_domain = "WSL:Ubuntu"
end

config.initial_cols = 84
config.initial_rows = 24
config.font_size = 14

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- config.window_background_image = home .. "/.config/wezterm/wallpaper-mixed.png"
-- config.window_background_image_hsb = {
-- 	brightness = 1.0,
-- 	hue = 1.0,
-- 	saturation = 1.0,
-- }

return config
