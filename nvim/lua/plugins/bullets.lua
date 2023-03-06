return {
  'dkarter/bullets.vim',
  config = function()
    vim.g.bullets_enabled_file_types = { 'markdown', 'text', 'gitcommit', 'scratch' }
    vim.g.bullets_delete_last_bullet_if_empty = 1
    vim.g.bullets_pad_right = 0
  end,
  ft = 'markdown',
}
