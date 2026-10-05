return {
  {
    'R-nvim/R.nvim',
    -- R.nvim sets itself up on R/Rmd/Quarto filetypes, so it shouldn't be lazy-loaded
    lazy = false,
    config = function()
      require('r').setup({
        R_args = { '--quiet', '--no-save' },
        hook = {
          on_filetype = function()
            -- Send line (and move down) / selection to the R console
            vim.keymap.set('n', '<CR>', '<Plug>RDSendLine', { buffer = true })
            vim.keymap.set('v', '<CR>', '<Plug>RSendSelection', { buffer = true })
          end,
        },
        min_editor_width = 72,
        rconsole_width = 78,
      })
    end,
  },
}
