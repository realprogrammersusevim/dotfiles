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
| bullets.vim                 | 1c13e510e11d08b0259e8e627f128359c5521962 |
| conform.nvim                | 4993e07fac6679d0a5005aa7499e0bad2bd39f19 |
| friendly-snippets           | 572f5660cf05f8cd8834e096d7b4c921ba18e175 |
| gitsigns.nvim               | 5813e4878748805f1518cee7abb50fd7205a3a48 |
| lazy.nvim                   | 85c7ff3711b730b4030d03144f6db6375044ae82 |
| lazydev.nvim                | 5231c62aa83c2f8dc8e7ba957aa77098cda1257d |
| lualine.nvim                | 47f91c416daef12db467145e16bed5bbfe00add8 |
| mini.icons                  | ff2e4f1d29f659cc2bad0f9256f2f6195c6b2428 |
| mini.pairs                  | 69864a2efb36c030877421634487fd90db1e4298 |
| noice.nvim                  | 7bfd942445fb63089b59f97ca487d605e715f155 |
| nui.nvim                    | de740991c12411b663994b2860f1a4fd0937c130 |
| nvim-lspconfig              | effe4bf2e1afb881ea67291c648b68dd3dfc927a |
| nvim-surround               | fcfa7e02323d57bfacc3a141f8a74498e1522064 |
| nvim-treesitter             | 42fc28ba918343ebfd5565147a42a26580579482 |
| nvim-treesitter-refactor    | 9cc0d22becf72e18808208cd0ce85032a2b19c6f |
| nvim-treesitter-textobjects | 5ca4aaa6efdcc59be46b95a3e876300cfead05ef |
| nvim-web-devicons           | 8dcb311b0c92d460fac00eac706abd43d94d68af |
| oil.nvim                    | cbcb3f997f6f261c577b943ec94e4ef55108dd95 |
| plenary.nvim                | b9fd5226c2f76c951fc8ed5923d85e4de065e509 |
| render-markdown.nvim        | 6e0e8902dac70fecbdd8ce557d142062a621ec38 |
| snacks.nvim                 | fe7cfe9800a182274d0f868a74b7263b8c0c020b |
| telescope-fzf-native.nvim   | 6fea601bd2b694c6f2ae08a6c6fab14930c60e2c |
| telescope.nvim              | e69b434b968a33815e2f02a5c7bd7b8dd4c7d4b2 |
| todo-comments.nvim          | 31e3c38ce9b29781e4422fc0322eb0a21f4e8668 |
| tokyonight.nvim             | 5da1b76e64daf4c5d410f06bcb6b9cb640da7dfd |
| trouble.nvim                | bd67efe408d4816e25e8491cc5ad4088e708a69a |
| typst-preview.nvim          | 291972a39db85c5d2e76249748aba4206dfd3bc2 |
| which-key.nvim              | 3aab2147e74890957785941f0c1ad87d0a44c15a |

<!--plugin end-->
