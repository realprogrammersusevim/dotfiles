return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    enabled = not require('utils').file_to_big(),
    config = function()
      require('nvim-treesitter.configs').setup({
        -- A list of parser names, or "all"
        ensure_installed = { 'lua', 'rust', 'vim', 'python', 'markdown', 'bash' },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        -- List of parsers to ignore installing (for "all")
        -- ignore_install = { 'javascript' },

        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

        highlight = {
          -- `false` will disable the whole extension
          enable = true,
          -- disable = require('utils').file_to_big(),
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-refactor',
    event = { 'BufRead', 'BufNewFile' },
    enabled = not require('utils').file_to_big(),
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = { 'gnd', 'gnD', 'g0', '<a-*>', '<a-#>' },
    config = function()
      require('nvim-treesitter.configs').setup({
        refactor = {
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = 'grr',
            },
          },
          highlight_definitions = {
            enable = true,
          },
          navigation = {
            enable = true,
            keymaps = {
              goto_definition = 'gnd',
              list_definitions = 'gnD',
              list_definitions_toc = 'gO',
              goto_next_usage = '<a-*>',
              goto_previous_usage = '<a-#>',
            },
          },
        },
      })
    end,
  },
}
