return {
  'lewis6991/gitsigns.nvim', -- Git signs in the gutter
  config = function()
    require('gitsigns').setup()
  end,
}
