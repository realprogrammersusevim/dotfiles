local function get_setup(name)
  return string.format('require("setup.%s")', name)
end

-- Load packer
vim.cmd([[packadd packer.nvim]])

require('packer').startup({
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
      on = { 'InsertEnter', 'InsertLeave' },
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

    use('nvim-tree/nvim-web-devicons') -- Fancy icons for Neovim plugins

    use({
      'nvim-tree/nvim-tree.lua', -- File explorer
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
      config = get_setup('alpha'),
    })

    use({
      'folke/tokyonight.nvim', -- Color scheme
      config = get_setup('tokyonight'),
    })

    use({
      'rebelot/kanagawa.nvim',
      config = get_setup('kanagawa'),
      disable = true,
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
      ft = 'markdown',
    })

    use({
      'hrsh7th/nvim-cmp', -- Autocompletion plugin
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

    use({
      'petertriho/cmp-git',

      requires = 'nvim-lua/plenary.nvim',
      config = get_setup('cmp-git'),
      opt = true,
    }) -- cmp source

    use({
      'zbirenbaum/copilot-cmp',

      requires = 'zbirenbaum/copilot.lua',
      config = get_setup('copilot-cmp'),
      opt = true,
    })

    use({
      'folke/todo-comments.nvim', -- Highlight TODO/FIXME/BUG/NOTE tags
      event = 'BufRead',
      config = get_setup('todo'),
    })

    use({
      'neovim/nvim-lspconfig',
      config = get_setup('lspconfig'),
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

    use('/Users/jonathanmilligan/Documents/GitHub/md-to-html.nvim')

    use({
      '/Users/jonathanmilligan/Documents/GitHub/readability.nvim/', -- My own plugin to gauge the readability of your writing
      cmd = { 'ReadabilitySmog', 'ReadabilityFlesch' },
    })

    use({
      'dkarter/bullets.vim',
      config = get_setup('bullets'),
      ft = 'markdown',
    }) -- Handle Markdown bullets better

    use('lewis6991/impatient.nvim') -- Load Neovim faster

    use({
      'romgrk/barbar.nvim', -- Nice buffer bar
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = get_setup('barbar'),
    })

    use({
      'williamboman/mason.nvim',
      config = get_setup('mason'),
      requires = { 'neovim/nvim-lspconfig' },
    }) -- Install code related tools

    use({ 'skywind3000/asyncrun.vim', cmd = 'AsyncRun' }) -- Asynchronously run commands

    -- Only load Noice if we're not in a GUI or firenvim
    use({
      'folke/noice.nvim',
      config = get_setup('noice'),
      cond = function()
        return not vim.g.neovide and not vim.g.started_by_firenvim and not vim.g.goneovim
      end,
      requires = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        'MunifTanjim/nui.nvim', -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        'rcarriga/nvim-notify',
      },
    })

    use({
      'SmiteshP/nvim-navic',
      requires = { 'neovim/nvim-lspconfig' },
      config = get_setup('navic'),
    })

    use({
      'ray-x/web-tools.nvim',
      config = function()
        require('web-tools.').setup()
      end,
    })

    use({ 'Eandrju/cellular-automaton.nvim', cmd = 'CellularAutomoton' })

    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

    use({ 'tamton-aquib/duck.nvim', opt = true })

    use({ 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' })

    use({ 'karb94/neoscroll.nvim', config = get_setup('neoscroll') })
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    },
  },
})
