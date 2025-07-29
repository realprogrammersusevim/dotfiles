require('which-key').add({
  {
    '<leader>w',
    '<CMD>w!<CR>',
    desc = 'Save',
  },
  {
    '<leader>W',
    '<CMD>noautocmd w<CR>',
    desc = 'Save without formatting',
  },
  {
    '<leader>Q',
    '<CMD>qa<CR>',
    desc = '[Q]uit',
  },
  {
    '<leader>h',
    '<CMD>nohl<CR>',
    desc = 'No [h]ighlight',
  },
  { '<leader>P', group = 'Lazy [Plugins]' },
  {
    '<leader>Ph',
    '<CMD>Lazy home<CR>',
    desc = 'Lazy [h]ome',
  },
  {
    '<leader>Ps',
    function()
      print(require('utils').plugin_time())
    end,
    desc = 'Lazy [s]tats',
  },
  { '<leader>s', group = 'Search' },
  {
    '<leader>ss',
    '<CMD>Telescope<CR>',
    desc = 'Search',
  },
  {
    '<leader>sb',
    '<CMD>Telescope git_branches<CR>',
    desc = '[b]ranches',
  },
  {
    '<leader>sc',
    '<CMD>Telescope colorscheme<CR>',
    desc = '[c]olorscheme',
  },
  {
    '<leader>sf',
    '<CMD>Telescope find_files<CR>',
    desc = '[f]ile',
  },
  {
    '<leader>sh',
    '<CMD>Telescope help_tags<CR>',
    desc = '[h]elp',
  },
  {
    '<leader>sH',
    '<CMD>Telescope highlights<CR>',
    desc = '[H]ighlight groups',
  },
  {
    '<leader>sM',
    '<CMD>Telescope man_pages<CR>',
    desc = '[M]an pages',
  },
  {
    '<leader>sr',
    '<CMD>Telescope oldfiles<CR>',
    desc = '[r]ecent file',
  },
  {
    '<leader>sR',
    '<CMD>Telescope registers<CR>',
    desc = '[R]egisters',
  },
  {
    '<leader>st',
    '<CMD>Telescope live_grep<CR>',
    desc = '[t]ext',
  },
  {
    '<leader>sT',
    '<CMD>TodoTelescope<CR>',
    desc = '[T]odos',
  },
  {
    '<leader>sk',
    '<CMD>Telescope keymaps<CR>',
    desc = '[k]eymaps',
  },
  {
    '<leader>sC',
    '<CMD>Telescope commands<CR>',
    desc = '[C]ommands',
  },
  {
    '<leader>sp',
    '<CMD>Telescope planets<CR>',
    desc = '[p]lanets',
  },
  { '<leader>t', group = '[t]rouble' },
  {
    '<leader>tt',
    '<CMD>TroubleToggle<CR>',
    desc = '[t]rouble',
  },
  {
    '<leader>tn',
    '<CMD>lua require("trouble").next({ skip_groups = true, jump = true })<CR>',
    desc = '[n]ext',
  },
  {
    '<leader>tp',
    '<CMD>lua require("trouble").previous({ skip_groups = true, jump = true })<CR>',
    desc = '[p]revious',
  },
  { '<leader>g', group = '[g]it' },
  {
    '<leader>gc',
    '<CMD>Telescope git_commits<CR>',
    desc = 'Checkout [c]ommit',
  },
  {
    '<leader>gC',
    '<CMD>Telescope git_bcommits<CR>',
    desc = '[C]heckout commit(for current file)',
  },
  {
    '<leader>gs',
    '<CMD>Gitsigns stage_hunk<CR>',
    desc = '[s]tage hunk',
  },
  {
    '<leader>gu',
    '<CMD>Gitsigns undo_stage_hunk<CR>',
    desc = '[u]ndo stage hunk',
  },
  {
    '<leader>gr',
    '<CMD>Gitsigns reset_hunk<CR>',
    desc = '[r]eset hunk',
  },
  {
    '<leader>gp',
    '<CMD>Gitsigns preview_hunk<CR>',
    desc = '[p]review hunk',
  },
  {
    '<leader>gn',
    '<CMD>Gitsigns next_hunk<CR>',
    desc = '[n]ext hunk',
  },
  {
    '<leader>gl',
    function()
      Snacks.lazygit()
    end,
    desc = '[l]azy',
  },
  {
    '<leader>gb',
    '<CMD>Gitsigns prev_hunk<CR>',
    desc = '[back] hunk',
  },
  { '<leader>l', group = 'LSP' },
  {
    '<leader>lr',
    '<CMD>lua vim.lsp.buf.rename()<CR>',
    desc = '[r]ename',
  },
  {
    '<leader>li',
    '<CMD>lua vim.lsp.buf.hover()<CR>',
    desc = '[i]nformation',
  },
  {
    '<leader>ld',
    '<CMD>lua vim.lsp.buf.definition()<CR>',
    desc = '[d]efinition',
  },
  {
    '<leader>lD',
    '<CMD>lua vim.lsp.buf.declaration()<CR>',
    desc = '[D]eclaration',
  },
  {
    '<leader>lm',
    '<CMD>lua vim.lsp.buf.implementation()<CR>',
    desc = 'I[m]plementation',
  },
  {
    '<leader>lq',
    '<CMD>lua vim.lsp.buf.references()<CR>',
    desc = '[q]uickfix',
  },
  {
    '<leader>le',
    '<CMD>lua vim.diagnostic.open_float()<CR>',
    desc = '[e]rrors',
  },
  {
    '<leader>la',
    '<CMD>lua vim.lsp.buf.code_action()<CR>',
    desc = 'Code [a]ction',
  },
  { '<leader>L', group = 'Treesitter [L]SP' },
  {
    '<leader>Li',
    function()
      local type = require('nvim-treesitter.ts_utils').get_node_at_cursor():type()
      type = type:gsub('^%l', string.upper)
      type = type:gsub('_', ' ')
      vim.lsp.util.open_floating_preview({ type })
    end,
    desc = '[i]nformation',
  },
  { '<leader>m', group = 'Markdown' },
  {
    '<leader>mz',
    '<CMD>ZoteroCite<CR>',
    desc = '[z]otero cite',
  },
  {
    '<leader>ml',
    '<CMD>MarkdownFollowLink<CR>',
    desc = 'Follow Markdown Link',
  },
  {
    '<leader>mt',
    '<CMD>ThesaurusReplace<CR>',
    desc = '[t]hesaurus replace',
  },
  {
    '<leader>y',
    '<CMD>call setreg("+", @")<CR>',
    desc = 'Copy to clipboard',
  },
  {
    '<leader>p',
    '<CMD>lua require("nabla").popup({border="rounded"})<CR>',
    desc = 'Nabla [p]opup',
  },
})
