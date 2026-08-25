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
| bullets.nvim                | cc162bfd3b49982e6707958dee399df4cb6ba0d3 |
| claudecode.nvim             | 2390c6e45c4789072c293ac69de051d169668b29 |
| conform.nvim                | 016802de402556da54c36bd7359b441266b01cdd |
| flash.nvim                  | 5f0f270fdc7c5b0c21d903ee85b9cb06f2ac636a |
| friendly-snippets           | 6cd7280adead7f586db6fccbd15d2cac7e2188b9 |
| gitsigns.nvim               | 5be654f2232c10ddcad19c1607a67b6b4b78fc29 |
| lazy.nvim                   | 306a05526ada86a7b30af95c5cc81ffba93fef97 |
| lazydev.nvim                | ff2cbcba459b637ec3fd165a2be59b7bbaeedf0d |
| lualine.nvim                | 221ce6b2d999187044529f49da6554a92f740a96 |
| mini.icons                  | 98faae31e9be1cc054ae63485e58ceb185efcad0 |
| mini.pairs                  | 4a014143fcb4e9df26198ccb3ecff3b9e77a048c |
| noice.nvim                  | 7bfd942445fb63089b59f97ca487d605e715f155 |
| nui.nvim                    | 10fc361835c856ba4233ef5ea135b919bf3dce97 |
| nvim-dap                    | 9e848e09a697ee95302a3ef2dd43fd6eb709e570 |
| nvim-dap-ui                 | cc9dd33aade7f20bae414d0cba163bc60d4d4b43 |
| nvim-lspconfig              | af9adce488c75ca0a81017945c2b7fa7b461bc23 |
| nvim-nio                    | edcc181a875301dd21840189aa2f2f9ad69fc172 |
| nvim-surround               | 2e93e154de9ff326def6480a4358bfc149d5da2c |
| nvim-treesitter             | 8b98b4470eb326f1c7b50dae79f8c963568e5720 |
| nvim-treesitter-textobjects | 898ee307df58f854d11cd7edd06472574d48014e |
| nvim-ufo                    | ab3eb124062422d276fae49e0dd63b3ad1062cfc |
| nvim-web-devicons           | 2ae6958df7ced50baac5035cec0c15799eedfbf7 |
| oil.nvim                    | b73018b75affd13fa38e2fc94ef753b465f770d7 |
| plenary.nvim                | 74b06c6c75e4eeb3108ec01852001636d85a932b |
| promise-async               | 119e8961014c9bfaf1487bf3c2a393d254f337e2 |
| render-markdown.nvim        | 4663eb3ecd538bd5062628fb6d95bbe6bdca78f6 |
| snacks.nvim                 | 882c996cf28183f4d63640de0b4c02ec886d01f2 |
| telescope-fzf-native.nvim   | b25b749b9db64d375d782094e2b9dce53ad53a40 |
| telescope.nvim              | 40aedd8a68c78a656a10a8d62d80c54af59420fb |
| todo-comments.nvim          | 31e3c38ce9b29781e4422fc0322eb0a21f4e8668 |
| tokyonight.nvim             | cdc07ac78467a233fd62c493de29a17e0cf2b2b6 |
| trouble.nvim                | bd67efe408d4816e25e8491cc5ad4088e708a69a |
| typst-preview.nvim          | 1c2e19486397be1c580b560fc50ee36abe329c46 |
| which-key.nvim              | 3aab2147e74890957785941f0c1ad87d0a44c15a |

<!--plugin end-->
