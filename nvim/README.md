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
| blink.cmp                   | 78336bc89ee5365633bcf754d93df01678b5c08f |
| bullets.vim                 | 28c22791153a90bb61a86fbeeae0f812e048ade7 |
| claudecode.nvim             | 102d835c964069c9c5e37abaf05ae4f9c3ee6f00 |
| conform.nvim                | dca1a190aa85f9065979ef35802fb77131911106 |
| flash.nvim                  | fcea7ff883235d9024dc41e638f164a450c14ca2 |
| friendly-snippets           | 6cd7280adead7f586db6fccbd15d2cac7e2188b9 |
| gitsigns.nvim               | 6d808f99bd63303646794406e270bd553ad7792e |
| lazy.nvim                   | 306a05526ada86a7b30af95c5cc81ffba93fef97 |
| lazydev.nvim                | ff2cbcba459b637ec3fd165a2be59b7bbaeedf0d |
| lualine.nvim                | 131a558e13f9f28b15cd235557150ccb23f89286 |
| mini.icons                  | bac6317300e205335df425296570d84322730067 |
| mini.pairs                  | d5a29b6254dad07757832db505ea5aeab9aad43a |
| noice.nvim                  | 7bfd942445fb63089b59f97ca487d605e715f155 |
| nui.nvim                    | de740991c12411b663994b2860f1a4fd0937c130 |
| nvim-dap                    | 45a69eba683a2c448dd9ecfc4de89511f0646b5f |
| nvim-dap-ui                 | 1a66cabaa4a4da0be107d5eda6d57242f0fe7e49 |
| nvim-lspconfig              | bf5abe69c1874531f359a822d0cff4d73e26113f |
| nvim-nio                    | 21f5324bfac14e22ba26553caf69ec76ae8a7662 |
| nvim-surround               | 61319d4bd1c5e336e197defa15bd104c51f0fb29 |
| nvim-treesitter             | 4916d6592ede8c07973490d9322f187e07dfefac |
| nvim-treesitter-textobjects | 851e865342e5a4cb1ae23d31caf6e991e1c99f1e |
| nvim-ufo                    | ab3eb124062422d276fae49e0dd63b3ad1062cfc |
| nvim-web-devicons           | 4fc505ac7bd7692824a142e96e5f529c133862f8 |
| oil.nvim                    | 0fcc83805ad11cf714a949c98c605ed717e0b83e |
| plenary.nvim                | 74b06c6c75e4eeb3108ec01852001636d85a932b |
| promise-async               | 119e8961014c9bfaf1487bf3c2a393d254f337e2 |
| render-markdown.nvim        | 3f3eea97b80839f629c951ca660ffd125bfa5b34 |
| snacks.nvim                 | ad9ede6a9cddf16cedbd31b8932d6dcdee9b716e |
| telescope-fzf-native.nvim   | 6fea601bd2b694c6f2ae08a6c6fab14930c60e2c |
| telescope.nvim              | 506338434fec5ad19cb1f8d45bf92d66c4917393 |
| todo-comments.nvim          | 31e3c38ce9b29781e4422fc0322eb0a21f4e8668 |
| tokyonight.nvim             | cdc07ac78467a233fd62c493de29a17e0cf2b2b6 |
| trouble.nvim                | bd67efe408d4816e25e8491cc5ad4088e708a69a |
| typst-preview.nvim          | 87db18b8d19c8b0eed399f52e4c527ce5afe4817 |
| which-key.nvim              | 3aab2147e74890957785941f0c1ad87d0a44c15a |

<!--plugin end-->
