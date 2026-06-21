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
      },
    },
    config = function()
      -- Only install_dir is accepted in v1.x; all other options were removed
      require('nvim-treesitter').setup()

      -- Install parsers (no-op if already installed)
      require('nvim-treesitter').install({
        'lua',
        'rust',
        'python',
        'markdown',
        'markdown_inline',
        'bash',
        'typescript',
        'tsx',
        'javascript'
      })

      -- Highlighting: now native to Neovim; enable for any filetype that has a parser
      vim.api.nvim_create_autocmd('FileType', {
        pattern = '*',
        callback = function(args)
          local buf = args.buf
          -- Skip special/non-file buffers (noice popups, snacks notifications, etc.)
          if vim.bo[buf].buftype ~= '' then return end
          local lang = vim.treesitter.language.get_lang(args.match) or args.match
          -- language.add returns false (not error) when no parser exists, so
          -- capture its result rather than relying on pcall success alone.
          local ok, added = pcall(vim.treesitter.language.add, lang)
          if ok and added then
            vim.treesitter.start(buf, lang)
          end
        end,
      })

      -- Indentation (experimental)
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      require('nvim-treesitter-textobjects').setup({
        select = {
          lookahead = true,
          include_surrounding_whitespace = true,
        },
      })
      local select = require('nvim-treesitter-textobjects.select')
      local textobjects = {
        ['af'] = { '@function.outer', 'Select around function' },
        ['if'] = { '@function.inner', 'Select inside function' },
        ['ac'] = { '@class.outer', 'Select around class' },
        ['ic'] = { '@class.inner', 'Select inside class' },
      }
      for key, spec in pairs(textobjects) do
        vim.keymap.set({ 'x', 'o' }, key, function()
          select.select_textobject(spec[1], 'textobjects')
        end, { desc = spec[2] })
      end
    end,
  },
}
