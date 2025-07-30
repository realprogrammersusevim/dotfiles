return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    cmd = 'Telescope',
    keys = {

      {
        '<leader>ss',
        '<CMD>Telescope<CR>',
        desc = 'Search',
      },
      {
        '<leader>sb',
        '<CMD>Telescope git_branches<CR>',
        desc = '[b]ranches',
      },
      {
        '<leader>sc',
        '<CMD>Telescope colorscheme<CR>',
        desc = '[c]olorscheme',
      },
      {
        '<leader>sf',
        '<CMD>Telescope find_files<CR>',
        desc = '[f]ile',
      },
      {
        '<leader>sh',
        '<CMD>Telescope help_tags<CR>',
        desc = '[h]elp',
      },
      {
        '<leader>sH',
        '<CMD>Telescope highlights<CR>',
        desc = '[H]ighlight groups',
      },
      {
        '<leader>sM',
        '<CMD>Telescope man_pages<CR>',
        desc = '[M]an pages',
      },
      {
        '<leader>sr',
        '<CMD>Telescope oldfiles<CR>',
        desc = '[r]ecent file',
      },
      {
        '<leader>sR',
        '<CMD>Telescope registers<CR>',
        desc = '[R]egisters',
      },
      {
        '<leader>st',
        '<CMD>Telescope live_grep<CR>',
        desc = '[t]ext',
      },
      {
        '<leader>sT',
        '<CMD>TodoTelescope<CR>',
        desc = '[T]odos',
      },
      {
        '<leader>sk',
        '<CMD>Telescope keymaps<CR>',
        desc = '[k]eymaps',
      },
      {
        '<leader>sC',
        '<CMD>Telescope commands<CR>',
        desc = '[C]ommands',
      },
      {
        '<leader>sp',
        '<CMD>Telescope planets<CR>',
        desc = '[p]lanets',
      },
    },
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
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = 'smart_case',       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      })

      require('telescope').load_extension('fzf')
    end,
  },
}
