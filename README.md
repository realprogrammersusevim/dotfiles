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
6. Install Packer
7. Run `$ zplug install`
8. Run `:PackerInstall` from inside NeoVim
9. Install the LSPs, formatters, and diagnostics with `:Mason`
10. Use the `browser/new_tab.html` page as your new tab page in your browser

## Layout

The scheme of my Neovim configuration is rather simple once you understand it.

```
.
├── ftplugin
│   └── markdown.lua
├── init.lua
├── lua
│   ├── autocmds.lua
│   ├── commands.lua
│   ├── mappings.lua
│   ├── plugins.lua
│   ├── setup
│   │   ├── alpha.lua
│   │   ├── autopairs.lua
│   │   ├── barbar.lua
│   │   ├── bullets.lua
│   │   ├── cmp-git.lua
│   │   ├── cmp.lua
│   │   ├── comment.lua
│   │   ├── copilot-cmp.lua
│   │   ├── copilot.lua
│   │   ├── gitsigns.lua
│   │   ├── lspconfig.lua
│   │   ├── lualine.lua
│   │   ├── markdown-preview.lua
│   │   ├── mason.lua
│   │   ├── navic.lua
│   │   ├── noice.lua
│   │   ├── null-ls.lua
│   │   ├── nvim-tree.lua
│   │   ├── octo.lua
│   │   ├── telekasten.lua
│   │   ├── telescope.lua
│   │   ├── todo.lua
│   │   ├── tokyonight.lua
│   │   ├── treesitter.lua
│   │   ├── treesitter_refactor.lua
│   │   ├── trouble.lua
│   │   ├── webtools.lua
│   │   ├── which-key
│   │   │   ├── config.lua
│   │   │   ├── init.lua
│   │   │   └── keymappings.lua
│   └── vars.lua
└── utils
    ├── linter-config
    └── thesaurii.txt
```

The `init.lua` file loads my key mappings, variables, and plugins. Each plugin
has a configuration file in the setup directory. No matter how small the
configuration a plugin needs, I still want it in its own file so it's easier to
find later. It also keeps a hard rule to make sure my plugin file doesn't get
too long.

The `utils` folder has the configuration files for my Lua linters. I copied them
from the Neovim repository.

The `ftplugin` folder holds the configuration files for special file types. So
far, I only have one for Markdown.
