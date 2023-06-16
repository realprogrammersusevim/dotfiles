return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufRead', 'BufNewFile' },
    opts = {
      show_current_context = true,
      filetype_exclude = {
        'markdown',
        'text',
        'help',
        'TelescopePrompt',
        'TelescopeResults',
        'gitcommit',
        '',
      },
      show_current_context_start = true,
      use_treesitter_scope = true,
    },
  },
}
