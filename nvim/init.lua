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

  require('lazy').setup('plugins')

  require('commands')
else
  require('core')
  require('lazy').setup('plugins.firenvim')
end
