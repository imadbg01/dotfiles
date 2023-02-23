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


      # md preview
      {
        plugin = glow-nvim;
        config = lib.fileContents ./config/glow.vim;
      }

      # Telescope
      {
        plugin = telescope-nvim;
        config = lib.fileContents ./config/telescope.vim;
      }



      # null-ls
      {
        plugin = null-ls-nvim;
        config = lib.fileContents ./config/null_ls.vim;

      }

      # colorizer
      {
        plugin = nvim-colorizer-lua;
        config = lib.fileContents ./config/colorizer.vim;
      }

      {
        plugin = dressing-nvim;
        config = lib.fileContents ./config/dressing.vim;
      }
      # bufferline
      {
        plugin = bufferline-nvim;
        config = lib.fileContents ./config/bufferline.vim;
      }
      {
        plugin = trouble-nvim;
        config = lib.fileContents ./config/trouble.vim;

      }

      {
        plugin = nvim-tree-lua;
        config = lib.fileContents ./config/tree.vim;
      }
      {
        plugin = alpha-nvim;
        config = lib.fileContents ./config/alpha.vim;
      }
      {
        plugin = lualine-nvim;
        config = lib.fileContents ./config/lualine.vim;
      }
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
      nixpkgs-fmt
      ltex-ls
      sumneko-lua-language-server
      stylua
    ];
  };

}
