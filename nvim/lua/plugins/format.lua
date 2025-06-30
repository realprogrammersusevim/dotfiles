return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = {
        lsp_format = 'prefer',
        timeout_ms = 500,
      },
      formatters = {
        prettier = {
          prepend_args = { '--prose-wrap', 'always' }
        }
      },
      formatters_by_ft = {
        markdown = { 'prettier' },
        html = { 'prettier' },
        javascript = { 'prettier' },
        yaml = { 'prettier' },
        bash = { 'shfmt' },
      }
    }
  }
}
