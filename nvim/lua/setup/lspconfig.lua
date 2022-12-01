vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
  update_in_insert = true,
})

require('mason').setup()
require('mason-lspconfig').setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup lspconfig
-- Python
require('lspconfig').pyright.setup({ capabilities = capabilities })
-- require('lspconfig').pylsp.setup({ capabilities = capabilities })

-- Lua
require('lspconfig').sumneko_lua.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- Shut up about the vim global
        globals = { 'vim' },
      },
    },
  },
})

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
