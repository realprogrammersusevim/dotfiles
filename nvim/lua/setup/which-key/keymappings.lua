local wk = require('which-key')

wk.register({
  [';'] = { name = 'Dashboard', { '<cmd>Alpha<cr>', 'Dashboard' } },

  e = { name = 'File Tree', { '<cmd>NvimTreeToggle<cr>', 'File Tree' } },

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
    s = { '<cmd>Telescope buffers<cr>', 'Search Buffers' },
  },

  g = {
    name = 'Git',
    b = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
    c = { '<cmd>Telescope git_commits<cr>', 'Checkout commit' },
    C = {
      '<cmd>Telescope git_bcommits<cr>',
      'Checkout commit(for current file)',
    },
    s = { '<cmd>Telescope git_status<cr>', 'Git status' },
    g = { '<cmd>Neogit kind=vsplit<cr>', 'Neogit' },
    k = { '<cmd>Neogit commit<cr>', 'Commit' },
  },

  d = {
    name = 'Debug',
    R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", 'Run to Cursor' },
    E = {
      "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>",
      'Evaluate Input',
    },
    C = {
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
      'Conditional Breakpoint',
    },
    U = { "<cmd>lua require'dapui'.toggle()<cr>", 'Toggle UI' },
    b = { "<cmd>lua require'dap'.step_back()<cr>", 'Step Back' },
    c = { "<cmd>lua require'dap'.continue()<cr>", 'Continue' },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", 'Disconnect' },
    e = { "<cmd>lua require'dapui'.eval()<cr>", 'Evaluate' },
    g = { "<cmd>lua require'dap'.session()<cr>", 'Get Session' },
    h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", 'Hover Variables' },
    S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", 'Scopes' },
    i = { "<cmd>lua require'dap'.step_into()<cr>", 'Step Into' },
    o = { "<cmd>lua require'dap'.step_over()<cr>", 'Step Over' },
    p = { "<cmd>lua require'dap'.pause.toggle()<cr>", 'Pause' },
    q = { "<cmd>lua require'dap'.close()<cr>", 'Quit' },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", 'Toggle Repl' },
    s = { "<cmd>lua require'dap'.continue()<cr>", 'Start' },
    t = {
      "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
      'Toggle Breakpoint',
    },
    x = { "<cmd>lua require'dap'.terminate()<cr>", 'Terminate' },
    u = { "<cmd>lua require'dap'.step_out()<cr>", 'Step Out' },
  },

  r = { name = 'Reveal', '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover' },
}, { prefix = '<leader>' })
