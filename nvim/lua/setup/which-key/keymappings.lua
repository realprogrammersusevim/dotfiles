require('which-key').register({
  [';'] = { name = 'Dashboard', { '<CMD>Alpha<CR>', 'Dashboard' } },

  e = { name = 'File Tree', { '<CMD>NvimTreeToggle<CR>', 'File Tree' } },

  w = { name = 'Save', { '<CMD>w!<CR>', 'Save' } },

  q = { name = 'Quit', { '<CMD>q<CR>', 'Quit' } },

  ['/'] = { name = 'Comment', { 'gcc', 'Comment' } },

  h = { name = 'No Highlight', { '<CMD>nohl<CR>', 'No Highlight' } },

  p = {
    name = 'Packer',
    c = { '<CMD>PackerCompile<CR>', 'Compile' },
    i = { '<CMD>PackerInstall<CR>', 'Install' },
    s = { '<CMD>PackerSync<CR>', 'Sync' },
    S = { '<CMD>PackerStatus<CR>', 'Status' },
    u = { '<CMD>PackerUpdate<CR>', 'Update' },
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
    g = { '<CMD>Neogit kind=vsplit<CR>', 'Neogit' },
    k = { '<CMD>Neogit commit<CR>', 'Commit' },
  },

  d = {
    name = 'Debug',
    R = { "<CMD>lua require'dap'.run_to_cursor()<CR>", 'Run to Cursor' },
    E = {
      "<CMD>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<CR>",
      'Evaluate Input',
    },
    C = {
      "<CMD>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<CR>",
      'Conditional Breakpoint',
    },
    U = { "<CMD>lua require'dapui'.toggle()<CR>", 'Toggle UI' },
    b = { "<CMD>lua require'dap'.step_back()<CR>", 'Step Back' },
    c = { "<CMD>lua require'dap'.continue()<CR>", 'Continue' },
    d = { "<CMD>lua require'dap'.disconnect()<CR>", 'Disconnect' },
    e = { "<CMD>lua require'dapui'.eval()<CR>", 'Evaluate' },
    g = { "<CMD>lua require'dap'.session()<CR>", 'Get Session' },
    h = { "<CMD>lua require'dap.ui.widgets'.hover()<CR>", 'Hover Variables' },
    S = { "<CMD>lua require'dap.ui.widgets'.scopes()<CR>", 'Scopes' },
    i = { "<CMD>lua require'dap'.step_into()<CR>", 'Step Into' },
    o = { "<CMD>lua require'dap'.step_over()<CR>", 'Step Over' },
    p = { "<CMD>lua require'dap'.pause.toggle()<CR>", 'Pause' },
    q = { "<CMD>lua require'dap'.close()<CR>", 'Quit' },
    r = { "<CMD>lua require'dap'.repl.toggle()<CR>", 'Toggle Repl' },
    s = { "<CMD>lua require'dap'.continue()<CR>", 'Start' },
    t = {
      "<CMD>lua require'dap'.toggle_breakpoint()<CR>",
      'Toggle Breakpoint',
    },
    x = { "<CMD>lua require'dap'.terminate()<CR>", 'Terminate' },
    u = { "<CMD>lua require'dap'.step_out()<CR>", 'Step Out' },
  },

  l = {
    name = 'LSP',
    r = { '<CMD>lua vim.lsp.buf.rename()<CR>', 'Rename' },
    i = { '<CMD>lua vim.lsp.buf.hover()<CR>', 'Information' },
    d = { '<CMD>lua vim.lsp.buf.definition()<CR>', 'Definition' },
    D = { '<CMD>lua vim.lsp.buf.declaration()<CR>', 'Declaration' }, -- Some servers don't implement this feature
    m = { '<CMD>lua vim.lsp.buf.implementation()<CR>', 'Implementation' },
    q = { '<CMD>lua vim.lsp.buf.references()<CR>', 'Quickfix' },
    e = { '<CMD>lua vim.diagnostic.open_float()<CR>', 'Diagnostics' },
  },
}, { prefix = '<leader>' })
