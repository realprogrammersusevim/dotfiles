# Neovim configuration

My handcrafted Neovim configuration written purely in Lua.

## Layout

The scheme of my Neovim configuration is rather simple once you understand it.
The `init.lua` file is the main configuration file. It bootstraps my plugin
manager lazy.nvim and then loads the other modules. `keymaps.lua` contains
keymaps for the editor. The plugins folder is the largest and most important
since it contains all the plugins and configuration for each of them that I use.
All my plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim)
and are grouped in separate files.

The `utils` folder has the configuration files for my Lua linters. I copied them
from the Neovim repository.

The `ftplugin` folder holds the configuration files for special file types.

## Plugins

<!--plugin start-->

| Plugin                      | Commit                                   |
| --------------------------- | ---------------------------------------- |
| blink.cmp                   | bae4bae0eedd1fa55f34b685862e94a222d5c6f8 |
| bullets.vim                 | 1c13e510e11d08b0259e8e627f128359c5521962 |
| codecompanion.nvim          | 68464826515b764ebae5fdf28e4d3f8c01c80296 |
| conform.nvim                | b4aab989db276993ea5dcb78872be494ce546521 |
| copilot.lua                 | a5c390f8d8e85b501b22dcb2f30e0cbbd69d5ff0 |
| dressing.nvim               | 2d7c2db2507fa3c4956142ee607431ddb2828639 |
| friendly-snippets           | 572f5660cf05f8cd8834e096d7b4c921ba18e175 |
| gitsigns.nvim               | f780609807eca1f783a36a8a31c30a48fbe150c5 |
| lazy.nvim                   | 6c3bda4aca61a13a9c63f1c1d1b16b9d3be90d7a |
| lazydev.nvim                | 2367a6c0a01eb9edb0464731cc0fb61ed9ab9d2c |
| lualine.nvim                | b8c23159c0161f4b89196f74ee3a6d02cdc3a955 |
| markview.nvim               | c095a7c7c6343863fb3046781e295103e3e081ab |
| mini.comment                | a9474da9175b27a5c32ee712433c23b9b0f7f139 |
| mini.pairs                  | 69864a2efb36c030877421634487fd90db1e4298 |
| nabla.nvim                  | 9b69b709063ccf40ac36fabb4fff7d90b3736475 |
| noice.nvim                  | 0427460c2d7f673ad60eb02b35f5e9926cf67c59 |
| nui.nvim                    | de740991c12411b663994b2860f1a4fd0937c130 |
| nvim-lspconfig              | d89f4891f0720cd2598e4bdd60010d8784b2ac8a |
| nvim-surround               | a868c256c861044beb9794b4dd126480dcdfbdad |
| nvim-treesitter             | 42fc28ba918343ebfd5565147a42a26580579482 |
| nvim-treesitter-refactor    | d8b74fa87afc6a1e97b18da23e762efb032dc270 |
| nvim-treesitter-textobjects | 71385f191ec06ffc60e80e6b0c9a9d5daed4824c |
| nvim-web-devicons           | 6e51ca170563330e063720449c21f43e27ca0bc1 |
| plenary.nvim                | b9fd5226c2f76c951fc8ed5923d85e4de065e509 |
| snacks.nvim                 | bc0630e43be5699bb94dadc302c0d21615421d93 |
| telescope-fzf-native.nvim   | 1f08ed60cafc8f6168b72b80be2b2ea149813e55 |
| telescope.nvim              | b4da76be54691e854d3e0e02c36b0245f945c2c7 |
| todo-comments.nvim          | 304a8d204ee787d2544d8bc23cd38d2f929e7cc5 |
| tokyonight.nvim             | 057ef5d260c1931f1dffd0f052c685dcd14100a3 |
| trouble.nvim                | 85bedb7eb7fa331a2ccbecb9202d8abba64d37b3 |
| typr                        | bdd9ef7143702851edd1dac85101e0a537056d2f |
| typst-preview.nvim          | 1603d37bb44ed2efa0b4378d1dfedc087b4f2141 |
| volt                        | 7b8c5e790120d9f08c8487dcb80692db6d2087a1 |
| which-key.nvim              | 370ec46f710e058c9c1646273e6b225acf47cbed |

<!--plugin end-->
