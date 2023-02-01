local wezterm = require("wezterm")

return {

	-- UI
	font_size = 19,
	color_scheme = "Gruvbox dark, hard (base16)",
	tab_bar_at_bottom = true,
	window_background_opacity = 0.8,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	-- Keys

	keys = {
		{
			key = "s",
			mods = "ALT",
			action = wezterm.action.SplitPane({
				direction = "Right",
				size = { Percent = 50 },
			}),
		},
		{
			key = "s",
			mods = "ALT | SHIFT",
			action = wezterm.action.SplitPane({
				direction = "Down",
				size = { Percent = 50 },
			}),
		},

		{
			key = "x",
			mods = "ALT",
			action = wezterm.action.CloseCurrentPane({
				confirm = false,
			}),
		},
		{
			key = "l",
			mods = "ALT",
			action = wezterm.action.ActivatePaneDirection("Next"),
		},
		{
			key = "l",
			mods = "ALT | SHIFT",
			action = wezterm.action.ActivatePaneDirection("Prev"),
		},
	},
}
