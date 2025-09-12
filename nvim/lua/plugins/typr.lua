return {
  {
    'nvzone/typr',
    dependencies = 'nvzone/volt',
    cmd = { 'Typr', 'TyprStats' },
    config = function()
      require('typr').setup({})
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'typr',
        callback = function()
          vim.b.completion = false
        end,
      })
    end
  }
}
