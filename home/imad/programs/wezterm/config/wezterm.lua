local wezterm = require 'wezterm'
return {
    default_prog = {"fish"},
    font_size = 20,
    line_height = 1.0,
    color_scheme = "AyuDark (Gogh)",
    tab_bar_at_bottom = true;
    window_background_opacity = 0.8,
    window_background_image = "./terafox.jpeg",
    text_background_opacity = 0.6,
    hide_tab_bar_if_only_one_tab = true,


 --   font = wezterm.font("FantasqueSansMono Nerd Font"),
    font = wezterm.font("Hasklug Nerd Font Mono"),

    font = wezterm.font_with_fallback {
      "Hasklug Nerd Font Mono",
      "FantasqueSansMono Nerd Font",
      "Fira Code", 
    },




    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
}
