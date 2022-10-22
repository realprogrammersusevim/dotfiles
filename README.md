# dotfiles
These are my configuration files for Zsh and NeoVim. Above all, please do not just copy and paste them into your own configuration files. They are meant to be used as inspiration for your own configuration. Your tools should reflect your own needs, not mine.

## Layout

The scheme of my config layout is rather simple.

```
.
|-- init.lua
`-- lua
    |-- mappings.lua
    |-- plugins.lua
    |-- vars.lua
    `-- setup
        |-- alpha-dash.lua
        |-- autopairs.lua
        |-- cmp.lua
        |-- comment.lua
        |-- markdown-preview.lua
        |-- null-ls.lua
        |-- nvim-tree.lua
        |-- todo.lua
        |-- tokyonight.lua
        |-- treesitter.lua
        `-- which-key.lua
```

The `init.lua` file loads my keymappings, variables, and plugins. Each plugin than has its own configuration file in the setup directory. No matter how small the configuration a plugin needs, I still want it in its own file so it's easier to find later and keeps are hard rule to make sure my plugin file doesn't get too long.

### Credits

[thanksforthecode.com](https:thanksforthecode.com)
