return {
  {
    'lukas-reineke/headlines.nvim',
    event = 'VeryLazy',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      if vim.bo.filetype == 'markdown' then
        require('headlines').setup()
      end
    end,
  },
}
