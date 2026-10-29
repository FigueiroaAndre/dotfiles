local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Palette taken from my iTerm2 setup
config.colors = {
	foreground = "#f2f2f2",
	background = "#101010",
	cursor_bg = "#f2f2f2",
	cursor_fg = "#101010",
	cursor_border = "#f2f2f2",
	selection_bg = "#3a3a3a",
	selection_fg = "#f2f2f2",
	ansi = { "#101010", "#dd9d8d", "#91af99", "#d4b199", "#a299c1", "#cd99be", "#d1829c", "#989898" },
	brights = { "#787878", "#e3807d", "#a8f0da", "#eabf98", "#aea6cc", "#d7a4c9", "#dc8fa9", "#f2f2f2" },
	tab_bar = {
		background = "#101010",
		active_tab = { bg_color = "#2a2a2a", fg_color = "#e796b1" },
		inactive_tab = { bg_color = "#1c1c1c", fg_color = "#989898" },
		inactive_tab_hover = { bg_color = "#1c1c1c", fg_color = "#989898" },
		new_tab = { bg_color = "#1c1c1c", fg_color = "#989898" },
		new_tab_hover = { bg_color = "#2a2a2a", fg_color = "#e796b1" },
	},
}
config.window_background_opacity = 0.9
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	"JetBrains Mono",
})

config.default_prog = { "zsh", "-l" }
config.prefer_to_spawn_tabs = true

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
