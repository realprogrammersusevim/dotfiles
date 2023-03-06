return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    cmd = 'NvimTreeToggle',
    config = function()
      require('nvim-tree').setup({
        view = {
          adaptive_size = true,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
    end,
  },
}
