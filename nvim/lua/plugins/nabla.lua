return {
  'jbyuki/nabla.nvim',
  ft = 'markdown',
  lazy = true,
  config = function()
    require('nabla').enable_virt()
  end,
}
