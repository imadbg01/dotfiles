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
      neovim-ayu

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

      nvim-colorizer-lua

      bufferline-nvim
      trouble-nvim

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
      haskell-language-server
      haskellPackages.hls-ormolu-plugin
    ];
  };

}
