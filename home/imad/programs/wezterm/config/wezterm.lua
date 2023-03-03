local wezterm = require("wezterm")
return {
	default_prog = { "fish" },
	font_size = 20,
	line_height = 1.0,
	color_scheme = "tokyonight",
	tab_bar_at_bottom = true,
	window_background_opacity = 0.81,
	text_background_opacity = 0.9,
	hide_tab_bar_if_only_one_tab = true,

	--   font = wezterm.font("FantasqueSansMono Nerd Font"),
	--   --    font = wezterm.font("Hasklug Nerd Font Mono"),

	font = wezterm.font_with_fallback({
		"Hasklug Nerd Font Mono",
		"FantasqueSansMono Nerd Font",
		"Fira Code",
	}),

	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
}
