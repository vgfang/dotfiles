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
config.color_scheme = "Tokyo Night"

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

config.window_background_image = home .. "/.config/wezterm/wallpaper-mixed.png"
config.window_background_image_hsb = {
	brightness = 1.0,
	hue = 1.0,
	saturation = 1.0,
}

return config
