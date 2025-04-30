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
      disabled_filetypes = { 'netrw', 'alpha', 'lazy', 'TelescopePrompt', 'snacks_dashboard' },
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
          if
            vim.bo.filetype == 'md'
            or vim.bo.filetype == 'txt'
            or vim.bo.filetype == 'markdown'
          then
            if vim.fn.wordcount().visual_words == 1 then
              return tostring(vim.fn.wordcount().visual_words)
            elseif not (vim.fn.wordcount().visual_words == nil) then
              return tostring(vim.fn.wordcount().visual_words)
            else
              return tostring(vim.fn.wordcount().words)
            end
          else
            return ''
          end
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
