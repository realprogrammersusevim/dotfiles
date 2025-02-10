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
| blink.cmp                   | b6f11a0aa33e601c469a126e3ed6e35208fe3ea3 |
| bullets.vim                 | 2253f970e54320dbd76fd6bb4f5a0bf2436ce232 |
| codecompanion.nvim          | 68464826515b764ebae5fdf28e4d3f8c01c80296 |
| copilot.lua                 | f8d8d872bb319f640d5177dad5fbf01f7a16d7d0 |
| dressing.nvim               | 56ef6a969a4990d938c5fed40c370f65e125fc97 |
| friendly-snippets           | efff286dd74c22f731cdec26a70b46e5b203c619 |
| gitsigns.nvim               | 4baa13519c2168cc9a7890a3580c50226ed018fb |
| lazy.nvim                   | f15a93907ddad3d9139aea465ae18336d87f5ce6 |
| lazydev.nvim                | a1b78b2ac6f978c72e76ea90ae92a94edf380cfc |
| lualine.nvim                | f4f791f67e70d378a754d02da068231d2352e5bc |
| markview.nvim               | c095a7c7c6343863fb3046781e295103e3e081ab |
| mason-lspconfig.nvim        | f75e877f5266e87523eb5a18fcde2081820d087b |
| mason.nvim                  | e2f7f9044ec30067bc11800a9e266664b88cda22 |
| mini.comment                | 5bd72d50d36f4c0fd531adc409715a75a2c984da |
| nabla.nvim                  | 27a6ea9ed7452bb9e0b19eb0942b5bcf7d051b2f |
| noice.nvim                  | dbfc5fbab19ff1c3e29a3268ffa5eda4c09c72ce |
| none-ls.nvim                | aa1620be06f7a5158864a33be045229da67ff840 |
| nui.nvim                    | 53e907ffe5eedebdca1cd503b00aa8692068ca46 |
| nvim-autopairs              | 3d02855468f94bf435db41b661b58ec4f48a06b7 |
| nvim-lspconfig              | d37812c49063eda10ad1f7c7695509365ac7bd47 |
| nvim-surround               | ae298105122c87bbe0a36b1ad20b06d417c0433e |
| nvim-treesitter             | da89532f036da9855f3105955696df36f583b919 |
| nvim-treesitter-refactor    | d8b74fa87afc6a1e97b18da23e762efb032dc270 |
| nvim-treesitter-textobjects | ad8f0a472148c3e0ae9851e26a722ee4e29b1595 |
| nvim-web-devicons           | 402377242b04be3f4f0f3720bd952df86e946c30 |
| plenary.nvim                | 3707cdb1e43f5cea73afb6037e6494e7ce847a66 |
| rainbow-delimiters.nvim     | a25248a9e5cbfa117043f6740b10248dd596b576 |
| snacks.nvim                 | 2f2f4c95afc280058f99ed9eb211a70a6a3e9edb |
| telescope-fzf-native.nvim   | dae2eac9d91464448b584c7949a31df8faefec56 |
| telescope.nvim              | 415af52339215926d705cccc08145f3782c4d132 |
| todo-comments.nvim          | 304a8d204ee787d2544d8bc23cd38d2f929e7cc5 |
| tokyonight.nvim             | dca4adba7dc5f09302a00b0e76078d54d82d2658 |
| trouble.nvim                | 6f380b8826fb819c752c8fd7daaee9ef96d4c689 |
| twilight.nvim               | 1584c0b0a979b71fd86b18d302ba84e9aba85b1b |
| which-key.nvim              | 0e76a87ac51772569aec678dc74baa8e2a86100c |

<!--plugin end-->
