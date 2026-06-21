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
    end,
  }
}
