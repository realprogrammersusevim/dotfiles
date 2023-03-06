# dotfiles

These are my configuration files for Zsh, gitui, my browser new tab page, and
NeoVim. Above all, please do not just copy and paste them into your own
configuration files. They are meant to be used as inspiration for your own
configuration. Your tools should reflect your own needs, not mine.

## Installation

1. Clone the repository
2. Move the files in the `zsh/` folder to your home directory
3. Move the `nvim/` files to your NeoVim config location (on macOS that's
   `~/.config/nvim/`)
4. Edit the NeoVim plugins that point to filepaths to instead point to the
   correct URL
5. Install zplug and oh-my-zsh
6. Run `$ zplug install`
7. Install the LSPs, formatters, and diagnostics with `:Mason`
8. Use the `browser/new_tab.html` page as your new tab page in your browser

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
some basic configuration for Neovim variables. `keymaps.lua` contains basic
keymaps for the editor. The plugins folder is the largest and most important
since it contains all the plugins and configuration for each of them that I use.
All of my plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim)
and are grouped in separate files.

The `utils` folder has the configuration files for my Lua linters. I copied them
from the Neovim repository.

The `ftplugin` folder holds the configuration files for special file types. So
far, I only have one for Markdown.
