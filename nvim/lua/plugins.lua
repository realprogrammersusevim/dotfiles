local function get_setup(name)
  return string.format('require("setup.%s")', name)
end

-- Load packer
-- vim.cmd([[packadd packer.nvim]])

return require('packer').startup(
  function(use)
    use('wbthomason/packer.nvim') -- Packer can manage itself

    use('folke/neodev.nvim') -- Set up Neovim development environment

    use('nvim-lua/plenary.nvim') -- Misc. Lua functions for Neovim plugins

    use({
      'nvim-telescope/telescope.nvim', -- Fuzzy finder over lists
      requires = { 'nvim-lua/plenary.nvim' },
      config = get_setup('telescope'),
    })

    use({
      'windwp/nvim-autopairs', -- Insert or delete brackets, parens, quotes in pair
      config = get_setup('autopairs'),
    })

    use({
      'nvim-treesitter/nvim-treesitter', -- Syntax highlighting
      run = ':TSUpdate',
      config = get_setup('treesitter'),
    })

    use({
      'nvim-treesitter/nvim-treesitter-textobjects', -- Text objects for treesitter
      requires = { 'nvim-treesitter/nvim-treesitter' },
    })

    use({
      'nvim-treesitter/nvim-treesitter-refactor', -- Refactoring using treesitter
      config = get_setup('treesitter_refactor'),
      requires = { 'nvim-treesitter/nvim-treesitter' },
    })

    use({
      'nvim-treesitter/nvim-treesitter-context', -- Show the current context
      config = get_setup('treesitter_context'),
      requires = { 'nvim-treesitter/nvim-treesitter' },
    })

    use('nvim-tree/nvim-web-devicons') -- Fancy icons for Neovim plugins

    use({
      'nvim-tree/nvim-tree.lua', -- File explorer
      commands = 'NvimTreeToggle', -- I only ever use the keybind to this command
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = get_setup('nvim-tree'),
    })

    use({
      'folke/which-key.nvim', -- Remembers your keybindings
      config = get_setup('which-key'),
    })

    use({
      'goolord/alpha-nvim', -- Fancy start screen
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = get_setup('alpha-dash'),
    })

    use({
      'folke/tokyonight.nvim', -- Color scheme
      config = get_setup('tokyonight'),
    })

    use({
      'glacambre/firenvim', -- Use Neovim as an editor in any text field on the web
      run = function()
        vim.fn['firenvim#install'](0)
      end,
    })

    use({
      'numToStr/Comment.nvim', -- Comment stuff out
      config = get_setup('comment'),
    })

    use({
      'iamcco/markdown-preview.nvim', -- Markdown preview in a browser
      run = 'cd app && yarn install',
      config = get_setup('markdown-preview'),
    })

    use({
      'hrsh7th/nvim-cmp', -- Autocompletion plugin
      -- event = 'InsertEnter',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-emoji',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-cmdline',
        'onsails/lspkind.nvim',
        'petertriho/cmp-git',
        'zbirenbaum/copilot-cmp',
        'neovim/nvim-lspconfig',
      },
      config = get_setup('cmp'),
    })

    use('hrsh7th/cmp-nvim-lsp') -- cmp source

    use('hrsh7th/cmp-buffer') -- cmp source

    use('hrsh7th/cmp-path') -- cmp source

    use('hrsh7th/cmp-nvim-lua') -- cmp source

    use('hrsh7th/cmp-calc') -- cmp source

    use('hrsh7th/cmp-emoji') -- cmp source

    use('saadparwaiz1/cmp_luasnip') -- cmp source

    use('L3MON4D3/LuaSnip') -- Snippets plugin

    use('hrsh7th/cmp-cmdline') -- cmp source

    use({
      'petertriho/cmp-git',

      requires = 'nvim-lua/plenary.nvim',
      config = get_setup('cmp-git'),
    }) -- cmp source

    use({
      'zbirenbaum/copilot-cmp',

      requires = 'zbirenbaum/copilot.lua',
      config = get_setup('copilot-cmp'),
    })

    use({
      'folke/todo-comments.nvim', -- Highlight TODO/FIXME/BUG/NOTE tags
      event = 'BufRead',
      config = get_setup('todo'),
    })

    use({
      'neovim/nvim-lspconfig',
      requires = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
      },
    }) -- Collection of configurations for built-in LSP client

    use({
      'jose-elias-alvarez/null-ls.nvim', -- Automatic code actions (diagnotics, formatting, etc.)
      event = 'BufRead',
      requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
      config = get_setup('null-ls'),
    })

    use({
      'lewis6991/gitsigns.nvim', -- Git signs in the gutter
      config = get_setup('gitsigns'),
    })

    use({
      'nvim-lualine/lualine.nvim', -- Status line
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = get_setup('lualine'),
    })

    use('onsails/lspkind.nvim') -- Pictograms for LSP completion items

    use('folke/lsp-colors.nvim') -- Colors for LSP diagnostics

    use({ -- GitHub integration
      'pwntester/octo.nvim',
      config = get_setup('octo'),
      command = 'Octo',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'kyazdani42/nvim-web-devicons',
      },
    })

    use('lukas-reineke/indent-blankline.nvim') -- Indent guides

    use('ibhagwan/smartyank.nvim') -- Smart yank (don't pollute the clipboard)

    use({
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      cmd = 'TroubleToggle',
      config = get_setup('trouble'),
    })

    use({
      'zbirenbaum/copilot.lua', -- Lua replacement for Copilot

      config = get_setup('copilot'),
    })

    use({
      '/Users/jonathanmilligan/Documents/GitHub/readability.nvim/',
      cmd = 'Readability',
    })

    use({ 'dkarter/bullets.vim', config = get_setup('bullets') })

    use('lewis6991/impatient.nvim')

    use({
      'romgrk/barbar.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = get_setup('barbar'),
    })

    use({ 'folke/zen-mode.nvim', cmd = 'ZenMode', config = get_setup('zen-mode') })

    use({ 'folke/twilight.nvim', config = get_setup('twilight') })

    use({ 'williamboman/mason.nvim', config = get_setup('mason') })

    use('williamboman/mason-lspconfig.nvim')

    use({ 'skywind3000/asyncrun.vim', cmd = 'AsyncRun' })

    use({ 'rcarriga/nvim-notify' })

    use({ 'MunifTanjim/nui.nvim' })

    use({
      'folke/noice.nvim',
      config = get_setup('noice'),
      requires = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        'MunifTanjim/nui.nvim', -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        'rcarriga/nvim-notify',
      },
    })

    use({ 'renerocksai/telekasten.nvim', config = get_setup('telekasten') })
  end -- ,
  -- config = {
  --   display = {
  --     open_fn = function()
  --       return require('packer.util').float({ border = 'single' })
  --     end
  --   }
)
