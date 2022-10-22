function get_setup(name)
	return string.format('require("setup.%s")', name)
end

return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	use "folke/lua-dev.nvim"

	use "antoinemadec/FixCursorHold.nvim"

	use "nvim-lua/plenary.nvim"

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use({
		"windwp/nvim-autopairs",
		config = get_setup("autopairs"),
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = get_setup("treesitter"),
	})

	use "nvim-tree/nvim-web-devicons"

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		config = get_setup("nvim-tree"),
	})

	use({
		"folke/which-key.nvim",
		config = get_setup("which-key"),
	})

	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = get_setup("alpha-dash"),
	})

	use({
		"folke/tokyonight.nvim",
		config = get_setup("tokyonight"),
	})

	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	use({
		"numToStr/Comment.nvim",
		config = get_setup("comment"),
	})

  use 'github/copilot.vim'

  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    config = get_setup("markdown-preview"),
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-cmdline',
    },
    config = get_setup("cmp"),
  }

  use 'hrsh7th/cmp-nvim-lsp'

  use 'hrsh7th/cmp-buffer'

  use 'hrsh7th/cmp-path'

  use 'hrsh7th/cmp-nvim-lua'

  use 'hrsh7th/cmp-calc'

  use 'hrsh7th/cmp-emoji'

  use 'hrsh7th/cmp-vsnip'

  use 'hrsh7th/vim-vsnip'

  use 'hrsh7th/vim-vsnip-integ'

  use 'saadparwaiz1/cmp_luasnip'

  use 'L3MON4D3/LuaSnip'

  use 'hrsh7th/cmp-cmdline'

  use {
    'folke/todo-comments.nvim',
    config = get_setup("todo"),
  }

  use 'neovim/nvim-lspconfig'

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
    config = get_setup("null-ls"),
  }
end)
