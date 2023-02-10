{pkgs, ...}:


{
  programs.helix = {
    enable = true;

    languages = [

      {
        name = "nix";
        scope = "source.nix";
        file-types = [ "nix" ];
        roots = [ "flake.nix" "shell.nix" ".git" ];
        comment-token = "#";
        indent = { tab-width = 2; unit = " "; };
        language-server = { command = "rnix-lsp"; };
        auto-format = true;
        formatter = { command = "nixpkgs-fmt"; };
      }

    ];

    themes = {
      nightfox =
        let
          transparent = "none";
          black = "#393b44";
          red = "#c94f6d";
          red-dim = "#2f2837";
          green = "#81b2a9";
          green-dim = "#26343c";
          yellow = "#dbc074";
          yellow-bright = "#e0c989";
          blue = "#719cd6";
          blue-bright = "#86abdc";
          blue-dim = "#2f2837";
          magenta = "#9d79d6";
          magenta-bright = "#baa1e2";
          cyan = "#63cdcf";
          cyan-bright = "#7ad4d6";
          cyan-dim = "#253f4a";
          white = "#dfdfe0";
          orange = "#f4a261";
          orange-bright = "#f6b079";
          pink = "#d67ad2";
          pink-bright = "#dc8ed9";
          comment = "#738091";
        in
        {
          "ui.menu" = transparent;
          "ui.menu.selected" = { modifiers = [ "reversed" ]; };
          "ui.linenr" = { fg = transparent; bg = blue-bright; };
          "ui.popup" = { modifiers = [ "reversed" ]; };
          "ui.linenr.selected" = { fg = black; bg = white; modifiers = [ "bold" ]; };
          "ui.selection" = { fg = orange; bg = orange-bright; };
          "ui.selection.primary" = { modifiers = [ "reversed" ]; };
          "comment" = { fg = comment; };
          "ui.statusline" = { fg = white; bg = pink-bright; };
          "ui.statusline.inactive" = { fg = yellow; bg = black; };
          "ui.help" = { fg = blue-dim; bg = blue; };
          "ui.cursor" = { modifiers = [ "reversed" ]; };
          "variable" = red;
          "variable.builtin" = orange;
          "constant.numeric" = orange-bright;
          "constant" = cyan;
          "attributes" = yellow-bright;
          "type" = yellow;
          "ui.cursor.match" = { fg = yellow; modifiers = [ "underlined" ]; };
          "string" = blue-dim;
          "variable.other.member" = red;
          "constant.character.escape" = cyan;
          "function" = blue;
          "constructor" = pink-bright;
          "special" = blue-bright;
          "keyword" = magenta;
          "label" = magenta-bright;
          "namespace" = blue;
          "diff.plus" = green;
          "diff.delta" = green-dim;
          "diff.minus" = red-dim;
          "diagnostic" = { modifiers = [ "underlined" ]; };
          "ui.gutter" = { bg = transparent; };
          "info" = blue-dim;
          "hint" = orange-bright;
          "debug" = green;
          "warning" = yellow;
          "error" = red;
        };

    };

    # settings 
    #
    settings = {

      theme = "doom_acario_dark";

    };
  };

}
