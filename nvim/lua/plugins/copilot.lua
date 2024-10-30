return {
  {
    'zbirenbaum/copilot.lua', -- Lua replacement for Copilot
    enabled = true,
    event = 'InsertEnter',
    opts = {
      suggestion = { auto_trigger = true, keymap = { accept = '<C-CR>' } },
    },
  },
  {
    'olimorris/codecompanion.nvim',
    enabled = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'hrsh7th/nvim-cmp', -- Optional: For using slash commands and variables in the chat buffer
      'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
      { 'stevearc/dressing.nvim', opts = {} }, -- Optional: Improves the default Neovim UI
    },
    config = function()
      require('codecompanion').setup({
        opts = {
          log_level = 'DEBUG', -- or "TRACE"
        },
        adapters = {
          groq = function()
            return require('codecompanion.adapters').extend('openai', {
              name = 'groq',
              schema = {
                model = {
                  default = 'llama-3.1-70b-versatile',
                },
                num_ctx = {
                  default = 131072,
                },
              },
              url = 'https://api.groq.com/openai/v1/chat/completions',
              env = {
                api_key = 'GROQ_API_KEY',
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = 'groq',
          },
          inline = {
            adapter = 'copilot',
          },
          agent = {
            adapter = 'groq',
          },
        },
      })
    end,
  },
}
