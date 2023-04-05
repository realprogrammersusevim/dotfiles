return {
  { 'lukas-reineke/indent-blankline.nvim', event = 'BufRead' },
  { 'skywind3000/asyncrun.vim', cmd = 'AsyncRun' },
  {
    'ray-x/web-tools.nvim',
    config = true,
    ft = { 'html', 'javascript', 'css' },
  },
  { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}
