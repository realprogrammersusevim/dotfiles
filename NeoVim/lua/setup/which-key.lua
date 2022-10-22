require('which-key').setup {}
local wk = require('which-key')

wk.register({
  e = {
    name = 'Toggle File Tree',
    {'<cmd>NvimTreeToggle<cr>'},
  },

  w = {
    name = 'Save',
    {'<cmd>w!<cr>'},
  },

  q = {
    name = 'Quit',
    {'<cmd>q<cr>'},
  },

  -- ['/'] = {
      -- name = 'Comment',
      -- {'<cmd>lua require("Comment.api").toggle_current_linewise()<cr>'},
    -- },

  h = {
    name = 'No Highlight',
    {'<cmd>nohlsearch<cr>'},
  },

  p = {
    name = 'Packer',
    c = {'<cmd>PackerCompile<cr>', 'Compile'},
    i = {'<cmd>PackerInstall<cr>', 'Install'},
    s = {'<cmd>PackerSync<cr>', 'Sync'},
    S = {'<cmd>PackerStatus<cr>', 'Status'},
    u = {'<cmd>PackerUpdate', 'Update'},
  },

  }, { prefix = "<leader>"})
