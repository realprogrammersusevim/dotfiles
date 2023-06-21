return {
  {
    'folke/which-key.nvim',
    lazy = true,
    keys = { '<leader>' },
    config = function()
      require('plugins.which-key.config')
      require('plugins.which-key.keymappings')
    end,
  },
}
