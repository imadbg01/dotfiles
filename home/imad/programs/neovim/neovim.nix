{pkgs, lib , ...}:

{

  
  programs.neovim = {

    enable = true;
    viAlias = true;
    withNodeJs = false;
    withRuby = false;
    withPython3 = true;

    plugins = with pkgs.vimPlugins; [
	
    plenary-nvim
  	vim-nix
    nvim-cmp
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline
    cmp_luasnip
    luasnip

    nvim-web-devicons
        {
          plugin = nightfox-nvim ;
          config = lib.fileContents ./config/colors.vim;

        }

        # tree-sitter

        {

          plugin = nvim-treesitter;
          config = lib.fileContents ./config/treesitter.vim;
        }

        {
          plugin = telescope-nvim;
          config = lib.fileContents ./config/telescope.vim;
        }

        {
          plugin = nvim-lspconfig;
          config = lib.fileContents ./config/lsp.vim;
        }

        {
          plugin = lualine-nvim;
          config = lib.fileContents ./config/lualine.vim;
        }
        {
          plugin = bufferline-nvim;
          config = lib.fileContents ./config/bufferline.vim;
        }
        {
          plugin = trouble-nvim;
          config = lib.fileContents ./config/trouble.vim;

        }

        {
          plugin = nvim-autopairs;
          config = lib.fileContents ./config/autopairs.vim;
        }
        {
          plugin = nvim-tree-lua;
          config = lib.fileContents ./config/tree.vim;
        }
    ];
    
    extraConfig = lib.fileContents ./config/init.vim; 

    extraPackages = with pkgs; [
      tree-sitter
      ripgrep
      gopls
      zls
      rnix-lsp
      nixpkgs-fmt
      ltex-ls
      nil

      nodePackages_latest.typescript
      nodePackages_latest.typescript-language-server
      nodePackages_latest.bash-language-server
      nodePackages_latest.vscode-langservers-extracted
      # elm
      elmPackages.elm-language-server
      elmPackages.elm-verify-examples
      elmPackages.elm-doc-preview
      elmPackages.nodejs
      elmPackages.elm-xref
      elmPackages.elm-test
      elmPackages.elm-live
      elmPackages.elm-review
      elmPackages.elm-format
  
    ];
  };

}
