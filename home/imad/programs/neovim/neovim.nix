{pkgs, ...}:

{

  programs.neovim = {

    enable = true;
    viAlias = true;
    withNodeJs = false;
    withRuby = false;
    withPython3 = true;

    plugins = with pkgs.vimPlugins; [
	
	vim-nix


    ];

    extraConfig = ''

                  set number
                  set relativenumber

                  '';


  };

}
