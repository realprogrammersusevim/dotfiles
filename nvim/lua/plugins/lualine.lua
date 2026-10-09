local wc_fts = {
  markdown = true,
  text = true,
  typst = true,
}

local wc_cache = {}

return {
  'nvim-lualine/lualine.nvim', -- Status line
  event = 'VeryLazy',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd(
      { 'BufEnter', 'BufWritePost', 'TextChanged', 'TextChangedI' }, {
        group = vim.api.nvim_create_augroup('LualineWordCount', { clear = true }),
        callback = function(ev)
          local ft = vim.bo[ev.buf].filetype
          if wc_fts[ft] then
            local wc = vim.fn.wordcount()
            wc_cache[ev.buf] = wc.words
          end
        end,
      })
    require('lualine').setup(opts)
  end,
  opts = {
    options = {
      theme = 'auto', -- Needed so lazy loading isn't screwed up
      component_separators = '|',
      section_separators = { left = '', right = '' },
      globalstatus = true,
      disabled_filetypes = {
        'netrw',
        'alpha',
        'lazy',
        'TelescopePrompt',
        'snacks_dashboard'
      },
    },
    sections = {
      lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
      lualine_b = {
        { 'filename', symbols = { modified = '', readonly = '' } },
        'branch',
      },
      lualine_c = { 'diagnostics' },
      lualine_x = {
        function()
          local ft = vim.bo.filetype
          if not wc_fts[ft] then return '' end
          if vim.fn.mode():find('^[vV\22]') then
            return tostring(vim.fn.wordcount().visual_words or 0)
          end
          local buf = vim.api.nvim_get_current_buf()
          if not wc_cache[buf] then
            wc_cache[buf] = vim.fn.wordcount().words
          end
          return tostring(wc_cache[buf])
        end,
      },
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
  },
}
