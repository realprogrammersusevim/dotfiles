# Neovim configuration

## What is this?

My handcrafted Neovim configuration written purely in Lua.

## How can I use it?

Move it to the `~/.config/nvim` directory. You'll need to install some LSPs and
linters for some languages to work properly but my plugin manager should take
care of the rest.

## Plugins

- [barbecue](https://github.com/utilyre/barbecue.nvim)
- [bullets.vim](https://github.com/dkarter/bullets.vim)
- [catppuccin](https://github.com/catppuccin/nvim)
- [cmp-calc](https://github.com/hrsh7th/cmp-calc)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [cmp-emoji](https://github.com/hrsh7th/cmp-emoji)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [copilot.lua](https://github.com/zbirenbaum/copilot.lua)
- [copilot-cmp](https://github.com/zbirenbaum/copilot-cmp)
- [web-tools.nvim](https://github.com/ray-x/web-tools.nvim)
- [twilight.nvim](https://github.com/folke/twilight.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [firenvim](https://github.com/glacambre/firenvim)
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [lspkind.nvim](https://github.com/onsails/lspkind.nvim)
- [rose-pine](https://github.com/rose-pine/neovim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
- [playground](https://github.com/nvim-treesitter/playground)
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [persistence.nvim](https://github.com/folke/persistence.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- [neodev.nvim](https://github.com/folke/neodev.nvim)
- [nvim-treesitter-refactor](https://github.com/nvim-treesitter/nvim-treesitter-refactor)
- [neogit](https://github.com/TimUntersberger/neogit)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [neorg](https://github.com/nvim-neorg/neorg)
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [noice.nvim](https://github.com/folke/noice.nvim)
- [nvim-surround](https://github.com/kylechui/nvim-surround)
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim)
- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

## Layout

The scheme of my Neovim configuration is rather simple once you understand it.

```
.
├── README.md
├── ftplugin
│   └── markdown.lua
├── init.lua
├── lazy-lock.json
├── lua
│   ├── commands.lua
│   ├── core.lua
│   ├── keymaps.lua
│   ├── plain.lua
│   └── plugins
│       ├── autopairs.lua
│       ├── code.lua
│       ├── colorscheme.lua
│       ├── copilot.lua
│       ├── firenvim.lua
│       ├── lsp.lua
│       ├── lualine.lua
│       ├── markdown.lua
│       ├── misc.lua
│       ├── neorg.lua
│       ├── noice.lua
│       ├── telescope.lua
│       ├── todo.lua
│       ├── treesitter.lua
│       ├── trouble.lua
│       ├── ui.lua
│       └── which-key
│           ├── config.lua
│           ├── init.lua
│           └── keymappings.lua
├── spell
│   ├── en.utf-8.add
│   ├── en.utf-8.add.spl
│   ├── nl.utf-8.spl
│   └── nl.utf-8.sug
└── utils
    ├── thesaurii.txt
    └── linter-config
        ├── .luacheckrc
        └── .stylua.toml
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
