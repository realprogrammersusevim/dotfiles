return {
  {
    'folke/trouble.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    cmd = 'TroubleToggle',
    config = function()
      require('trouble').setup({ use_diagnostic_signs = true })
    end,
  },
}
