vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
  update_in_insert = false,
})

require('mason').setup()
require('mason-lspconfig').setup()

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local navic = require('nvim-navic')
local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

-- Setup lspconfig
-- Python
lspconfig.pyright.setup({ capabilities = capabilities, on_attach = on_attach })

-- Lua
lspconfig.sumneko_lua.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Shut up about the vim global
        globals = { 'vim' },
      },
      runtime = {
        -- Tell the language server where to look for Lua libraries
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
})

-- Bash
lspconfig.bashls.setup({ capabilities = capabilities, on_attach = on_attach })

-- Rust
lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { checkOnSave = { command = 'clippy' } },
})

-- Markdown
lspconfig.marksman.setup({ capabilities = capabilities, on_attach = on_attach })

-- LaTex
lspconfig.texlab.setup({ capabilities = capabilities, on_attach = on_attach })

-- Grammarly
-- lspconfig.grammarly.setup({ capabilities = capabilities })

-- Vim
lspconfig.vimls.setup({ capabilities = capabilities, on_attach = on_attach })

-- Go
lspconfig.gopls.setup({ capabilities = capabilities, on_attach = on_attach })

-- HTML
lspconfig.html.setup({ capabilities = capabilities, on_attach = on_attach })

-- Make sure the gutter diagnostic signs are nice symbols rather than letters
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
