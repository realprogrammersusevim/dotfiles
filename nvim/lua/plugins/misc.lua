return {
  { 'lukas-reineke/indent-blankline.nvim', event = 'BufRead' },
  { 'skywind3000/asyncrun.vim', cmd = 'AsyncRun' },
  {
    'ray-x/web-tools.nvim',
    config = true,
    ft = { 'html', 'javascript', 'css' },
  },
  { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
}
