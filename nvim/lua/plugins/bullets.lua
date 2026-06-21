return {
  {
    'dkarter/bullets.vim',
    ft = { 'markdown', 'text', 'typst', 'gitcommit' },
    config = function()
      vim.g.bullets_delete_last_bullet_if_empty = 1
      vim.g.bullets_pad_right = 0
    end,
  },
}
