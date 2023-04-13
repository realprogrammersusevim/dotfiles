return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
  },
  { 'skywind3000/asyncrun.vim', cmd = 'AsyncRun' },
  {
    'ray-x/web-tools.nvim',
    config = true,
    cmd = { 'BrowserPreview', 'BrowserOpen', 'BrowserStop' },
  },
  { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = true,
  },
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    module = 'persistence',
    config = true,
  },
}
