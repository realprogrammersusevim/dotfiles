local wk = require('which-key')

wk.register({
  e = { name = 'Toggle File Tree', { '<cmd>NvimTreeToggle<cr>', 'File Tree' } },

  w = { name = 'Save', { '<cmd>w!<cr>', 'Save' } },

  q = { name = 'Quit', { '<cmd>q<cr>', 'Quit' } },

  ['/'] = { name = 'Comment', { 'gcc', 'Comment' } },

  h = { name = 'No Highlight', { '<cmd>nohl<cr>', 'No Highlight' } },

  p = {
    name = 'Packer',
    c = { '<cmd>PackerCompile<cr>', 'Compile' },
    i = { '<cmd>PackerInstall<cr>', 'Install' },
    s = { '<cmd>PackerSync<cr>', 'Sync' },
    S = { '<cmd>PackerStatus<cr>', 'Status' },
    u = { '<cmd>PackerUpdate<cr>', 'Update' },
  },

  s = {
    name = 'Search',
    b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
    c = { '<cmd>Telescope colorscheme<cr>', 'Colorscheme' },
    f = { '<cmd>Telescope find_files<cr>', 'Find File' },
    h = { '<cmd>Telescope help_tags<cr>', 'Find Help' },
    H = { '<cmd>Telescope highlights<cr>', 'Find highlight groups' },
    M = { '<cmd>Telescope man_pages<cr>', 'Man Pages' },
    r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
    R = { '<cmd>Telescope registers<cr>', 'Registers' },
    t = { '<cmd>Telescope live_grep<cr>', 'Text' },
    k = { '<cmd>Telescope keymaps<cr>', 'Keymaps' },
    C = { '<cmd>Telescope commands<cr>', 'Commands' },
  },

  t = { name = 'Trouble', { '<cmd>TroubleToggle<cr>', 'Toggle' } },

  b = {
    name = 'BarBar',
    p = { '<cmd>BufferPrevious<cr>', 'Previous Buffer' },
    n = { '<cmd>BufferNext<cr>', 'Next Buffer' },
    ['1'] = { '<cmd>BufferGoto 1<cr>', 'Goto Buffer 1' },
    ['2'] = { '<cmd>BufferGoto 2<cr>', 'Goto Buffer 2' },
    ['3'] = { '<cmd>BufferGoto 3<cr>', 'Goto Buffer 3' },
    ['4'] = { '<cmd>BufferGoto 4<cr>', 'Goto Buffer 4' },
    ['5'] = { '<cmd>BufferGoto 5<cr>', 'Goto Buffer 5' },
    ['6'] = { '<cmd>BufferGoto 6<cr>', 'Goto Buffer 6' },
    ['7'] = { '<cmd>BufferGoto 7<cr>', 'Goto Buffer 7' },
    ['8'] = { '<cmd>BufferGoto 8<cr>', 'Goto Buffer 8' },
    ['9'] = { '<cmd>BufferGoto 9<cr>', 'Goto Buffer 9' },
    ['0'] = { '<cmd>BufferLast<cr>', 'Last Buffer' },
    i = { '<cmd>BufferPin<cr>', 'Pin Buffer' },
    c = { '<cmd>BufferClose<cr>', 'Close Buffer' },
  },
}, { prefix = '<leader>' })
