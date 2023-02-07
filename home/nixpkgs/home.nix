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
home.packages =  with pkgs; [
        abook
        curl
        lsd
        wezterm
        fish
        yt-dlp
        fd
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
        #widevine-cdm
        urlscan
        urlview

        git
        go
        elixir
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
  # Home Manager elease.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
 
}
