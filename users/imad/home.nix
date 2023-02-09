{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "imad";
  home.homeDirectory = "/home/imad";

  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;

    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;

    };
  };
  # Packages that should install to user profile
  home.packages = with pkgs; [
    curl
    wezterm
    fish
    yt-dlp
    gnome.gnome-tweaks
    gnome.dconf-editor
    zeal

    vlc
    ffmpeg_5
    pitivi
    imagemagick

    apg
    bat
    zip
    xclip
    urlscan
    urlview
    librewolf
    neofetch
    fira-code
    fira-code-symbols


    git
    gcc
    go
    elixir

    # Lsp
    rnix-lsp
    nixpkgs-fmt
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemtry = true;



      };

    };
  };

  # HELIX
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


  # Neovim 

  programs.neovim = {
    enable = true;
    viAlias = true;

    plugins = with pkgs.vimPlugins; [
      vim-sensible

      vim-elixir
      vim-nix



      # theme
      nightfox-nvim
      # treesitter
      nvim-treesitter


      # Lsp
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-path
      cmp-cmdline
      cmp-buffer
      luasnip
      cmp_luasnip


    ];

    extraConfig = ''
      luafile ./apps/nvim/lua/settings.lua
      luafile ./apps/nvim/lua/colors.lua
      luafile ./apps/nvim/lua/keymaps.lua
      luafile ./apps/nvim/lua/autocmds.lua
             
      luafile ./apps/nvim/lua/plugins/treesitter.lua

      lua << EOF
      vim.defer_fn(function()
      vim.cmd [[
        luafile  ./apps/nvim/lua/lsp/lsp.lua
      ]]
        end,75)
      EOF
    '';

    extraPackages = with pkgs; [


      nodejs
      tree-sitter
      # LANGUAGE SERVERS
      #
      # bash
      nodePackages.bash-language-server
      # elixir
      beam.packages.erlang.elixir_ls
      # erlang
      beam.packages.erlang.erlang-ls
      #
      # Nix
      rnix-lsp
      nixpkgs-fmt
      statix
      ripgrep
      fd
      nodePackages.typescript-language-server
      pyright

    ];
  };
  # Home Manager elease.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
