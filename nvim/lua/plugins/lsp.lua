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
        elseif client.name == 'r_language_server' then
          -- R.nvim's built-in server covers these (and completes from the live R
          -- session), so only keep languageserver for lintr diagnostics and styler
          for _, cap in ipairs({
            'completionProvider',
            'hoverProvider',
            'signatureHelpProvider',
            'definitionProvider',
            'referencesProvider',
            'implementationProvider',
            'documentHighlightProvider',
            'documentSymbolProvider',
            'workspaceSymbolProvider',
            'renameProvider',
          }) do
            client.server_capabilities[cap] = false
          end
        end
      end

      -- Roslyn's apphost hardcodes /usr/local/share/dotnet, which holds a stale x86_64
      -- .NET 6, so it dies on arm64. Run the dll with Homebrew's host instead.
      local function roslyn_cmd()
        local host = '/opt/homebrew/opt/dotnet/libexec/dotnet'
        local dlls = vim.fn.glob(
          vim.fn.expand('~/.dotnet/tools/.store/roslyn-language-server')
          .. '/*/*/*/tools/net*/*/Microsoft.CodeAnalysis.LanguageServer.dll',
          false,
          true
        )
        if vim.fn.executable(host) == 0 or #dlls == 0 then
          return nil -- fall back to lspconfig's default cmd
        end
        table.sort(dlls)
        return { host, dlls[#dlls], '--stdio' }
      end

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
        -- Requires: dotnet tool install --global roslyn-language-server --prerelease
        roslyn_ls = {
          cmd = roslyn_cmd(),
        },
        tinymist = {
          settings = {
            formatterMode = 'typstyle',
            semanticTokens = 'disable',
            formatterProseWrap = true,
            formatterPrintWidth = 88
          },
        },
        harper_ls = {},
        -- Requires: install.packages("languageserver") in R
        r_language_server = {
          on_attach = on_attach,
          -- lspconfig falls back to $HOME outside a git repo, which makes languageserver
          -- index the whole home directory; use the file's directory instead
          root_dir = function(bufnr, on_dir)
            on_dir(vim.fs.root(bufnr, '.git') or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
          end,
        },
      }

      for name, config in pairs(servers) do
        config.capabilities = config.capabilities or capabilities
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
      end

      vim.diagnostic.config({
        severity_sort = true,
        update_in_insert = false,
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
