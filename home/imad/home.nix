{ config, pkgs, ... }:


{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "imad";
  home.homeDirectory = "/home/imad";

  imports = [
    ./programs/neovim/neovim.nix
    ./programs/wezterm/wezterm.nix
    ./programs/bash/bash.nix
    ./programs/firefox/firefox.nix
    ./programs/git/git.nix
    ./programs/go/go.nix
    ./programs/fish/fish.nix
    ./programs/starship/starship.nix
  ];

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
    zeal
    prowlarr
    file 
    killall

    vlc
    ffmpeg_5
    pitivi
    imagemagick
    simplescreenrecorder
    digikam
    bat
    fd
    zip
    unzip
    xclip
    ripgrep
    bats
    #widevine-cdm
    librewolf
    neofetch
    pfetch
    fira-code
    fira-code-symbols


    python3
    elixir
    erlang
    elixir_ls
    zig
    gcc
    nodejs
    elmPackages.elm
    python310Packages.jupyterlab

  ];

  programs.bottom = {
    enable = true;
  };


  # Home Manager elease.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };



}
