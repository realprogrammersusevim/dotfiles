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
  { '<leader>t', group = '[t]rouble' },
  { '<leader>d', group = '[d]ebug' },
  {
    '<leader>dc',
    function() require('dap').continue() end,
    desc = '[c]ontinue',
  },
  {
    '<leader>di',
    function() require('dap').step_into() end,
    desc = 'step [i]nto',
  },
  {
    '<leader>do',
    function() require('dap').step_over() end,
    desc = 'step [o]ver',
  },
  {
    '<leader>dO',
    function() require('dap').step_out() end,
    desc = 'step [O]ut',
  },
  {
    '<leader>db',
    function() require('dap').toggle_breakpoint() end,
    desc = 'toggle [b]reakpoint',
  },
  {
    '<leader>dB',
    function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
    desc = 'conditional [B]reakpoint',
  },
  {
    '<leader>dt',
    function() require('dapui').toggle() end,
    desc = '[t]oggle UI',
  },
  {
    '<leader>dq',
    function() require('dap').terminate() end,
    desc = '[q]uit session',
  },
  {
    '<leader>dl',
    function() require('dap').run_last() end,
    desc = 'run [l]ast',
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
    '<leader>ln',
    '<CMD>lua vim.lsp.buf.rename()<CR>',
    desc = 'Re[n]ame',
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
    desc = '[r]eferences',
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
      local node = vim.treesitter.get_node()
      if not node then
        return
      end
      local type = node:type()
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
})
