return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- NOTE: v1.x rewrite — does NOT support lazy-loading
    lazy = false,
    build = ':TSUpdate',
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        setup = {

          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = { query = '@function.outer', desc = 'Select around function' },
              ['if'] = { query = '@function.inner', desc = 'Select inside function' },
              ['ac'] = { query = '@class.outer', desc = 'Select around class' },
              ['ic'] = { query = '@class.inner', desc = 'Select inside class' },
            },
            include_surrounding_whitespace = true,
          },
        }
      },
    },
    config = function()
      -- Only install_dir is accepted in v1.x; all other options were removed
      require('nvim-treesitter').setup()

      -- Install parsers (no-op if already installed)
      require('nvim-treesitter').install({
        'lua',
        'rust',
        'vim',
        'python',
        'markdown',
        'bash'
      })

      -- Highlighting: now native to Neovim; enable for all filetypes that have a parser
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { '<filetype>' },
        callback = function() vim.treesitter.start() end,
      })

      -- Indentation (experimental)
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
