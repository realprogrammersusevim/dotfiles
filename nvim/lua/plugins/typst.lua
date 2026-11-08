return {
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    opts = {
      dependencies_bin = { ['tinymist'] = 'tinymist' }, -- Use Mason installed binary
    },
    -- ft-scoped so these don't exist (and can't preview the raw file) in
    -- markdown buffers, which use <leader>pm / <leader>pM instead.
    keys = {
      { '<leader>pt', '<CMD>TypstPreview<CR>', ft = 'typst', desc = 'Typst preview' },
      { '<leader>pT', '<CMD>TypstPdf<CR>', ft = 'typst', desc = 'Typst PDF in sioyek' },
    }
  },
}
