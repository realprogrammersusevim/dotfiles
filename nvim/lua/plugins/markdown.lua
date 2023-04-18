return {
  {
    'dkarter/bullets.vim',
    event = 'VeryLazy',
    config = function()
      vim.g.bullets_enabled_file_types = { 'markdown', 'text', 'gitcommit', 'scratch' }
      vim.g.bullets_delete_last_bullet_if_empty = 1
      vim.g.bullets_pad_right = 0
    end,
  },

  {
    'iamcco/markdown-preview.nvim', -- Markdown preview in a browser
    build = 'cd app && yarn install',
    cmd = 'MarkdownPreviewToggle',
  },

  {
    'epwalsh/obsidian.nvim',
    enabled = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-telescope/telescope.nvim',
    },
    cmd = 'ObsidianFollowLink',
    event = 'InsertEnter',
    config = function()
      require('obsidian').setup({
        dir = '~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettelkasten/',
        completion = {
          nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
        },
      })
    end,
  },
}
