return {
  {
    'rcarriga/nvim-dap-ui',
    lazy = true,
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio'
    },
    config = function()
      require('dapui').setup()
      local dap = require('dap')
      local codelldb = vim.fn.exepath('codelldb')
      if codelldb == '' then
        codelldb = vim.fn.expand('~/code/codelldb/extension/adapter/codelldb')
      end
      dap.adapters.codelldb = {
        type = 'executable',
        command = codelldb,
      }
      dap.configurations.cpp = {
        {
          name = 'Launch file',
          type = 'codelldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          args = function()
            local input = vim.fn.input('Arguments: ')
            -- Split string into a list for DAP
            return vim.split(input, ' ')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          console = 'integratedTerminal'
        },
      }
      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      -- .NET / C# debugging via netcoredbg (installed through Mason).
      local netcoredbg = vim.fn.exepath('netcoredbg')
      if netcoredbg == '' then
        netcoredbg = vim.fn.stdpath('data') .. '/mason/bin/netcoredbg'
        if vim.fn.has('win32') == 1 then
          netcoredbg = netcoredbg .. '.exe'
        end
      end
      dap.adapters.coreclr = {
        type = 'executable',
        command = netcoredbg,
        args = { '--interpreter=vscode' },
      }
      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'Launch - netcoredbg',
          request = 'launch',
          program = function()
            return vim.fn.input(
              'Path to dll: ',
              vim.fn.getcwd() .. '/bin/Debug/',
              'file'
            )
          end,
          cwd = '${workspaceFolder}',
          stopAtEntry = false,
        },
        {
          type = 'coreclr',
          name = 'Attach - netcoredbg',
          request = 'attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
      }
    end,
  }
}
