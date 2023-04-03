return {
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    ft = { 'norg' },
    opts = {
      load = {
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.norg.concealer'] = {}, -- Adds pretty icons to your documents
        ['core.norg.dirman'] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = '~/notes',
            },
          },
        },
        ['core.export.markdown'] = {},
        ['core.norg.completion'] = { config = { engine = 'nvim-cmp', name = 'Neorg' } },
      },
    },
    dependencies = { { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' } },
  },
}
