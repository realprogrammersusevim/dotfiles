require('null-ls').setup({
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
    require('null-ls').builtins.diagnostics.shellcheck,
    require('null-ls').builtins.diagnostics.gitlint,
    require('null-ls').builtins.diagnostics.checkmake,
    require('null-ls').builtins.diagnostics.luacheck.with({
      extra_args = { '--config' },
    }), -- require('null-ls').builtins.diagnostics.mypy,
    require('null-ls').builtins.diagnostics.vint,
    require('null-ls').builtins.diagnostics.yamllint,
    require('null-ls').builtins.diagnostics.proselint,
    require('null-ls').builtins.diagnostics.write_good.with({
      extra_args = { '--tooWordy', '--cliches' },
    }),
    require('null-ls').builtins.formatting.beautysh,
    require('null-ls').builtins.formatting.black,
    require('null-ls').builtins.formatting.isort,
    require('null-ls').builtins.formatting.lua_format,
    require('null-ls').builtins.formatting.stylua.with({
      extra_args = {
        '--config-path',
        vim.fn.expand('~/.config/nvim/utils/linter-config/.stylua.toml'),
      },
    }),
    require('null-ls').builtins.formatting.prettier.with({
      filetypes = { 'markdown', 'yaml' },
      extra_args = { '--prose-wrap', 'always' },
    }),
    require('null-ls').builtins.hover.dictionary,
    require('null-ls').builtins.hover.printenv,
  },
})
