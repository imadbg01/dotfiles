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

        # tree-sitter

        {

          plugin = nvim-treesitter.withAllGrammars;
          config = lib.fileContents ./config/treesitter.vim;
        }

        {
          plugin = telescope-nvim;
          config = lib.fileContents ./config/telescope.vim;
        }
    ];
    
    extraConfig = lib.fileContents ./config/init.vim; 

    extraPackages = with pkgs; [
      tree-sitter
      ripgrep
  
    ];
  };

}
