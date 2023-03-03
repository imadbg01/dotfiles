{ pkgs, ... }:

{

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemtry = true;

      };
      extraNativeMessagingHosts = with pkgs.nur.repos.wolfangaukang;
        [ vdhcoapp ];
    };
  };

  home.packages = with pkgs.nur.repos.wolfangaukang; [ vdhcoapp ];

}
