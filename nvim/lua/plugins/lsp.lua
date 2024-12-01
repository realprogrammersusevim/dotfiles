return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'williamboman/mason.nvim',
        config = true,
      },
      { 'williamboman/mason-lspconfig.nvim', config = true },
      {
        'folke/neodev.nvim',
        filetype = 'lua',
        opts = {
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
          -- With lspconfig, Neodev will automatically setup your lua-language-server
          -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
          -- in your lsp start options
          lspconfig = true,
        },
      },
    },
    config = function()
      vim.diagnostic.config({
        underline = true,
        -- virtual_text = true,
        signs = true,
        update_in_insert = false,
      })

      local lsp = require('lspconfig')
      local capabilities =
        require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local on_attach = function(client, bufnr)
        if client.name == 'ruff' then
          -- Use the pyright hover
          client.server_capabilities.hoverProvider = false
        end
      end

      -- Setup lspconfig
      -- Python
      lsp.ruff.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lsp.pyright.setup({
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { '*' },
            },
          },
        },
      })

      -- Lua
      lsp.lua_ls.setup({
        capabilities = capabilities,
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
            completion = {
              displayContext = true,
            },
          },
        },
      })

      -- Bash
      lsp.bashls.setup({ capabilities = capabilities })

      -- Rust
      lsp.rust_analyzer.setup({
        capabilities = capabilities,
        settings = { ['rust-analyzer'] = { checkOnSave = true, check = { command = 'clippy' } } },
      })

      -- Markdown
      lsp.marksman.setup({
        capabilities = capabilities,
        -- single_file_support = false,
      })

      -- Go
      lsp.gopls.setup({ capabilities = capabilities })

      -- HTML
      lsp.html.setup({ capabilities = capabilities })

      -- C/C++
      lsp.clangd.setup({ capabilities = capabilities })

      lsp.fennel_ls.setup({ capabilities = capabilities })

      -- Swift
      lsp.sourcekit.setup({ capabilities = capabilities })

      -- Make sure the gutter diagnostic signs are nice symbols rather than letters
      local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- Format on save
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = buffer,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end,
  },
}
