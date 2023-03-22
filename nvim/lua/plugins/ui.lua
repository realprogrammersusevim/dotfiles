return {
  {
    'romgrk/barbar.nvim',
    -- lazy = false,
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    opts = {
      -- Enable/disable animations
      animation = false,
      -- Enable/disable auto-hiding the tab bar when there is a single buffer
      auto_hide = true,
      -- Enable/disable current/total tabpages indicator (top right corner)
      tabpages = true,
      -- Enable/disable close button
      closable = false,
      -- Enables/disable clickable tabs
      --  - left-click: go to buffer
      --  - middle-click: delete buffer
      clickable = false,
      -- Excludes buffers from the tabline
      exclude_ft = { 'javascript' },
      exclude_name = { 'package.json' },
      -- Show every buffer
      hide = { current = false, inactive = false, visible = false },
      -- Enable/disable icons
      -- if set to 'numbers', will show buffer index in the tabline
      -- if set to 'both', will show buffer index and icons in the tabline
      icons = true,
      -- If set, the icon color will follow its corresponding buffer
      -- highlight group. By default, the Buffer*Icon group is linked to the
      -- Buffer* group (see Highlighting below). Otherwise, it will take its
      -- default value as defined by devicons.
      icon_custom_colors = false,
      -- Configure icons on the bufferline.
      icon_separator_active = '▎',
      icon_separator_inactive = '▎',
      icon_close_tab = '',
      icon_close_tab_modified = '●',
      icon_pinned = '車',
      -- If true, new buffers will be inserted at the start/end of the list.
      -- Default is to insert after current buffer.
      insert_at_end = false,
      insert_at_start = false,
      -- Sets the maximum padding width with which to surround each tab
      maximum_padding = 1,
      -- Sets the minimum padding width with which to surround each tab
      minimum_padding = 1,
      -- Sets the maximum buffer name length.
      maximum_length = 30,
      -- If set, the letters for each buffer in buffer-pick mode will be
      -- assigned based on their name. Otherwise or in case all letters are
      -- already assigned, the behavior is to assign letters in order of
      -- usability (see order below)
      semantic_letters = true,
      -- New buffer letters are assigned in this order. This order is
      -- optimal for the qwerty keyboard layout but might need adjustement
      -- for other layouts.
      letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
      -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
      -- where X is the buffer number. But only a static string is accepted here.
      no_name_title = 'Unnamed',
    },
  },

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
    'sunjon/shade.nvim',
    config = false,
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
        dashboard.button('r', '  > Recent', '<CMD>Telescope oldfiles<CR>'),
        dashboard.button(
          's',
          '  > Settings',
          ':e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>'
        ),
        dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
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
}
