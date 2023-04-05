return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('plugins.which-key.config')
      require('plugins.which-key.keymappings')
    end,
  },
}
