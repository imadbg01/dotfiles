{ pkgs, ... }:

{

  programs.git = {
    enable = true;
    userName = "imad";
    userEmail = "imadbg01@users.noreply.github.com";

    delta = {

      enable = true;

    };

    attributes = [

      "*.pdf diff=pdf"

    ];

    diff-so-fancy = {

      enable = false;

    };

    difftastic = {
      enable = false;

    };

  };

}
