require "paq" {
    "savq/paq-nvim";

    "goolord/alpha-nvim";
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = {'lua', 'python', 'rust', 'yaml', 'json'},
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
    },
    textobjects = {
        enable = true,
    },
    refactor = {
        enable = true,
    },
}


local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "f", "> Find file", ":Telescope find_files<CR>"),
    dashboard.button( "r", "> Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "> Settings" , ":e ~/.config/nvim/nvim_init.lua<CR>:e $MYVIMRC<CR>"),
    dashboard.button( "q", "> Quit NVIM", ":qa<CR>"),
}

-- Set footer
local fortune = require("alpha.fortune") 
dashboard.section.footer.val = fortune()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

vim.notify = require("notify")

local stages_util = require("notify.stages.util")

-- Make notifications slide in and out
return {
  function(state)
    local next_height = state.message.height + 2
    local next_row = stages_util.available_slot(
      state.open_windows,
      next_height,
      stages_util.DIRECTION.TOP_DOWN
    )
    if not next_row then
      return nil
    end
    return {
      relative = "editor",
      anchor = "NE",
      width = 1,
      height = state.message.height,
      col = vim.opt.columns:get(),
      row = next_row,
      border = "rounded",
      style = "minimal",
    }
  end,
  function(state)
    return {
      width = { state.message.width, frequency = 2 },
      col = { vim.opt.columns:get() },
    }
  end,
  function()
    return {
      col = { vim.opt.columns:get() },
      time = true,
    }
  end,
  function()
    return {
      width = {
        1,
        frequency = 2.5,
        damping = 0.9,
        complete = function(cur_width)
          return cur_width < 2
        end,
      },
      col = { vim.opt.columns:get() },
    }
  end,
}
