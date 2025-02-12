return {
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    opts = {
      dependencies_bin = { ['tinymist'] = 'tinymist' }, -- Use Mason installed binary
    },
  },
}
