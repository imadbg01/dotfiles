{pkgs,lib ,...}:

{
  
  programs.fish = {
    enable = true;

    shellInit = lib.fileContents ./config/init.fish;
    shellAbbrs = {
      es = "emacsclient -c -a emacs";
    };

    plugins =  [
    ];
  };
}
