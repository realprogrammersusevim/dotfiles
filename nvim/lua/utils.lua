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

function M.file_to_big()
  local max_filesize = 100 * 1024 -- 100 KB
  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
  if of and stats and stats.size > max_filesize then
    return true
  else
    return false
  end
end

return M
