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
| LuaSnip                     | 5de556a3e970346debd43b686deab4ed1f9bf18a |
| alpha-nvim                  | 41283fb402713fc8b327e60907f74e46166f4cfd |
| bullets.vim                 | 448ad2a159c5f2540f6c9738f3bb9e6f15a41734 |
| cmp-nvim-lsp                | 39e2eda76828d88b773cc27a3f61d2ad782c922d |
| cmp-path                    | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp_luasnip                 | 05a9ab28b53f71d1aece421ef32fee2cb857a843 |
| dressing.nvim               | 6741f1062d3dc6e4755367a7e9b347b553623f04 |
| friendly-snippets           | 682157939e57bd6a2c86277dfd4d6fbfce63dbac |
| gitsigns.nvim               | 0595724fa9516a35696ff6b1e3cb95b6462b38b1 |
| indent-blankline.nvim       | 4288ce8128a52650e401dda42fd7651a6038f262 |
| lazy.nvim                   | 37c7163f8d27243993ac07db8477e44cd5275027 |
| lspkind.nvim                | 1735dd5a5054c1fb7feaf8e8658dbab925f4f0cf |
| lualine.nvim                | 0a5a66803c7407767b799067986b4dc3036e1983 |
| mason-lspconfig.nvim        | 37a336b653f8594df75c827ed589f1c91d91ff6c |
| mason-nvim-dap.nvim         | f5425eb1d0d794f0305d5eeebddabb74614683ff |
| mason.nvim                  | 0950b15060067f752fde13a779a994f59516ce3d |
| mini.comment                | b8bd7ea58912bd6fa6cf984f2f702a771ce24c1f |
| neodev.nvim                 | 02893eeb9d6e8503817bd52385e111cba9a90500 |
| noice.nvim                  | 03c6a75661e68012e30b0ed81f050358b1e2233c |
| none-ls.nvim                | e047015d33aa4dcae6b57120e4a84004b5775ad8 |
| nui.nvim                    | 61574ce6e60c815b0a0c4b5655b8486ba58089a1 |
| nvim-autopairs              | c15de7e7981f1111642e7e53799e1211d4606cb9 |
| nvim-cmp                    | a110e12d0b58eefcf5b771f533fc2cf3050680ac |
| nvim-dap                    | 6f79b822997f2e8a789c6034e147d42bc6706770 |
| nvim-dap-ui                 | b7267003ba4dd860350be86f75b9d9ea287cedca |
| nvim-dap-virtual-text       | d7c695ea39542f6da94ee4d66176f5d660ab0a77 |
| nvim-lspconfig              | 1d2454f9fbb34206897b9a1b5e8b87d6418941ba |
| nvim-surround               | ec2dc7671067e0086cdf29c2f5df2dd909d5f71f |
| nvim-treesitter             | 984604288d56265d7cfc443fa9dc9f67ec19d60d |
| nvim-treesitter-refactor    | 65ad2eca822dfaec2a3603119ec3cc8826a7859e |
| nvim-treesitter-textobjects | 34867c69838078df7d6919b130c0541c0b400c47 |
| nvim-web-devicons           | c0cfc1738361b5da1cd0a962dd6f774cc444f856 |
| one-small-step-for-vimkind  | e92abbce0b9b77fed1aaf6f122fb18b7045b15ec |
| persistence.nvim            | 95d03ad5450389ad7dc2a0fab14ebb3d46bc2c96 |
| playground                  | ba48c6a62a280eefb7c85725b0915e021a1a0749 |
| plenary.nvim                | a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683 |
| telescope-fzf-native.nvim   | 9ef21b2e6bb6ebeaf349a0781745549bbb870d27 |
| telescope.nvim              | 7bd2f9b72f8449780b79bcf351534e2cd36ec43a |
| todo-comments.nvim          | 51e10f838e84b4756c16311d0b1ef0972c6482d2 |
| tokyonight.nvim             | 30d7be361a7fbf187a881f17e574e9213d5108ea |
| trouble.nvim                | 88c3be40c061ce053ab326ce4fdcb973a1f785ff |
| which-key.nvim              | 0099511294f16b81c696004fa6a403b0ae61f7a0 |

<!--plugin end-->
