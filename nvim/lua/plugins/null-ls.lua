return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufRead',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
    },
    config = function()
      require('mason')
      local null_ls = require('null-ls')
      local diagnostics = require('null-ls').builtins.diagnostics
      local actions = require('null-ls').builtins.code_actions
      local formatting = require('null-ls').builtins.formatting
      local hover = require('null-ls').builtins.hover

      null_ls.setup({
        on_attach = function(client, bufnr)
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
        sources = {
          -- Code actions
          actions.proselint,
          actions.shellcheck,

          -- Completion
          -- null_ls.builtins.completion.spell.with({ filetypes = { 'markdown' } }),

          -- Diagnostics
          diagnostics.shellcheck,
          diagnostics.gitlint,
          diagnostics.checkmake,
          diagnostics.vint,
          diagnostics.yamllint,
          diagnostics.proselint,
          diagnostics.write_good.with({
            extra_args = { '--tooWordy' },
          }),
          diagnostics.jsonlint,

          -- Formatters
          formatting.beautysh,
          formatting.black,
          formatting.isort,
          formatting.stylua.with({
            extra_args = {
              '--config-path',
              vim.fn.expand('~/.config/nvim/utils/linter-config/.stylua.toml'),
            },
          }),
          formatting.prettier.with({
            filetypes = { 'markdown', 'yaml', 'html' },
            extra_args = { '--prose-wrap', 'always' },
          }),
          formatting.rustfmt,
          formatting.goimports,
          formatting.gofmt,
          formatting.fixjson,
          -- formatting.swiftformat,

          -- Hover defs
          hover.dictionary,
          hover.printenv,
        },
        update_in_insert = false,
      })
    end,
  },
}
