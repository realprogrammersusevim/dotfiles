local dap = require('dap')

dap.adapters.bashdb = {
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/bin/bash-debug-adapter',
  name = 'bashdb',
}

dap.configurations.sh = {
  {
    type = 'bashdb',
    request = 'launch',
    name = 'Launch script',
    showDebugOutput = true,
    pathBashdb = vim.fn.stdpath('data')
      .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
    pathBashdbLib = vim.fn.stdpath('data')
      .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir',
    trace = true,
    file = '${file}',
    program = '${file}',
    cwd = '${workspaceFolder}',
    pathCat = 'cat',
    pathBash = '/opt/homebrew/bin/bash',
    pathMkfifo = 'mkfifo',
    pathPkill = 'pkill',
    args = {},
    env = {},
    terminalKind = 'integrated',
  },
}
