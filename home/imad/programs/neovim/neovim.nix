{pkgs, lib , ...}:

{

  programs.neovim = {

    enable = true;
    viAlias = true;
    withNodeJs = false;
    withRuby = false;
    withPython3 = true;

    plugins = with pkgs.vimPlugins; [
	
	vim-nix

        {
          plugin = nightfox-nvim ;
          config = lib.fileContents ./config/colors.vim;

        }

    ];

    extraConfig = lib.fileContents ./config/init.vim; 

  };

}
