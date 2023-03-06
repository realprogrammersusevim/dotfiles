return {
  'numToStr/Comment.nvim', -- Comment stuff out
  event = 'BufRead',
  config = function()
    require('Comment').setup()
  end,
}
