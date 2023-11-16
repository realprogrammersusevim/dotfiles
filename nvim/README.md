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
| Comment.nvim                | 0236521ea582747b58869cb72f70ccfa967d2e89 |
| LuaSnip                     | 1f4ad8bb72bdeb60975e98652636b991a9b7475d |
| alpha-nvim                  | 234822140b265ec4ba3203e3e0be0e0bb826dff5 |
| bullets.vim                 | 746f92ae05cdcc988857d8e76418326f07af9494 |
| cmp-nvim-lsp                | 44b16d11215dce86f253ce0c30949813c0a90765 |
| cmp-path                    | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp_luasnip                 | 05a9ab28b53f71d1aece421ef32fee2cb857a843 |
| dressing.nvim               | fe3071330a0720ce3695ac915820c8134b22d1b0 |
| friendly-snippets           | 43727c2ff84240e55d4069ec3e6158d74cb534b6 |
| gitsigns.nvim               | 37d26d718f8120a8c5c107c580c8c98cf89fdf1f |
| indent-blankline.nvim       | 29be0919b91fb59eca9e90690d76014233392bef |
| lazy.nvim                   | 96584866b9c5e998cbae300594d0ccfd0c464627 |
| lspkind.nvim                | 57610d5ab560c073c465d6faf0c19f200cb67e6e |
| lualine.nvim                | 2248ef254d0a1488a72041cfb45ca9caada6d994 |
| mason-lspconfig.nvim        | faeb361507aa1ef1b0e5645781e2aa0d36a4aa84 |
| mason-nvim-dap.nvim         | f0cd12f7a8a310c58cecebddb6b219ffad1cfd0f |
| mason.nvim                  | 41e75af1f578e55ba050c863587cffde3556ffa6 |
| neodev.nvim                 | b2881eeb395d2b268de5fe9b5e201a8f1816beb8 |
| noice.nvim                  | 92433164e2f7118d4122c7674c3834d9511722ba |
| nui.nvim                    | c0c8e347ceac53030f5c1ece1c5a5b6a17a25b32 |
| null-ls.nvim                | 0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7 |
| nvim-autopairs              | 0f04d78619cce9a5af4f355968040f7d675854a1 |
| nvim-cmp                    | 0b751f6beef40fd47375eaf53d3057e0bfa317e4 |
| nvim-dap                    | 9d81c11fd185a131f81841e64941859305f6c42d |
| nvim-dap-ui                 | 34160a7ce6072ef332f350ae1d4a6a501daf0159 |
| nvim-dap-virtual-text       | 57f1dbd0458dd84a286b27768c142e1567f3ce3b |
| nvim-lspconfig              | d5d7412ff267b92a11a94e6559d5507c43670a52 |
| nvim-surround               | 18016d6af52edc9f1c794dcf6665a26a2962d2ee |
| nvim-treesitter             | 73287b794d428843f20f9ae004bef2ce67ab3dbc |
| nvim-treesitter-refactor    | 65ad2eca822dfaec2a3603119ec3cc8826a7859e |
| nvim-treesitter-textobjects | dbcd9388e3b119a87c785e10a00d62876077d23d |
| nvim-web-devicons           | 3523d6e6d40ab11fd66c1b2732b3d6b60affa951 |
| one-small-step-for-vimkind  | 94b06d81209627d0098c4c5a14714e42a792bf0b |
| persistence.nvim            | ad538bfd5336f1335cdb6fd4e0b0eebfa6e12f32 |
| playground                  | ba48c6a62a280eefb7c85725b0915e021a1a0749 |
| plenary.nvim                | 50012918b2fc8357b87cff2a7f7f0446e47da174 |
| telescope-fzf-native.nvim   | 6c921ca12321edaa773e324ef64ea301a1d0da62 |
| telescope.nvim              | 18774ec7929c8a8003a91e9e1f69f6c32258bbfe |
| todo-comments.nvim          | 4a6737a8d70fe1ac55c64dfa47fcb189ca431872 |
| tokyonight.nvim             | f247ee700b569ed43f39320413a13ba9b0aef0db |
| trouble.nvim                | f1168feada93c0154ede4d1fe9183bf69bac54ea |
| which-key.nvim              | 4433e5ec9a507e5097571ed55c02ea9658fb268a |

<!--plugin end-->
