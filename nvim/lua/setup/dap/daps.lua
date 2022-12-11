local dap = require('dap')

dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    -- CHANGE THIS to your path!
    command = vim.fn.stdpath('data') .. '/codelldb-aarch64-darwin/extension/adapter/codelldb',
    args = { '--port', '${port}' },
  },
}

dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = 'Attach to running Neovim instance',
  },
}

dap.adapters.nlua = function(callback, config)
  callback({
    type = 'server',
    host = config.host or '127.0.0.1',
    port = config.port or 8086,
  })
end
