return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    cmd = 'NvimTreeToggle',
    opts = {
      view = {
        adaptive_size = true,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    },
  },

  {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')

      -- Set header
      dashboard.section.header.val = {

        '  ██████╗██╗   ██╗██████╗ ██╗  ██╗███████╗██████╗ ',
        ' ██╔════╝╚██╗ ██╔╝██╔══██╗██║  ██║██╔════╝██╔══██╗',
        ' ██║      ╚████╔╝ ██████╔╝███████║█████╗  ██████╔╝',
        ' ██║       ╚██╔╝  ██╔═══╝ ██╔══██║██╔══╝  ██╔══██╗',
        ' ╚██████╗   ██║   ██║     ██║  ██║███████╗██║  ██║',
        '  ╚═════╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝',
        ' ',
        '        ██████╗ ██╗   ██╗███╗   ██╗██╗  ██╗          ',
        '        ██╔══██╗██║   ██║████╗  ██║██║ ██╔╝          ',
        '        ██████╔╝██║   ██║██╔██╗ ██║█████╔╝           ',
        '        ██╔═══╝ ██║   ██║██║╚██╗██║██╔═██╗           ',
        '        ██║     ╚██████╔╝██║ ╚████║██║  ██╗          ',
        '        ╚═╝      ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝          ',
      }

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button('e', '  > New file', '<CMD>ene <BAR> startinsert <CR>'),
        dashboard.button('f', '  > Find file', '<CMD>Telescope find_files<CR>'),
        dashboard.button('r', '  >  Recent', '<CMD>Telescope oldfiles<CR>'),
        dashboard.button(
          's',
          '  >  Settings',
          ':e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>'
        ),
        dashboard.button('p', '󱑁  >  Persistence', '<CMD>lua require("persistence").load()<CR>'),
        dashboard.button('q', '  >  Quit NVIM', ':qa<CR>'),
      }

      -- Set footer
      local fortune = require('alpha.fortune')
      dashboard.section.footer.val = fortune()

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
      ]])
    end,
  },

  { 'folke/zen-mode.nvim', config = true },
  { 'folke/twilight.nvim', config = true },
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      'kyazdani42/nvim-web-devicons',
    },
    config = true,
    opts = {
      exclude_filetypes = {
        'alpha',
        'toggleterm',
      },
    },
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
}
