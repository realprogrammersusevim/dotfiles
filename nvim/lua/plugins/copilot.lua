return {
  {
    'zbirenbaum/copilot.lua', -- Lua replacement for Copilot
    enabled = false,
    event = 'InsertEnter',
    opts = {
      suggestion = {
        enabled = false,
        auto_trigger = true,
        keymap = { accept = '<C-CR>' }
      },
      panel = { enabled = false },
    },
  },

  {
    'olimorris/codecompanion.nvim',
    enabled = false,
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim',         -- Optional: For using slash commands
      { 'stevearc/dressing.nvim', opts = {} }, -- Optional: Improves the default Neovim UI
    },
    config = function()
      require('codecompanion').setup({
        opts = {
          log_level = 'DEBUG', -- or "TRACE"
        },
        strategies = {
          chat = {
            adapter = 'gemini',
          },
          inline = {
            adapter = 'copilot',
          },
          agent = {
            adapter = 'gemini',
          },
        },
      })
    end,
  },
}
