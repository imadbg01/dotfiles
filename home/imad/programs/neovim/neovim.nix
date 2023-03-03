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

      nvim-web-devicons
      nightfox-nvim
      neovim-ayu
      tokyonight-nvim

      nvim-treesitter

      nvim-lspconfig
      lsp-format-nvim

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

      nvim-tree-lua

      lualine-nvim

      nvim-colorizer-lua

      bufferline-nvim

      nvim-notify
      noice-nvim
      nui-nvim
      dressing-nvim

      gitsigns-nvim
      diffview-nvim

      trouble-nvim

    ];

    # extraConfig = lib.fileContents ./config/init.vim;
    extraLuaConfig = lib.fileContents ./config/init.lua;
    extraPackages = with pkgs; [
      tree-sitter
      gopls
    ];
  };

}
