-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
local execute = vim.api.nvim_command
local fn = vim.fn

local pack_path = fn.stdpath('data') .. '/site/pack'
local fmt = string.format

local function ensure(user, repo)
  -- Ensures a given github.com/USER/REPO is cloned in the pack/packer/start directory.
  local install_path = fmt('%s/packer/start/%s', pack_path, repo)
  if fn.empty(fn.glob(install_path)) > 0 then
    execute(fmt('!git clone https://github.com/%s/%s %s', user, repo, install_path))
    execute(fmt('packadd %s', repo))
  end
end

-- Make sure the plugins that are absolutely required for everything else to function are installed
ensure('wbthomason', 'packer.nvim')
ensure('lewis6991', 'impatient.nvim')

-- Impatient pre-compiles and caches all my Lua modules
require('impatient')

-- Load my plugin file
require('plugins')

-- Load the general variable settings
require('vars')

-- Load all my key mappings
require('mappings')

-- Finally, load my custom commands
require('commands')
