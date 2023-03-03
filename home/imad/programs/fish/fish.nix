{pkgs,lib ,...}:

{
  
  programs.fish = {
    enable = true;

    shellInit = lib.fileContents ./config/init.fish;
    shellAbbrs = {
      es = "emacsclient -c -a emacs";
    };

    functions = {

      mvco = {
        description = "mark the challenge as complete";
        body = "mv $argv{, _COMPLETE}"; 
      };
    };

    plugins =  [
    ];
  };
}
