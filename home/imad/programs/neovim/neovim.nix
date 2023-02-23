{ pkgs, lib, ... }:

{


  programs.neovim = {

    enable = true;
    viAlias = true;
    withNodeJs = false;
    withRuby = false;
    withPython3 = false;
    package = pkgs.neovim-nightly;

    plugins = with pkgs.vimPlugins; [

      plenary-nvim
      vim-nix
      nim-vim



      nvim-web-devicons
      nightfox-nvim


      nvim-treesitter



      nvim-lspconfig

      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp_luasnip
      friendly-snippets
      luasnip
      nvim-cmp
      cmp-vsnip
      cmp-nvim-lua
      lspkind-nvim
      nvim-autopairs


      glow-nvim

      telescope-nvim



      null-ls-nvim

      nvim-tree-lua

      lualine-nvim

      # colorizer
      {
        plugin = nvim-colorizer-lua;
        config = lib.fileContents ./config/colorizer.vim;
      }

      {
        plugin = dressing-nvim;
        config = lib.fileContents ./config/dressing.vim;
      }
      bufferline-nvim
      trouble-nvim


      # Haskell tools
      haskell-tools-nvim
    ];

    # extraConfig = lib.fileContents ./config/init.vim;
    extraLuaConfig = lib.fileContents ./config/init.lua;

    extraPackages = with pkgs; [
      tree-sitter
      ripgrep
      gopls
      zls
      rnix-lsp
      ltex-ls
      sumneko-lua-language-server
      stylua
      html-tidy
      nodePackages.stylelint
      cbfmt
      nixfmt
      dprint
    ];
  };

}
