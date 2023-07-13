return {
  {
    'zbirenbaum/copilot.lua', -- Lua replacement for Copilot
    event = 'InsertEnter',
    enabled = false,
    opts = {
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ['.'] = false,
      },
      copilot_node_command = 'node', -- Node version must be < 18
      plugin_manager_path = vim.fn.stdpath('data') .. '/site/pack/packer',
      server_opts_overrides = {},
    },
  },
}
