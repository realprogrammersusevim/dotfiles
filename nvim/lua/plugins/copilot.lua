return {
  {
    'zbirenbaum/copilot.lua', -- Lua replacement for Copilot
    event = 'InsertEnter',
    enabled = true,
    opts = {
      copilot_node_command = 'node', -- Node version must be < 18
      plugin_manager_path = vim.fn.stdpath('data') .. '/site/pack/packer',
      server_opts_overrides = {},
    },
  },
}
