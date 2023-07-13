return {
  {
    'lewis6991/gitsigns.nvim', -- Git signs in the gutter
    event = { 'BufNew', 'BufRead' },
    -- cond = function()
    --   if vim.fn.system('git rev-parse --is-inside-work-tree') == 'true' then
    --     print('true')
    --     return true
    --   else
    --     print('false')
    --     return false
    --   end
    -- end,
    config = true,
  },
}
