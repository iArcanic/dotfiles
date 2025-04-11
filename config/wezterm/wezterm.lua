-- Wezterm API
local wezterm = require("wezterm")

-- Wezterm actions
local act = wezterm.action

-- Config variable
local config = wezterm.config_builder()

-- Colour scheme
config.color_scheme = "Gruvbox dark, medium (base16)"

-- Font
config.font = wezterm.font("JetBrains Mono")

-- Transparency
config.window_background_opacity = 0.85

-- Window decorations
config.window_decorations = "RESIZE"

-- Cursor style
config.default_cursor_style = "BlinkingBlock"

-- Key config
config.keys = {
	{
		key = "k",
		mods = "CMD",
		action = act.ClearScrollback("ScrollbackAndViewport"),
	},
}

return config
