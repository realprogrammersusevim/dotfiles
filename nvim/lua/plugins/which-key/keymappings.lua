require('which-key').register({
  w = { name = 'Save', { '<CMD>w!<CR>', 'Save' } },
  W = { name = 'Save without formatting', { '<CMD>noautocmd w<CR>', 'Save without formatting' } }, -- When you don't want the formatter to fire while saving
  Q = { name = 'Quit', { '<CMD>qa<CR>', '[Q]uit' } }, -- Uppercase makes it harder to bump next to w
  h = { name = 'No [h]ighlight', { '<CMD>nohl<CR>', 'No [h]ighlight' } },
  p = {
    name = 'Lazy [p]lugins',
    h = { '<CMD>Lazy home<CR>', 'Lazy [h]ome' },
    s = {
      function()
        print(require('utils').plugin_time())
      end,
      'Lazy [s]tats',
    },
  },
  s = {
    name = 'Search',
    s = { '<CMD>Telescope<CR>', 'Search' },
    b = { '<CMD>Telescope git_branches<CR>', '[b]ranches' },
    c = { '<CMD>Telescope colorscheme<CR>', '[c]olorscheme' },
    f = { '<CMD>Telescope find_files<CR>', '[f]ile' },
    h = { '<CMD>Telescope help_tags<CR>', '[h]elp' },
    H = { '<CMD>Telescope highlights<CR>', '[H]ighlight groups' },
    M = { '<CMD>Telescope man_pages<CR>', '[M]an pages' },
    r = { '<CMD>Telescope oldfiles<CR>', '[r]ecent file' },
    R = { '<CMD>Telescope registers<CR>', '[R]egisters' },
    t = { '<CMD>Telescope live_grep<CR>', '[t]ext' },
    T = { '<CMD>TodoTelescope<CR>', '[T]odos' },
    k = { '<CMD>Telescope keymaps<CR>', '[k]eymaps' },
    C = { '<CMD>Telescope commands<CR>', '[C]ommands' },
    p = { '<CMD>Telescope planets<CR>', '[p]lanets' },
  },
  t = {
    name = '[t]rouble',
    t = { '<CMD>TroubleToggle<CR>', '[t]rouble' },
    n = {
      '<CMD>lua require("trouble").next({ skip_groups = true, jump = true })<CR>',
      '[n]ext',
    },
    p = {
      '<CMD>lua require("trouble").previous({ skip_groups = true, jump = true })<CR>',
      '[p]revious',
    },
  },
  g = {
    name = '[g]it',
    c = { '<CMD>Telescope git_commits<CR>', 'Checkout [c]ommit' },
    C = {
      '<CMD>Telescope git_bcommits<CR>',
      '[C]heckout commit(for current file)',
    },
    s = { '<CMD>Gitsigns stage_hunk<CR>', '[s]tage hunk' },
    u = { '<CMD>Gitsigns undo_stage_hunk<CR>', '[u]ndo stage hunk' },
    r = { '<CMD>Gitsigns reset_hunk<CR>', '[r]eset hunk' },
    p = { '<CMD>Gitsigns preview_hunk<CR>', '[p]review hunk' },
    n = { '<CMD>Gitsigns next_hunk<CR>', '[n]ext hunk' },
    b = { '<CMD>Gitsigns prev_hunk<CR>', '[back] hunk' },
    S = { '<CMD>Neotree git_status<CR>', '[S]tatus' },
    g = { '<CMD>Neogit kind=floating<CR>', '[g]it' },
  },
  l = {
    name = 'LSP',
    r = { '<CMD>lua vim.lsp.buf.rename()<CR>', '[r]ename' },
    i = { '<CMD>lua vim.lsp.buf.hover()<CR>', '[i]nformation' },
    I = {
      function()
        local type = require('nvim-treesitter.ts_utils').get_node_at_cursor():type()
        type = type:gsub('^%l', string.upper) -- Uppercase the first char
        type = type:gsub('_', ' ') -- Replace underscores with spaces
        vim.lsp.util.open_floating_preview({ type }) -- Show our nicely formatted TS node type in an LSP floating window
      end,
      'TS [I]nformation',
    },
    d = { '<CMD>lua vim.lsp.buf.definition()<CR>', '[d]efinition' },
    D = { '<CMD>lua vim.lsp.buf.declaration()<CR>', '[D]eclaration' },
    m = { '<CMD>lua vim.lsp.buf.implementation()<CR>', 'I[m]plementation' },
    q = { '<CMD>lua vim.lsp.buf.references()<CR>', '[q]uickfix' },
    e = { '<CMD>lua vim.diagnostic.open_float()<CR>', '[e]rrors' },
    a = { '<CMD>lua vim.lsp.buf.code_action()<CR>', 'Code [a]ction' },
  },
  m = {
    name = 'Markdown',
    p = { '<CMD>MarkdownPreviewToggle<CR>', '[p]review' },
    h = { '<CMD>MarkdownToHTML<CR>', 'Convert to [h]TML' },
    H = { '<CMD>NewMarkdownToHTML<CR>', 'Convert to [H]TML in a new file' },
    z = { '<CMD>ZoteroCite<CR>', '[z]otero cite' },
    l = {
      '<CMD>MarkdownFollowLink<CR>',
      'Follow Markdown Link',
    },
  },
  r = {
    '[r]estore session',
    s = { 'lua require("persistence").load()', '[s]ession for current directory' },
    l = { '<CMD>lua require("persistence").load({ last = true })<CR>', '[l]ast session' },
  },
  d = {
    name = '[d]ebug',
    c = { '<CMD>lua require("dap").continue()<CR>', '[c]ontinue' },
    i = { '<CMD>lua require("dap").step_into()<CR>', 'Step [i]nto' },
    o = { '<CMD>lua require("dap").step_over()<CR>', 'Step [o]ver' },
    O = { '<CMD>lua require("dap").step_out()<CR>', 'Step [o]ut' },
    b = { '<CMD>lua require("dap").toggle_breakpoint()<CR>', 'Toggle [b]reakpoint' },
    B = {
      '<CMD>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
      'Set breakpoint',
    },
    t = { '<CMD>lua require("dapui").toggle()<CR>', 'DapUI [t]oggle' },
  },
  f = { name = '[f]loating terminal', { '<CMD>lua require("FTerm").toggle()<CR>', '[t]oggle' } },
}, { prefix = '<leader>' })
