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
| LuaSnip                     | 82108e7e31cc6fc223cc5df5cae6d89f70bb199f |
| alpha-nvim                  | 29074eeb869a6cbac9ce1fbbd04f5f5940311b32 |
| bullets.vim                 | 746f92ae05cdcc988857d8e76418326f07af9494 |
| cmp-nvim-lsp                | 5af77f54de1b16c34b23cba810150689a3a90312 |
| cmp-path                    | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp_luasnip                 | 05a9ab28b53f71d1aece421ef32fee2cb857a843 |
| copilot-cmp                 | 72fbaa03695779f8349be3ac54fa8bd77eed3ee3 |
| copilot.lua                 | b03617a6dc4bc88b65ab5deac1631da9a9c2dcaf |
| dressing.nvim               | 94b0d24483d56f3777ee0c8dc51675f21709318c |
| friendly-snippets           | 69a2c1675b66e002799f5eef803b87a12f593049 |
| gitsigns.nvim               | 3e6e91b09f0468c32d3b96dcacf4b947f037ce25 |
| indent-blankline.nvim       | 3c8a185da4b8ab7aef487219f5e001b11d4b6aaf |
| lazy.nvim                   | 96584866b9c5e998cbae300594d0ccfd0c464627 |
| lspkind.nvim                | 7f26cf5e27e2bd910ce0ea00c514da2bf97423b8 |
| lualine.nvim                | 566b7036f717f3d676362742630518a47f132fff |
| mason-lspconfig.nvim        | 0989bdf4fdf7b5aa4c74131d7ffccc3f399ac788 |
| mason-nvim-dap.nvim         | 3614a39aae98ccd34124b072939d6283853b3dd2 |
| mason.nvim                  | e110bc3be1a7309617cecd77bfe4bf86ba1b8134 |
| mini.comment                | 67f00d3ebbeae15e84584d971d0c32aad4f4f3a4 |
| neodev.nvim                 | be8d4d4cab6c13c6a572269c9d6a63774baba9a0 |
| noice.nvim                  | 92433164e2f7118d4122c7674c3834d9511722ba |
| none-ls.nvim                | fbdcbf8e152529af846b3a333f039751829b84c2 |
| nui.nvim                    | 35da9ca1de0fc4dda96c2e214d93d363c145f418 |
| nvim-autopairs              | 9fd41181693dd4106b3e414a822bb6569924de81 |
| nvim-cmp                    | 538e37ba87284942c1d76ed38dd497e54e65b891 |
| nvim-dap                    | aad46274f09ba29933e4cef2257cdda5ec19cf7a |
| nvim-dap-ui                 | 7e5e16427aaf814dc2d58e1b219def9ef2fa2435 |
| nvim-dap-virtual-text       | d4542ac257d3c7ee4131350db6179ae6340ce40b |
| nvim-lspconfig              | 796394fd19fb878e8dbc4fd1e9c9c186ed07a5f4 |
| nvim-surround               | 703ec63aa798e5e07d309b35e42def34bebe0174 |
| nvim-treesitter             | 8cd2b230174efbf7b5d9f49fe2f90bda6b5eb16e |
| nvim-treesitter-refactor    | 65ad2eca822dfaec2a3603119ec3cc8826a7859e |
| nvim-treesitter-textobjects | 85b9d0cbd4ff901abcda862b50dbb34e0901848b |
| nvim-web-devicons           | db0c864375c198cacc171ff373e76bfce2a85045 |
| one-small-step-for-vimkind  | aaee281bdaa3141d9d0cdb3dec468532da61124f |
| persistence.nvim            | ad538bfd5336f1335cdb6fd4e0b0eebfa6e12f32 |
| playground                  | ba48c6a62a280eefb7c85725b0915e021a1a0749 |
| plenary.nvim                | 55d9fe89e33efd26f532ef20223e5f9430c8b0c0 |
| telescope-fzf-native.nvim   | 6c921ca12321edaa773e324ef64ea301a1d0da62 |
| telescope.nvim              | 4367e05c06d19f28c514e1498bcd9410f4bc65b2 |
| todo-comments.nvim          | 4a6737a8d70fe1ac55c64dfa47fcb189ca431872 |
| tokyonight.nvim             | f247ee700b569ed43f39320413a13ba9b0aef0db |
| trouble.nvim                | f1168feada93c0154ede4d1fe9183bf69bac54ea |
| which-key.nvim              | 4433e5ec9a507e5097571ed55c02ea9658fb268a |

<!--plugin end-->
