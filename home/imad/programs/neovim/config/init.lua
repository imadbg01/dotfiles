----------------------------------------------
-- personal neovim config running on NixOs    |
-- imad boudguige                             |
-- 22 / 02/ 2023                              |
-- -------------------------------------------
-- table on content
--
--  1- General config
--      - options
--      - keymaps
--      - autocmds
--
--  2- Plugins
--     - colorscheme
--

------------------------------
--
-- Global leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- options
vim.opt.autowrite = true -- Enable auto write
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.completeopt = { "menu,menuone,noselect" }
vim.opt.conceallevel = 3 -- Hide * markup for bold and italic
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true -- Ignore case
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.number = true -- Print line number
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.shortmess:append({ W = true, I = true, c = true })
vim.opt.showmode = false -- Dont show mode since we have a statusline
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200 -- Save swap file and trigger CursorHold
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.winminwidth = 5 -- Minimum window width
vim.opt.wrap = true
vim.g.markdown_recommended_style = 0

------------
-- keymaps
------------

-- better Up Down
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Move lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==")
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==")

vim.keymap.set("i", "<A-j>", "<cmd>m .+1<cr>==gi")
vim.keymap.set("i", "<A-j>", "<cmd>m .+1<cr>==gi")

vim.keymap.set("v", "<A-j>", "<cmd>m .+1<cr>==gv")
vim.keymap.set("v", "<A-j>", "<cmd>m .+1<cr>==gv")

-- save file
vim.keymap.set({ "n", "v" }, "<leader>w", "<cmd>w<cr>", { silent = true })

-------------------------------
-- Plugins
-------------------------------
--

-- colorsheme

require("nightfox").setup({

  options = {
    transparent = true,
  },
})

vim.cmd("colorscheme terafox")
vim.g.lightline = { colorscheme = "terafox" }

-- treesitter

vim.opt.runtimepath:append("/home/imad/.local/treesitter/parsers")

require("nvim-treesitter.configs").setup({
  parser_install_dir = "/home/imad/.local/treesitter/parsers",
  ensure_installed = {
    "elixir",
    "lua",
    "vim",
    "go",
    "html",
    "css",
    "typescript",
    "zig",
    "help",
    "nix",
    "bash",
    "fish",
    "toml",
  },
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

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
})

------------
-- Lsp
------------

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

local servers = {
  "tsserver",
  "rnix",
  "cssls",
  "bashls",
  "gopls",
  "html",
  "jsonls",
  "ltex",
  "svelte",
  "vimls",
  "zls",
  "elmls",
  "emmet_ls",
  "nimls",
}

for _, lsp in pairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

lspconfig.elixirls.setup({
  cmd = { "/home/imad/.nix-profile/bin/elixir-ls" },
  capabilities = capabilities,
  on_attach = on_attach,
})

require("lspconfig").sumneko_lua.setup({

  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "lua" },
  cmd = { "lua-language-server" },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

-------------------
-- autocompletion
-------------------
--
-- luasnip setup
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
-- nvim-cmp setup
local cmp = require("cmp")
local lspkind = require('lspkind')
cmp.setup({

  enabled = function()
    -- disable completion in comments
    local context = require("cmp.config.context")
    -- keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == "c" then
      return true
    else
      return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
    end
  end,

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
    ["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "vsnip" },
    { name = "path" },
    { name = "nvim_lua" },
    { name = "buffer", keyword_length = 2 },
    { name = "nvim_lsp", keyword_length = 1 },
    { name = "luasnip", keyword_length = 3 },
  },
  view = {
    entries = { name = "custom", selection_order = "near_cursor" },
  },
   formatting = {
    format = lspkind.cmp_format({
    mode = "symbol_text",
    menu = ({
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      luasnip = "[LuaSnip]",
      nvim_lua = "[Lua]",
      latex_symbols = "[Latex]",
    })
  }),
  },
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

------------
-- autopairs
-------------

require("nvim-autopairs").setup({})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- ------












