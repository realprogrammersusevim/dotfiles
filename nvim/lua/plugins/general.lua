return {
  {
    'glacambre/firenvim',
    build = function()
      vim.fn['firenvim#install'](0)
    end,
  },
  'lukas-reineke/indent-blankline.nvim',
  -- { 'skywind3000/asyncrun.nvim', cmd = 'AsyncRun' },
  {
    'ray-x/web-tools.nvim',
    config = function()
      require('web-tools.').setup()
    end,
    ft = { 'html', 'javascript', 'css' },
  },
  { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
}
