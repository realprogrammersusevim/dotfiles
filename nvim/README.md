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
| blink.cmp                   | 4b18c32adef2898f95cdef6192cbd5796c1a332d |
| bullets.vim                 | 89294b8930e660936374fb763ac48a1ac51dd29c |
| claudecode.nvim             | 432121f0f5b9bda041030d1e9e83b7ba3a93dd8f |
| conform.nvim                | c2526f1cde528a66e086ab1668e996d162c75f4f |
| friendly-snippets           | 6cd7280adead7f586db6fccbd15d2cac7e2188b9 |
| gitsigns.nvim               | 9f3c6dd7868bcc116e9c1c1929ce063b978fa519 |
| lazy.nvim                   | 306a05526ada86a7b30af95c5cc81ffba93fef97 |
| lazydev.nvim                | 5231c62aa83c2f8dc8e7ba957aa77098cda1257d |
| lualine.nvim                | 47f91c416daef12db467145e16bed5bbfe00add8 |
| mini.icons                  | 68c178e0958d95b3977a771f3445429b1bded985 |
| mini.pairs                  | d5a29b6254dad07757832db505ea5aeab9aad43a |
| noice.nvim                  | 7bfd942445fb63089b59f97ca487d605e715f155 |
| nui.nvim                    | de740991c12411b663994b2860f1a4fd0937c130 |
| nvim-lspconfig              | 44acfe887d4056f704ccc4f17513ed41c9e2b2e6 |
| nvim-surround               | 1098d7b3c34adcfa7feb3289ee434529abd4afd1 |
| nvim-treesitter             | 42fc28ba918343ebfd5565147a42a26580579482 |
| nvim-treesitter-refactor    | 9cc0d22becf72e18808208cd0ce85032a2b19c6f |
| nvim-treesitter-textobjects | 5ca4aaa6efdcc59be46b95a3e876300cfead05ef |
| nvim-ufo                    | ab3eb124062422d276fae49e0dd63b3ad1062cfc |
| nvim-web-devicons           | 746ffbb17975ebd6c40142362eee1b0249969c5c |
| oil.nvim                    | f55b25e493a7df76371cfadd0ded5004cb9cd48a |
| plenary.nvim                | b9fd5226c2f76c951fc8ed5923d85e4de065e509 |
| promise-async               | 119e8961014c9bfaf1487bf3c2a393d254f337e2 |
| render-markdown.nvim        | 48b4175dbca8439d30c1f52231cbe5a712c8f9d9 |
| snacks.nvim                 | fe7cfe9800a182274d0f868a74b7263b8c0c020b |
| telescope-fzf-native.nvim   | 6fea601bd2b694c6f2ae08a6c6fab14930c60e2c |
| telescope.nvim              | 5255aa27c422de944791318024167ad5d40aad20 |
| todo-comments.nvim          | 31e3c38ce9b29781e4422fc0322eb0a21f4e8668 |
| tokyonight.nvim             | 5da1b76e64daf4c5d410f06bcb6b9cb640da7dfd |
| trouble.nvim                | bd67efe408d4816e25e8491cc5ad4088e708a69a |
| typst-preview.nvim          | bf5d5eaf23bbfcca9f98a24ed29bd084abf89bf2 |
| which-key.nvim              | 3aab2147e74890957785941f0c1ad87d0a44c15a |

<!--plugin end-->
