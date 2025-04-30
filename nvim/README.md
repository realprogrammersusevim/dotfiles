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
| blink-cmp-copilot           | 439cff78780c033aa23cf061d7315314b347e3c1 |
| blink.cmp                   | cb5e346d9e0efa7a3eee7fd4da0b690c48d2a98e |
| bullets.vim                 | 8f3259e807c40b91d247f612823295ab99777a65 |
| codecompanion.nvim          | 68464826515b764ebae5fdf28e4d3f8c01c80296 |
| copilot.lua                 | a5c390f8d8e85b501b22dcb2f30e0cbbd69d5ff0 |
| dressing.nvim               | 2d7c2db2507fa3c4956142ee607431ddb2828639 |
| friendly-snippets           | 572f5660cf05f8cd8834e096d7b4c921ba18e175 |
| gitsigns.nvim               | fd50977fce4d5240b910d2b816e71fb726cbbaf7 |
| lazy.nvim                   | 6c3bda4aca61a13a9c63f1c1d1b16b9d3be90d7a |
| lazydev.nvim                | 2367a6c0a01eb9edb0464731cc0fb61ed9ab9d2c |
| lualine.nvim                | 15884cee63a8c205334ab13ab1c891cd4d27101a |
| markview.nvim               | c095a7c7c6343863fb3046781e295103e3e081ab |
| mason-lspconfig.nvim        | 1a31f824b9cd5bc6f342fc29e9a53b60d74af245 |
| mason.nvim                  | fc98833b6da5de5a9c5b1446ac541577059555be |
| mini.comment                | fb867a9246f9b892cf51a8c84a3f8479cdf1558c |
| mini.pairs                  | 7e834c5937d95364cc1740e20d673afe2d034cdb |
| nabla.nvim                  | 9b69b709063ccf40ac36fabb4fff7d90b3736475 |
| noice.nvim                  | 0427460c2d7f673ad60eb02b35f5e9926cf67c59 |
| none-ls.nvim                | b3dfc91b58f24b5496c46217101179e55a32364a |
| nui.nvim                    | 8d5b0b568517935d3c84f257f272ef004d9f5a59 |
| nvim-lspconfig              | 37cc31c64d657feff6f752a1bf15f584d4734eca |
| nvim-surround               | 0e62500b98f4513feaaf7425c135472457ea5b7d |
| nvim-treesitter             | 3b308861a8d7d7bfbe9be51d52e54dcfd9fe3d38 |
| nvim-treesitter-refactor    | d8b74fa87afc6a1e97b18da23e762efb032dc270 |
| nvim-treesitter-textobjects | ed373482db797bbf71bdff37a15c7555a84dce47 |
| nvim-web-devicons           | 50b5b06bff13a9b4eab946de7c7033649a6618a1 |
| plenary.nvim                | 857c5ac632080dba10aae49dba902ce3abf91b35 |
| snacks.nvim                 | bc0630e43be5699bb94dadc302c0d21615421d93 |
| telescope-fzf-native.nvim   | 1f08ed60cafc8f6168b72b80be2b2ea149813e55 |
| telescope.nvim              | a4ed82509cecc56df1c7138920a1aeaf246c0ac5 |
| todo-comments.nvim          | 304a8d204ee787d2544d8bc23cd38d2f929e7cc5 |
| tokyonight.nvim             | 057ef5d260c1931f1dffd0f052c685dcd14100a3 |
| trouble.nvim                | 85bedb7eb7fa331a2ccbecb9202d8abba64d37b3 |
| typst-preview.nvim          | dea4525d5420b7c32eebda7de15a6beb9d6574fa |
| which-key.nvim              | 370ec46f710e058c9c1646273e6b225acf47cbed |

<!--plugin end-->
