local wc_fts = {
  markdown = true,
  text = true,
  typst = true
}

return {
  'nvim-lualine/lualine.nvim', -- Status line
  event = 'VeryLazy',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
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
          if not wc_fts[ft] then
            return ''
          end

          local wc = vim.fn.wordcount()
          local count = wc.visual_words or wc.words

          if not count then
            return ''
          end

          return tostring(count)
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
