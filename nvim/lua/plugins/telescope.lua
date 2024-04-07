return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    cmd = 'Telescope',
    config = function()
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ['<C-m>'] = function(prompt_bufnr)
                local entry = require('telescope.actions.state').get_selected_entry()
                require('telescope.actions').close(prompt_bufnr)
                local stripped_filename = entry.filename:match('^(.+)%..+$')
                vim.api.nvim_put({ '[[' .. stripped_filename .. ']]' }, '', false, true)
              end,
              ['<CR>'] = require('telescope.actions').select_default
                + require('telescope.actions').center,
            },
          },
        },

        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      })

      require('telescope').load_extension('fzf')
    end,
  },
}
