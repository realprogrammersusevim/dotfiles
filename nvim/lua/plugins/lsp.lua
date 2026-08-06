return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'saghen/blink.cmp' },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local on_attach = function(client, bufnr)
        if client.name == 'ruff' then
          -- Use the pyright hover
          client.server_capabilities.hoverProvider = false
        end
      end

      -- Buffer-local LSP keymaps: only registered once a server actually
      -- attaches, so they no longer fire as no-ops in LSP-less buffers (Roslyn
      -- is slow to attach on a solution the size of BTNet). Navigation is routed
      -- through Telescope where a fuzzy-filterable picker beats the quickfix.
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local buf = args.buf
          local map = function(lhs, rhs, desc)
            vim.keymap.set('n', lhs, rhs, { buffer = buf, silent = true, desc = desc })
          end

          map('<leader>ln', vim.lsp.buf.rename, 'Re[n]ame')
          map('<leader>li', vim.lsp.buf.hover, '[i]nformation')
          map('<leader>ld', '<CMD>Telescope lsp_definitions<CR>', '[d]efinition')
          map('<leader>lD', vim.lsp.buf.declaration, '[D]eclaration')
          map('<leader>lm', '<CMD>Telescope lsp_implementations<CR>', 'I[m]plementation')
          map('<leader>lq', '<CMD>Telescope lsp_references<CR>', '[r]eferences')
          map('<leader>lt', '<CMD>Telescope lsp_type_definitions<CR>', '[t]ype definition')
          map('<leader>ls', '<CMD>Telescope lsp_document_symbols<CR>', 'document [s]ymbols')
          map('<leader>lS', '<CMD>Telescope lsp_dynamic_workspace_symbols<CR>',
            'workspace [S]ymbols')
          map('<leader>le', vim.diagnostic.open_float, '[e]rrors')
          map('<leader>la', vim.lsp.buf.code_action, 'Code [a]ction')
        end,
      })

      -- Setup lspconfig
      local servers = {
        ruff = {
          on_attach = on_attach,
        },
        ty = {},
        pyright = {
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
        },
        lua_ls = {
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
                  call_arg_parentheses = 'always',
                  max_line_length = '88',
                  break_all_list_when_line_exceed = 'true'
                },
              },
            },
          },
        },
        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = { checkOnSave = true, check = { command = 'clippy' } }
          },
        },
        marksman = {},
        clangd = {},
        ts_ls = {},
        tinymist = {
          settings = {
            formatterMode = 'typstyle',
            semanticTokens = 'disable',
            formatterProseWrap = true,
            formatterPrintWidth = 88
          },
        },
        harper_ls = {},
      }

      for name, config in pairs(servers) do
        config.capabilities = config.capabilities or capabilities
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
      end

      vim.diagnostic.config({
        severity_sort = true,
        update_in_insert = false,
        -- Full diagnostic text under the cursor line only: visible when you need
        -- it (C# compiler errors are easy to miss) without the always-on noise of
        -- virtual_text across the whole buffer.
        virtual_lines = { current_line = true },
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
