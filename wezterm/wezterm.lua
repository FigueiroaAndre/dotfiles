local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Approximation of the iTerm2 default (Dark Background) profile
config.colors = {
	foreground = "#c7c7c7",
	background = "#000000",
	cursor_bg = "#c7c7c7",
	cursor_fg = "#000000",
	cursor_border = "#c7c7c7",
	selection_bg = "#c1deff",
	selection_fg = "#000000",
	ansi = { "#000000", "#c91b00", "#00c200", "#c7c400", "#0225c7", "#c930c7", "#00c5c7", "#c7c7c7" },
	brights = { "#686868", "#ff6e67", "#5ffa68", "#fffc67", "#6871ff", "#ff77ff", "#60fdff", "#ffffff" },
}
config.window_background_opacity = 0.9
config.font = wezterm.font("JetBrains Mono")

config.default_prog = { "zsh", "-l" }

config.keys = {
	{ key = "t", mods = "ALT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "p", mods = "ALT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "n", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

return config
