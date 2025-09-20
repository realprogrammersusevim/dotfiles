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
| blink.cmp                   | 327fff91fe6af358e990be7be1ec8b78037d2138 |
| bullets.vim                 | 1c13e510e11d08b0259e8e627f128359c5521962 |
| codecompanion.nvim          | 68464826515b764ebae5fdf28e4d3f8c01c80296 |
| conform.nvim                | b4aab989db276993ea5dcb78872be494ce546521 |
| copilot.lua                 | a5c390f8d8e85b501b22dcb2f30e0cbbd69d5ff0 |
| dressing.nvim               | 2d7c2db2507fa3c4956142ee607431ddb2828639 |
| friendly-snippets           | 572f5660cf05f8cd8834e096d7b4c921ba18e175 |
| gitsigns.nvim               | f780609807eca1f783a36a8a31c30a48fbe150c5 |
| lazy.nvim                   | 6c3bda4aca61a13a9c63f1c1d1b16b9d3be90d7a |
| lazydev.nvim                | 258d2a5ef4a3e3d6d9ba9da72c9725c53e9afcbd |
| lualine.nvim                | b8c23159c0161f4b89196f74ee3a6d02cdc3a955 |
| markview.nvim               | c095a7c7c6343863fb3046781e295103e3e081ab |
| mini.icons                  | f9a177c11daa7829389b7b6eaaec8b8a5c47052d |
| mini.pairs                  | 69864a2efb36c030877421634487fd90db1e4298 |
| nabla.nvim                  | 9b69b709063ccf40ac36fabb4fff7d90b3736475 |
| noice.nvim                  | 0427460c2d7f673ad60eb02b35f5e9926cf67c59 |
| nui.nvim                    | de740991c12411b663994b2860f1a4fd0937c130 |
| nvim-lspconfig              | 107c2458cdc780c4ed2c2b5e1b7800cd019010bd |
| nvim-surround               | a868c256c861044beb9794b4dd126480dcdfbdad |
| nvim-treesitter             | 42fc28ba918343ebfd5565147a42a26580579482 |
| nvim-treesitter-refactor    | d8b74fa87afc6a1e97b18da23e762efb032dc270 |
| nvim-treesitter-textobjects | 71385f191ec06ffc60e80e6b0c9a9d5daed4824c |
| nvim-web-devicons           | 6e51ca170563330e063720449c21f43e27ca0bc1 |
| oil.nvim                    | 07f80ad645895af849a597d1cac897059d89b686 |
| plenary.nvim                | b9fd5226c2f76c951fc8ed5923d85e4de065e509 |
| snacks.nvim                 | d67a47739dfc652cfcf66c59e929c704a854b37a |
| telescope-fzf-native.nvim   | 1f08ed60cafc8f6168b72b80be2b2ea149813e55 |
| telescope.nvim              | b4da76be54691e854d3e0e02c36b0245f945c2c7 |
| todo-comments.nvim          | 304a8d204ee787d2544d8bc23cd38d2f929e7cc5 |
| tokyonight.nvim             | 14fd5ff7f84027064724ec3157fe903199e77ded |
| trouble.nvim                | f176232e7759c4f8abd923c21e3e5a5c76cd6837 |
| typr                        | bdd9ef7143702851edd1dac85101e0a537056d2f |
| typst-preview.nvim          | 1603d37bb44ed2efa0b4378d1dfedc087b4f2141 |
| volt                        | 620de1321f275ec9d80028c68d1b88b409c0c8b1 |
| which-key.nvim              | 370ec46f710e058c9c1646273e6b225acf47cbed |

<!--plugin end-->
