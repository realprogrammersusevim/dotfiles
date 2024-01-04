return {
  'mfussenegger/nvim-dap',
  lazy = true,
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'jbyuki/one-small-step-for-vimkind',
    { 'theHamsta/nvim-dap-virtual-text', config = true },
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup()

    -- Configure the signs
    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define(
      'DapBreakpointCondition',
      { text = '', texthl = '', linehl = '', numhl = '' }
    )
    vim.fn.sign_define('DapLogPoint', { text = '', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define(
      'DapBreakpointRejected',
      { text = '', texthl = '', linehl = '', numhl = '' }
    )

    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    require('plugins.dap.lua')
    require('plugins.dap.rust')
    require('plugins.dap.python')
    require('plugins.dap.bash')
  end,
}
