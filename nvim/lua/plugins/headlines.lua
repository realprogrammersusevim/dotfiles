return {
  {
    'lukas-reineke/headlines.nvim',
    event = 'VeryLazy',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    enabled = false,
    config = function()
      if vim.bo.filetype == 'markdown' and require('utils').file_to_big() == false then
        require('headlines').setup()
      end
    end,
  },
}
