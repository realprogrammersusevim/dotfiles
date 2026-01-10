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

The `ftplugin` folder holds the configuration files for special file types.

## Plugins

<!--plugin start-->

| Plugin                      | Commit                                   |
| --------------------------- | ---------------------------------------- |
| blink.cmp                   | b19413d214068f316c78978b08264ed1c41830ec |
| bullets.vim                 | 89294b8930e660936374fb763ac48a1ac51dd29c |
| conform.nvim                | 8314f4c9e205e7f30b62147069729f9a1227d8bf |
| friendly-snippets           | 572f5660cf05f8cd8834e096d7b4c921ba18e175 |
| gitsigns.nvim               | 42d6aed4e94e0f0bbced16bbdcc42f57673bd75e |
| lazy.nvim                   | 306a05526ada86a7b30af95c5cc81ffba93fef97 |
| lazydev.nvim                | 5231c62aa83c2f8dc8e7ba957aa77098cda1257d |
| lualine.nvim                | 47f91c416daef12db467145e16bed5bbfe00add8 |
| mini.icons                  | efc85e42262cd0c9e1fdbf806c25cb0be6de115c |
| mini.pairs                  | d5a29b6254dad07757832db505ea5aeab9aad43a |
| noice.nvim                  | 7bfd942445fb63089b59f97ca487d605e715f155 |
| nui.nvim                    | de740991c12411b663994b2860f1a4fd0937c130 |
| nvim-lspconfig              | 92ee7d42320edfbb81f3cad851314ab197fa324a |
| nvim-surround               | 1098d7b3c34adcfa7feb3289ee434529abd4afd1 |
| nvim-treesitter             | 42fc28ba918343ebfd5565147a42a26580579482 |
| nvim-treesitter-refactor    | 9cc0d22becf72e18808208cd0ce85032a2b19c6f |
| nvim-treesitter-textobjects | 5ca4aaa6efdcc59be46b95a3e876300cfead05ef |
| nvim-ufo                    | 72d54c31079d38d8dfc5456131b1d0fb5c0264b0 |
| nvim-web-devicons           | 6788013bb9cb784e606ada44206b0e755e4323d7 |
| oil.nvim                    | 81b8a91735ad5cd24a6b3137f14a89f19176364f |
| plenary.nvim                | b9fd5226c2f76c951fc8ed5923d85e4de065e509 |
| promise-async               | 119e8961014c9bfaf1487bf3c2a393d254f337e2 |
| render-markdown.nvim        | 73a6ebc842cf81926eb1d424820b800f6f6a1227 |
| snacks.nvim                 | fe7cfe9800a182274d0f868a74b7263b8c0c020b |
| telescope-fzf-native.nvim   | 6fea601bd2b694c6f2ae08a6c6fab14930c60e2c |
| telescope.nvim              | 3333a52ff548ba0a68af6d8da1e54f9cd96e9179 |
| todo-comments.nvim          | 31e3c38ce9b29781e4422fc0322eb0a21f4e8668 |
| tokyonight.nvim             | 5da1b76e64daf4c5d410f06bcb6b9cb640da7dfd |
| trouble.nvim                | bd67efe408d4816e25e8491cc5ad4088e708a69a |
| typst-preview.nvim          | bf5d5eaf23bbfcca9f98a24ed29bd084abf89bf2 |
| which-key.nvim              | 3aab2147e74890957785941f0c1ad87d0a44c15a |

<!--plugin end-->
