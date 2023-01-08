require('mason')
local null_ls = require('null-ls')

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
    null_ls.builtins.code_actions.proselint,
    null_ls.builtins.code_actions.shellcheck,

    -- Completion
    null_ls.builtins.completion.spell.with({ filetypes = { 'markdown' } }),

    -- Diagnostics
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.diagnostics.gitlint,
    null_ls.builtins.diagnostics.checkmake,
    null_ls.builtins.diagnostics.vint,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.diagnostics.proselint,
    null_ls.builtins.diagnostics.write_good.with({
      extra_args = { '--tooWordy', '--cliches' },
    }),
    null_ls.builtins.diagnostics.jsonlint,

    -- Formatters
    null_ls.builtins.formatting.beautysh,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.stylua.with({
      extra_args = {
        '--config-path',
        vim.fn.expand('~/.config/nvim/utils/linter-config/.stylua.toml'),
      },
    }),
    null_ls.builtins.formatting.prettier.with({
      filetypes = { 'markdown', 'yaml', 'html' },
      extra_args = { '--prose-wrap', 'always' },
    }),
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.fixjson,
    null_ls.builtins.formatting.swiftformat,

    -- Hover defs
    null_ls.builtins.hover.dictionary,
    null_ls.builtins.hover.printenv,
  },

  update_in_insert = false,
})
