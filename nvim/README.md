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
| LuaSnip                     | 954c81b53989097faaff0fabc11c29575288c3e1 |
| alpha-nvim                  | 29074eeb869a6cbac9ce1fbbd04f5f5940311b32 |
| bullets.vim                 | 746f92ae05cdcc988857d8e76418326f07af9494 |
| cmp-nvim-lsp                | 5af77f54de1b16c34b23cba810150689a3a90312 |
| cmp-path                    | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp_luasnip                 | 05a9ab28b53f71d1aece421ef32fee2cb857a843 |
| copilot-cmp                 | 72fbaa03695779f8349be3ac54fa8bd77eed3ee3 |
| copilot.lua                 | 38a41d0d78f8823cc144c99784528b9a68bdd608 |
| dressing.nvim               | 8b7ae53d7f04f33be3439a441db8071c96092d19 |
| friendly-snippets           | 53d3df271d031c405255e99410628c26a8f0d2b0 |
| gitsigns.nvim               | 017c924e20e52096796fe8bb89b9718acb5a067c |
| indent-blankline.nvim       | 7206c77cb931f79885fc47f88ae18f99148392eb |
| lazy.nvim                   | 96584866b9c5e998cbae300594d0ccfd0c464627 |
| lspkind.nvim                | 57610d5ab560c073c465d6faf0c19f200cb67e6e |
| lualine.nvim                | 2248ef254d0a1488a72041cfb45ca9caada6d994 |
| mason-lspconfig.nvim        | 9453e3d6cd2ca45d96e20f343e8f1b927364b630 |
| mason-nvim-dap.nvim         | 5b4db7c0d6873436b42bcda0ba7cd4efa9206745 |
| mason.nvim                  | 41e75af1f578e55ba050c863587cffde3556ffa6 |
| mini.comment                | 3d9c8009615857e982f09bc5357fc95f2a2175f3 |
| neodev.nvim                 | c4ce017bd4bacf60bf59330cec9e93c5d5e104a6 |
| noice.nvim                  | 92433164e2f7118d4122c7674c3834d9511722ba |
| nui.nvim                    | c9b4de623d19a85b353ff70d2ae9c77143abe69c |
| null-ls.nvim                | 0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7 |
| nvim-autopairs              | 0f04d78619cce9a5af4f355968040f7d675854a1 |
| nvim-cmp                    | 41d7633e4146dce1072de32cea31ee31b056a131 |
| nvim-dap                    | bbe2c6f3438542a37cc2141a8e385f7dfe07d87d |
| nvim-dap-ui                 | 34160a7ce6072ef332f350ae1d4a6a501daf0159 |
| nvim-dap-virtual-text       | 57f1dbd0458dd84a286b27768c142e1567f3ce3b |
| nvim-lspconfig              | bd405e45c5fb122c16af8f87fa2dd7ab1981b243 |
| nvim-surround               | 703ec63aa798e5e07d309b35e42def34bebe0174 |
| nvim-treesitter             | b6b9ca448b7f236e2e60f8393a729902511f9db9 |
| nvim-treesitter-refactor    | 65ad2eca822dfaec2a3603119ec3cc8826a7859e |
| nvim-treesitter-textobjects | ec1c5bdb3d87ac971749fa6c7dbc2b14884f1f6a |
| nvim-web-devicons           | 8b2e5ef9eb8a717221bd96cb8422686d65a09ed5 |
| one-small-step-for-vimkind  | 94b06d81209627d0098c4c5a14714e42a792bf0b |
| persistence.nvim            | ad538bfd5336f1335cdb6fd4e0b0eebfa6e12f32 |
| playground                  | ba48c6a62a280eefb7c85725b0915e021a1a0749 |
| plenary.nvim                | 55d9fe89e33efd26f532ef20223e5f9430c8b0c0 |
| telescope-fzf-native.nvim   | 6c921ca12321edaa773e324ef64ea301a1d0da62 |
| telescope.nvim              | 6213322ab56eb27356fdc09a5078e41e3ea7f3bc |
| todo-comments.nvim          | 4a6737a8d70fe1ac55c64dfa47fcb189ca431872 |
| tokyonight.nvim             | f247ee700b569ed43f39320413a13ba9b0aef0db |
| trouble.nvim                | f1168feada93c0154ede4d1fe9183bf69bac54ea |
| which-key.nvim              | 4433e5ec9a507e5097571ed55c02ea9658fb268a |

<!--plugin end-->
