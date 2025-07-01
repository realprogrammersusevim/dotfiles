return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'saghen/blink.cmp' },
    },
    config = function()
      vim.diagnostic.config({
        underline = true,
        -- virtual_text = true,
        signs = true,
        update_in_insert = false,
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local on_attach = function(client, bufnr)
        if client.name == 'ruff' then
          -- Use the pyright hover
          client.server_capabilities.hoverProvider = false
        end
      end

      -- Setup lspconfig
      -- Python
      vim.lsp.config('ruff', {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable('ruff')
      vim.lsp.config('pyright', {
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
      vim.lsp.enable('pyright')

      -- Lua
      vim.lsp.config('lua_ls', {
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
            format = {
              enable = true,
              defaultConfig = {
                indent_style = 'space',
                indent_size = '2',
                quote_style = 'single',
                call_arg_parentheses = 'always'
              },
            },
          },
        },
      })
      vim.lsp.enable('lua_ls')

      -- Rust
      vim.lsp.config('rust_analyzer', {
        capabilities = capabilities,
        settings = { ['rust-analyzer'] = { checkOnSave = true, check = { command = 'clippy' } } },
      })
      vim.lsp.enable('rust_analyzer')

      -- Markdown
      vim.lsp.config('marksman', {
        capabilities = capabilities,
        -- single_file_support = false,
      })
      vim.lsp.enable('marksman')

      -- C/C++
      vim.lsp.config('clangd', { capabilities = capabilities })
      vim.lsp.enable('clangd')

      vim.lsp.config('ts_ls', { capabilities = capabilities })
      vim.lsp.enable('ts_ls')

      vim.lsp.config('tinymist', {
        capabilities = capabilities,
        settings = {
          formatterMode = 'typstyle',
          exportPdf = 'onType',
          semanticTokens = 'disable',
        },
      })
      vim.lsp.enable('tinymist')

      vim.lsp.config('harper_ls', { capabilities = capabilities })
      vim.lsp.enable('harper_ls')

      vim.diagnostic.config({
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        },
      })
    end,
  },
}
