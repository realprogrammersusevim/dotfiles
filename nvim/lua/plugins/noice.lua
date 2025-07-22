return {
  {
    'folke/noice.nvim',
    opts = {
      presets = {
        command_palette = true,
      },
      popupmenu = {
        enabled = true,  -- enables the Noice popupmenu UI
        ---@type 'nui'|'cmp'
        backend = 'nui', -- backend to use to show regular cmdline completions
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
    },
  },
}
