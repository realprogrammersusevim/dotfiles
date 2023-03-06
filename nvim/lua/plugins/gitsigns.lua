return {
  'lewis6991/gitsigns.nvim', -- Git signs in the gutter
  event = 'BufRead',
  config = function()
    require('gitsigns').setup()
  end,
}
