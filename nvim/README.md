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
| blink.cmp                   | 586ee87534f5bf65f1c8dea2d1da2a57e8cddd36 |
| bullets.vim                 | 1c13e510e11d08b0259e8e627f128359c5521962 |
| codecompanion.nvim          | 68464826515b764ebae5fdf28e4d3f8c01c80296 |
| conform.nvim                | 973f3cb73887d510321653044791d7937c7ec0fa |
| copilot.lua                 | a5c390f8d8e85b501b22dcb2f30e0cbbd69d5ff0 |
| dressing.nvim               | 2d7c2db2507fa3c4956142ee607431ddb2828639 |
| friendly-snippets           | 572f5660cf05f8cd8834e096d7b4c921ba18e175 |
| gitsigns.nvim               | 1fcaddcc427ff5802b6602f46de37a5352d0f9e0 |
| lazy.nvim                   | 6c3bda4aca61a13a9c63f1c1d1b16b9d3be90d7a |
| lazydev.nvim                | 2367a6c0a01eb9edb0464731cc0fb61ed9ab9d2c |
| lualine.nvim                | a94fc68960665e54408fe37dcf573193c4ce82c9 |
| markview.nvim               | c095a7c7c6343863fb3046781e295103e3e081ab |
| mini.comment                | 871746069a28e35d04a66f88bc0e6831779ccc40 |
| mini.pairs                  | 69864a2efb36c030877421634487fd90db1e4298 |
| mini.snippets               | a04d1b2fc0047b8e613a31dbc4a5760778003dcd |
| nabla.nvim                  | 9b69b709063ccf40ac36fabb4fff7d90b3736475 |
| noice.nvim                  | 0427460c2d7f673ad60eb02b35f5e9926cf67c59 |
| nui.nvim                    | de740991c12411b663994b2860f1a4fd0937c130 |
| nvim-lspconfig              | f47cd681d7cb6048876a2e908b6d8ba1e530d152 |
| nvim-surround               | 8dd9150ca7eae5683660ea20cec86edcd5ca4046 |
| nvim-treesitter             | 42fc28ba918343ebfd5565147a42a26580579482 |
| nvim-treesitter-refactor    | d8b74fa87afc6a1e97b18da23e762efb032dc270 |
| nvim-treesitter-textobjects | 89ebe73cd2836db80a22d9748999ace0241917a5 |
| nvim-web-devicons           | 0422a19d9aa3aad2c7e5cca167e5407b13407a9d |
| plenary.nvim                | 857c5ac632080dba10aae49dba902ce3abf91b35 |
| snacks.nvim                 | bc0630e43be5699bb94dadc302c0d21615421d93 |
| telescope-fzf-native.nvim   | 1f08ed60cafc8f6168b72b80be2b2ea149813e55 |
| telescope.nvim              | b4da76be54691e854d3e0e02c36b0245f945c2c7 |
| todo-comments.nvim          | 304a8d204ee787d2544d8bc23cd38d2f929e7cc5 |
| tokyonight.nvim             | 057ef5d260c1931f1dffd0f052c685dcd14100a3 |
| trouble.nvim                | 85bedb7eb7fa331a2ccbecb9202d8abba64d37b3 |
| typst-preview.nvim          | dea4525d5420b7c32eebda7de15a6beb9d6574fa |
| which-key.nvim              | 370ec46f710e058c9c1646273e6b225acf47cbed |

<!--plugin end-->
