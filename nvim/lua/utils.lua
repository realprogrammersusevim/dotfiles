local M = {}

function M.plugin_time()
  local math = require('math')
  local stats = require('lazy').stats()
  return '⚡️ Neovim loaded '
    .. stats.loaded
    .. ' plugins in '
    .. math.floor(stats.startuptime)
    .. 'ms'
end

return M
