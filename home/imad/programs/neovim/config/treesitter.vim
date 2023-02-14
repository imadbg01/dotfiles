lua << EOF

vim.opt.runtimepath:append("/home/imad/.local/treesitter/parsers")


  require'nvim-treesitter.configs'.setup {
    parser_install_dir = "/home/imad/.local/treesitter/parsers",
      ensure_installed = { "elixir", "lua", "vim","go","html", "css", "typescript", "zig", "help", "nix", "bash", "fish", "toml" },
        auto_install = true,
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  }

EOF
