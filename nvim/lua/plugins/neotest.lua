return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'Issafalcon/neotest-dotnet',
    },
    -- Load on demand: the first test keymap pulls the whole stack in.
    keys = {
      {
        '<leader>Tr',
        function() require('neotest').run.run() end,
        desc = '[r]un nearest',
      },
      {
        '<leader>Tf',
        function() require('neotest').run.run(vim.fn.expand('%')) end,
        desc = 'run [f]ile',
      },
      {
        '<leader>Td',
        function() require('neotest').run.run({ strategy = 'dap' }) end,
        desc = '[d]ebug nearest',
      },
      {
        '<leader>Ts',
        function() require('neotest').run.stop() end,
        desc = '[s]top',
      },
      {
        '<leader>Ta',
        function() require('neotest').run.attach() end,
        desc = '[a]ttach',
      },
      {
        '<leader>To',
        function() require('neotest').output.open({ enter = true, auto_close = true }) end,
        desc = '[o]utput',
      },
      {
        '<leader>TO',
        function() require('neotest').output_panel.toggle() end,
        desc = 'output [O] panel',
      },
      {
        '<leader>Tt',
        function() require('neotest').summary.toggle() end,
        desc = '[t]oggle summary',
      },
      {
        ']t',
        function() require('neotest').jump.next({ status = 'failed' }) end,
        desc = 'Next failed test',
      },
      {
        '[t',
        function() require('neotest').jump.prev({ status = 'failed' }) end,
        desc = 'Prev failed test',
      },
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-dotnet')({
            -- BTNet has root .sln files; discover across the whole solution so
            -- tests in sibling projects (Managers.Tests, Handlers.Tests, ...)
            -- are all visible rather than one project at a time.
            discovery_root = 'solution',
            -- Debug tests through the netcoredbg adapter wired up in dap.lua.
            dap = { adapter_name = 'coreclr' },
          }),
        },
      })
    end,
  },
}
