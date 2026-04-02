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
| blink.cmp                   | 451168851e8e2466bc97ee3e026c3dcb9141ce07 |
| bullets.vim                 | 89294b8930e660936374fb763ac48a1ac51dd29c |
| claudecode.nvim             | 432121f0f5b9bda041030d1e9e83b7ba3a93dd8f |
| conform.nvim                | 086a40dc7ed8242c03be9f47fbcee68699cc2395 |
| friendly-snippets           | 6cd7280adead7f586db6fccbd15d2cac7e2188b9 |
| gitsigns.nvim               | e1b90b60fb7aa9c0ada8e983b460764b35a05e2e |
| lazy.nvim                   | 306a05526ada86a7b30af95c5cc81ffba93fef97 |
| lazydev.nvim                | ff2cbcba459b637ec3fd165a2be59b7bbaeedf0d |
| lualine.nvim                | 47f91c416daef12db467145e16bed5bbfe00add8 |
| mini.icons                  | 5b9076dae1bfbe47ba4a14bc8b967cde0ab5d77e |
| mini.pairs                  | d5a29b6254dad07757832db505ea5aeab9aad43a |
| noice.nvim                  | 7bfd942445fb63089b59f97ca487d605e715f155 |
| nui.nvim                    | de740991c12411b663994b2860f1a4fd0937c130 |
| nvim-lspconfig              | 8e2084bf5e40c79c1f42210a6ef96a0a4793a763 |
| nvim-surround               | 61319d4bd1c5e336e197defa15bd104c51f0fb29 |
| nvim-treesitter             | 6878ae017d691a0df1c49d8a091c88a33e4c2d50 |
| nvim-treesitter-refactor    | 9cc0d22becf72e18808208cd0ce85032a2b19c6f |
| nvim-treesitter-textobjects | 93d60a475f0b08a8eceb99255863977d3a25f310 |
| nvim-ufo                    | ab3eb124062422d276fae49e0dd63b3ad1062cfc |
| nvim-web-devicons           | d7462543c9e366c0d196c7f67a945eaaf5d99414 |
| oil.nvim                    | 0fcc83805ad11cf714a949c98c605ed717e0b83e |
| plenary.nvim                | b9fd5226c2f76c951fc8ed5923d85e4de065e509 |
| promise-async               | 119e8961014c9bfaf1487bf3c2a393d254f337e2 |
| render-markdown.nvim        | c7188a8f9d2953696b6303caccbf39c51fa2c1b1 |
| snacks.nvim                 | ad9ede6a9cddf16cedbd31b8932d6dcdee9b716e |
| telescope-fzf-native.nvim   | 6fea601bd2b694c6f2ae08a6c6fab14930c60e2c |
| telescope.nvim              | cfb85dcf7f822b79224e9e6aef9e8c794211b20b |
| todo-comments.nvim          | 31e3c38ce9b29781e4422fc0322eb0a21f4e8668 |
| tokyonight.nvim             | cdc07ac78467a233fd62c493de29a17e0cf2b2b6 |
| trouble.nvim                | bd67efe408d4816e25e8491cc5ad4088e708a69a |
| typst-preview.nvim          | 87db18b8d19c8b0eed399f52e4c527ce5afe4817 |
| which-key.nvim              | 3aab2147e74890957785941f0c1ad87d0a44c15a |

<!--plugin end-->
