local cmp = require('cmp')

-- Setup icons
local lspkind = require('lspkind')

-- Select first item by default
vim.opt.completeopt = 'menuone,noselect'

cmp.setup({
  -- Disable cmp in code comments
  -- enabled = function()
  -- disable completion if the cursor is `Comment` syntax group.
  -- return not cmp.config.context.in_syntax_group("Comment")
  -- end,
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'copilot' },
    { name = 'calc' },
    { name = 'emoji' },
    { name = 'nvim_lua' },
    { name = 'git' },
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = false,
      menu = {
        nvim_lsp = 'Lsp',
        buffer = 'Buf',
        luasnip = 'Snip',
        nvim_lua = 'Lua',
        path = 'Path',
        copilot = 'Copilot',
        calc = 'Calc',
        emoji = 'Emoji',
        git = 'Git',
      },
    }),
  },
  completion = { completeopt = 'menu,menuone,noinsert' },
  experimental = { ghost_text = true }, -- Shows the suggestion in italics. Esp. helpful for seeing the entire Copilot suggestion
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  -- filetype = { "markdown", "text", "org" },
  -- {
  -- 	sources = { name = "luasnip" },
  -- 	{ name = "path" },
  -- 	{ name = "buffer" },
  -- 	{ name = "copilot" },
  -- },
  -- { "gitcommit" },
})

require('mason').setup()
require('mason-lspconfig').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup lspconfig
-- Python
require('lspconfig').pyright.setup({ capabilities = capabilities })
-- require('lspconfig').pylsp.setup({ capabilities = capabilities })

-- Lua
require('lspconfig').sumneko_lua.setup({ capabilities = capabilities })

-- Bash
require('lspconfig').bashls.setup({ capabilities = capabilities })

-- Rust
require('lspconfig').rust_analyzer.setup({ capabilities = capabilities })

-- Markdown
require('lspconfig').marksman.setup({ capabilities = capabilities })

-- LaTex
require('lspconfig').texlab.setup({ capabilities = capabilities })

-- Grammarly
-- require('lspconfig').grammarly.setup({ capabilities = capabilities })

-- Vim
require('lspconfig').vimls.setup({ capabilities = capabilities })

-- Fennel
local lspconfig = require('lspconfig')
require('lspconfig.configs').fennel_language_server = {
  default_config = {
    -- replace it with true path
    cmd = { '/Users/jonathanmilligan/.cargo/bin/fennel-language-server' },
    filetypes = { 'fennel' },
    single_file_support = true,
    -- source code resides in directory `fnl/`
    root_dir = lspconfig.util.root_pattern('fnl'),
    settings = {
      fennel = {
        workspace = {
          -- If you are using hotpot.nvim or aniseed,
          -- make the server aware of neovim runtime files.
          library = vim.api.nvim_list_runtime_paths(),
        },
        diagnostics = { globals = { 'vim' } },
      },
    },
  },
}

lspconfig.fennel_language_server.setup({})

-- Make sure the gutter diagnostic signs are nice symbols rather than letters
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
