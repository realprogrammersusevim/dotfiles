local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

if not vim.g.started_by_firenvim then
  require('core')

  require('keymaps')

  require('lazy').setup('plugins', {
    performance = {
      rtp = {
        disabled_plugins = {
          '2html_plugin',
          'tohtml',
          'logipat',
          -- 'netrw',
          -- 'netrwPlugin',
          -- 'netrwSettings',
          -- 'netrwFileHandlers',
          'tar',
          'tarPlugin',
          'rrhelper',
          'vimball',
          'vimballPlugin',
          'tutor',
          'rplugin',
          'syntax',
          'synmenu',
          'optwin',
          'compiler',
          'bugreport',
        },
      },
    },
  })

  require('commands')
else
  require('core')
  require('keymaps')
  require('lazy').setup('plugins.firenvim')
end
