local packer = require('packer')

require('which-key').register({
  [';'] = { name = 'Dashboard', { '<CMD>Alpha<CR>', 'Dashboard' } },

  e = { name = 'File Tree', { '<CMD>NvimTreeToggle<CR>', 'File Tree' } },

  w = { name = 'Save', { '<CMD>w!<CR>', 'Save' } },

  Q = { name = 'Quit', { '<CMD>q<CR>', 'Quit' } }, -- Uppercase makes it harder to bump next to w

  h = { name = 'No Highlight', { '<CMD>nohl<CR>', 'No Highlight' } },

  p = {
    name = 'Packer',
    c = { packer.compile, 'Compile' },
    i = { packer.install, 'Install' },
    s = { packer.sync, 'Sync' },
    S = { packer.status, 'Status' },
    u = { packer.update, 'Update' },
  },

  s = {
    name = 'Search',
    s = { '<CMD>Telescope<CR>', 'Search' },
    b = { '<CMD>Telescope git_branches<CR>', 'Checkout branch' },
    c = { '<CMD>Telescope colorscheme<CR>', 'Colorscheme' },
    f = { '<CMD>Telescope find_files<CR>', 'Find File' },
    h = { '<CMD>Telescope help_tags<CR>', 'Find Help' },
    H = { '<CMD>Telescope highlights<CR>', 'Find highlight groups' },
    M = { '<CMD>Telescope man_pages<CR>', 'Man Pages' },
    r = { '<CMD>Telescope oldfiles<CR>', 'Open Recent File' },
    R = { '<CMD>Telescope registers<CR>', 'Registers' },
    t = { '<CMD>Telescope live_grep<CR>', 'Text' },
    T = { '<CMD>TodoTelescope<CR>', 'Todos' },
    k = { '<CMD>Telescope keymaps<CR>', 'Keymaps' },
    C = { '<CMD>Telescope commands<CR>', 'Commands' },
    p = { '<CMD>Telescope planets<CR>', 'Planets' },
  },

  t = { name = 'Trouble', { '<CMD>TroubleToggle<CR>', 'Toggle' } },

  b = {
    name = 'BarBar',
    p = { '<CMD>BufferPrevious<CR>', 'Previous Buffer' },
    n = { '<CMD>BufferNext<CR>', 'Next Buffer' },
    ['1'] = { '<CMD>BufferGoto 1<CR>', 'Goto Buffer 1' },
    ['2'] = { '<CMD>BufferGoto 2<CR>', 'Goto Buffer 2' },
    ['3'] = { '<CMD>BufferGoto 3<CR>', 'Goto Buffer 3' },
    ['4'] = { '<CMD>BufferGoto 4<CR>', 'Goto Buffer 4' },
    ['5'] = { '<CMD>BufferGoto 5<CR>', 'Goto Buffer 5' },
    ['6'] = { '<CMD>BufferGoto 6<CR>', 'Goto Buffer 6' },
    ['7'] = { '<CMD>BufferGoto 7<CR>', 'Goto Buffer 7' },
    ['8'] = { '<CMD>BufferGoto 8<CR>', 'Goto Buffer 8' },
    ['9'] = { '<CMD>BufferGoto 9<CR>', 'Goto Buffer 9' },
    ['0'] = { '<CMD>BufferLast<CR>', 'Last Buffer' },
    i = { '<CMD>BufferPin<CR>', 'Pin Buffer' },
    c = { '<CMD>BufferClose<CR>', 'Close Buffer' },
    s = { '<CMD>Telescope buffers<CR>', 'Search Buffers' },
  },

  g = {
    name = 'Git',
    b = { '<CMD>Telescope git_branches<CR>', 'Checkout branch' },
    c = { '<CMD>Telescope git_commits<CR>', 'Checkout commit' },
    C = {
      '<CMD>Telescope git_bcommits<CR>',
      'Checkout commit(for current file)',
    },
    s = { '<CMD>Telescope git_status<CR>', 'Git status' },
  },

  l = {
    name = 'LSP',
    r = { vim.lsp.buf.rename, 'Rename' },
    i = { vim.lsp.buf.hover, 'Information' },
    d = { vim.lsp.buf.definition, 'Definition' },
    D = { vim.lsp.buf.declaration, 'Declaration' }, -- Some servers don't implement this feature
    m = { vim.lsp.buf.implementation, 'Implementation' },
    q = { vim.lsp.buf.references, 'Quickfix' },
    e = { vim.diagnostic.open_float, 'Diagnostics' },
    a = { vim.lsp.buf.code_action, 'Code Action' },
  },

  m = {
    name = 'Markdown',
    p = { '<CMD>MarkdownPreviewToggle<CR>', 'Preview' },
    h = { '<CMD>MarkdownToHTML<CR>', 'Convert to HTML' },
  },
}, { prefix = '<leader>' })
