return {
  {
    'zbirenbaum/copilot.lua', -- Lua replacement for Copilot
    enabled = true,
    event = 'InsertEnter',
    opts = {
      suggestion = { auto_trigger = true, keymap = { accept = '<C-CR>' } },
    },
  },
}
