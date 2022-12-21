vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
  update_in_insert = false,
})

require('mason').setup()
require('mason-lspconfig').setup()

require('neodev').setup({
  library = {
    enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
    -- these settings will be used for your Neovim config directory
    runtime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = true, -- installed opt or start plugins in packpath
    -- you can also specify the list of plugins to make available as a workspace library
    -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  },
  setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
  -- for your Neovim config directory, the config.library settings will be used as is
  -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
  -- for any other directory, config.library.enabled will be set to false
  override = function(root_dir, options) end,
  -- With lspconfig, Neodev will automatically setup your lua-language-server
  -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
  -- in your lsp start options
  lspconfig = true,
})

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
        -- library = vim.api.nvim_get_runtime_file('', true), -- Don't enable this, folke/neodev does this automatically and only for correct neovim files
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },

      semantic = {
        -- Treesitter highlighting is better
        enable = false,
      },
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
lspconfig.tailwindcss.setup({ capabilities = capabilities, on_attach = on_attach })

-- Yaml
lspconfig.yamlls.setup({ capabilities = capabilities, on_attach = on_attach })

-- Make sure the gutter diagnostic signs are nice symbols rather than letters
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
