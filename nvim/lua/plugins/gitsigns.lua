return {
  {
    'lewis6991/gitsigns.nvim', -- Git signs in the gutter
    event = 'VeryLazy',
    -- cond = function()
    --   if vim.fn.system('git rev-parse --is-inside-work-tree 2>/dev/null') == 'true' then
    --     return true
    --   else
    --     return false
    --   end
    -- end,
    config = true,
  },
}
