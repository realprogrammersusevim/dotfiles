local dap = require('dap')

dap.adapters.python = {
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/bin/debugpy-adapter',
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',
    program = '${file}',
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      local pyenv = cwd .. '/.venv/bin/python'
      if vim.fn.executable(pyenv) == 1 then
        return pyenv
      else
        return '/opt/homebrew/bin/python3'
      end
    end,
  },
}
