return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufRead', 'BufNewFile' },
    main = 'ibl',
    opts = {
      exclude = {
        filetypes = {
          'markdown',
          'text',
          'help',
          'TelescopePrompt',
          'TelescopeResults',
          'gitcommit',
          '',
        },
      },
    },
  },
}
