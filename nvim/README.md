# Neovim configuration

My handcrafted Neovim configuration written purely in Lua.

## Plugins

- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [barbar](https://github.com/romgrk/barbar.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cmp-calc](https://github.com/hrsh7th/cmp-calc)
- [cmp-emoji](https://github.com/hrsh7th/cmp-emoji)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [lspkind.nvim](https://github.com/onsails/lspkind.nvim)
- [copilot-cmp](https://github.com/zbirenbaum/copilot-cmp)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [copilot.lua](https://github.com/zbirenbaum/copilot.lua)
- [firenvim](https://github.com/glacambre/firenvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [web-tools.nvim](https://github.com/ray-x/web-tools.nvim)
- [playground](https://github.com/nvim-treesitter/playground)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [neodev.nvim](https://github.com/folke/neodev.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- [bullets.vim](https://github.com/dkarter/bullets.vim)
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
- [noice.nvim](https://github.com/folke/noice.nvim)
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [telekasten.nvim](https://github.com/renerocksai/telekasten.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-treesitter-refactor](https://github.com/nvim-treesitter/nvim-treesitter-refactor)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)

## Layout

The scheme of my Neovim configuration is rather simple once you understand it.

```
.
|-- ftplugin
|   `-- markdown.lua
|-- init.lua
|-- lazy-lock.json
|-- lua
|   |-- core
|   |   |-- autocmds.lua
|   |   |-- init.lua
|   |   `-- vars.lua
|   |-- keymaps.lua
|   `-- plugins
|       |-- alpha.lua
|       |-- autopairs.lua
|       |-- barbar.lua
|       |-- bullets.lua
|       |-- cmp.lua
|       |-- colorscheme.lua
|       |-- comment.lua
|       |-- copilot.lua
|       |-- general.lua
|       |-- gitsigns.lua
|       |-- lspconfig.lua
|       |-- lualine.lua
|       |-- markdown.lua
|       |-- noice.lua
|       |-- null-ls.lua
|       |-- nvim-tree.lua
|       |-- telekasten.lua
|       |-- telescope.lua
|       |-- todo.lua
|       |-- treesitter.lua
|       |-- trouble.lua
|       `-- which-key
|           |-- config.lua
|           |-- init.lua
|           `-- keymappings.lua
|-- spell
|   |-- en.utf-8.add
|   `-- en.utf-8.add.spl
`-- utils
    |-- linter-config
    `-- thesaurii.txt
```

The `init.lua` file is the main configuration file. It bootstraps my plugin
manager lazy.nvim and then loads the other modules. The `core` folder contains
some basic configuration for Neovim variables. `keymaps.lua` contains keymaps
for the editor. The plugins folder is the largest and most important since it
contains all the plugins and configuration for each of them that I use. All my
plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim) and are
grouped in separate files.

The `utils` folder has the configuration files for my Lua linters. I copied them
from the Neovim repository.

The `ftplugin` folder holds the configuration files for special file types. So
far, I have one for Markdown.
