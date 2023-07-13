return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    event = 'VimEnter',
    keys = { { '<leader>;', '<CMD>Alpha<CR>', desc = 'Dashboard' } },
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
        dashboard.button('n', '  󰶻 New file', '<CMD>ene <BAR> startinsert <CR>'),
        dashboard.button('f', '  󰶻 Find file', '<CMD>Telescope find_files<CR>'),
        dashboard.button('r', '  󰶻 Recent', '<CMD>Telescope oldfiles<CR>'),
        dashboard.button(
          'c',
          '  󰶻 Settings',
          ':e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>'
        ),
        dashboard.button(
          's',
          '  󰶻 Restore Session',
          '<CMD>lua require("persistence").load({ last = true })<CR>'
        ),
        dashboard.button('q', '  󰶻 Quit NVIM', ':qa<CR>'),
      }

      -- Set footer
      -- local fortune = require('alpha.fortune')
      -- dashboard.section.footer.val = fortune()

      vim.api.nvim_create_autocmd({ 'User' }, {
        pattern = { 'LazyVimStarted' },
        callback = function()
          dashboard.section.footer.val = require('utils').plugin_time()
          pcall(vim.cmd.AlphaRedraw)
        end,
      })

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
      ]])
    end,
  },
}
