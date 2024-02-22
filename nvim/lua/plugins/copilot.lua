return {
  {
    'zbirenbaum/copilot.lua', -- Lua replacement for Copilot
    event = 'InsertEnter',
    opts = {
      suggestion = { auto_trigger = true, keymap = { accept = '<C-CR>' } },
    },
  },
}
