{ config, pkgs, ... }:


{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "imad";
  home.homeDirectory = "/home/imad";

  imports = [
    ./programs/helix/helix.nix
    ./programs/neovim/neovim.nix
    ./programs/firefox/firefox.nix
    ./programs/git/git.nix
    ./programs/go/go.nix

  ];
  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;

    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;

    };
  };

  # xdg 
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      publicShare = null;
      templates = null;

      extraConfig = {

        XDG_DOTFILES_DIR = "${config.home.homeDirectory}/dotfiles";
        XDG_MISC_DIR = "${config.home.homeDirectory}/misc";
        XDG_BIN_DIR = "${config.home.homeDirectory}/bin";
        XDG_DEV_DIR = "${config.home.homeDirectory}/Dev";
        XDG_PROJECTS_DIR = "${config.home.homeDirectory}/Projects";
        XDG_WHATEVER_DIR = "${config.home.homeDirectory}/whatever";

      };

    };


  };

  # Packages that should install to user profile
  home.packages = with pkgs; [
    abook
    lynis
    curl
    wget
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

    bat
    fd
    zip
    xclip
    #widevine-cdm
    librewolf
    neofetch
    fira-code
    fira-code-symbols


    elixir
    zig
    gcc
    nodejs
    # Lsp
    rnix-lsp
    nixpkgs-fmt
    elixir_ls
    ltex-ls
    nil

    nodePackages_latest.typescript
    nodePackages_latest.typescript-language-server
    nodePackages_latest.bash-language-server
    nodePackages_latest.vscode-langservers-extracted

  ];



  # Home Manager elease.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
