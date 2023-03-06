return {
  {
    'folke/which-key.nvim',
    config = function()
      require('plugins.which-key.config')
      require('plugins.which-key.keymappings')
    end,
  },
}
