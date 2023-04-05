require('which-key').register({
  [';'] = { name = 'Dashboard', { '<CMD>Alpha<CR>', 'Dashboard' } },
  w = { name = 'Save', { '<CMD>w!<CR>', 'Save' } },
  Q = { name = 'Quit', { '<CMD>q<CR>', '[Q]uit' } }, -- Uppercase makes it harder to bump next to w
  h = { name = 'No [h]ighlight', { '<CMD>nohl<CR>', 'No [h]ighlight' } },
  e = { name = 'File Tree', { '<CMD>NvimTreeToggle<CR>', 'File Tree' } },
  p = {
    name = 'Lazy [p]lugins',
    h = { '<CMD>Lazy home<CR>', 'Lazy [h]ome' },
    s = {
      function()
        local stats = require('lazy').stats()
        print('Loaded ' .. stats.loaded .. ' plugins in ' .. stats.startuptime .. ' milleseconds.')
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
    n = { '<CMD>Telescope neoclip<CR>', '[n]eoclip' },
  },
  t = {
    name = '[t]rouble',
    t = { '<CMD>TroubleToggle<CR>', '[t]rouble' },
    n = {
      function()
        require('trouble').next({ skip_groups = true, jump = true })
      end,
      '[n]ext',
    },
    p = {
      function()
        require('trouble').previous({ skip_groups = true, jump = true })
      end,
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
    g = { '<CMD>Neogit<CR>', '[g]it' },
  },
  l = {
    name = 'LSP',
    r = { vim.lsp.buf.rename, '[R]ename' },
    i = { vim.lsp.buf.hover, '[I]nformation' },
    d = { vim.lsp.buf.definition, '[d]efinition' },
    D = { vim.lsp.buf.declaration, '[D]eclaration' }, -- Some servers don't implement this feature
    m = { vim.lsp.buf.implementation, 'I[m]plementation' },
    q = { vim.lsp.buf.references, '[q]uickfix' },
    e = { vim.diagnostic.open_float, 'Diagnostics' },
    a = { vim.lsp.buf.code_action, 'Code [a]ction' },
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
}, { prefix = '<leader>' })
