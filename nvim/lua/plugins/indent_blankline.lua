return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    opts = {
      show_current_context = true,
      filetype_exclude = {
        'markdown',
        'text',
        'help',
        'TelescopePrompt',
        'TelescopeResults',
        '',
      },
      show_current_context_start = true,
      use_treesitter_scope = true,
    },
  },
}
