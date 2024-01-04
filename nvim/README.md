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
| LuaSnip                     | 8ae1dedd988eb56441b7858bd1e8554dfadaa46d |
| alpha-nvim                  | 29074eeb869a6cbac9ce1fbbd04f5f5940311b32 |
| bullets.vim                 | 746f92ae05cdcc988857d8e76418326f07af9494 |
| cmp-nvim-lsp                | 5af77f54de1b16c34b23cba810150689a3a90312 |
| cmp-path                    | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp_luasnip                 | 05a9ab28b53f71d1aece421ef32fee2cb857a843 |
| copilot-cmp                 | 72fbaa03695779f8349be3ac54fa8bd77eed3ee3 |
| copilot.lua                 | 858bbfa6fa81c88fb1f64107d7981f1658619e0a |
| dressing.nvim               | 94b0d24483d56f3777ee0c8dc51675f21709318c |
| friendly-snippets           | 53d3df271d031c405255e99410628c26a8f0d2b0 |
| gitsigns.nvim               | d195f0c35ced5174d3ecce1c4c8ebb3b5bc23fa9 |
| indent-blankline.nvim       | 3c8a185da4b8ab7aef487219f5e001b11d4b6aaf |
| lazy.nvim                   | 96584866b9c5e998cbae300594d0ccfd0c464627 |
| lspkind.nvim                | 7f26cf5e27e2bd910ce0ea00c514da2bf97423b8 |
| lualine.nvim                | 566b7036f717f3d676362742630518a47f132fff |
| mason-lspconfig.nvim        | 56e435e09f8729af2d41973e81a0db440f8fe9c9 |
| mason-nvim-dap.nvim         | 9e82ded0515186edd4f69e4ce6b1a5f1b55b47e9 |
| mason.nvim                  | a09da6ac634926a299dd439da08bdb547a8ca011 |
| mini.comment                | 67f00d3ebbeae15e84584d971d0c32aad4f4f3a4 |
| neodev.nvim                 | 2a8630847dbb93455936156c0689678e4eaee319 |
| noice.nvim                  | 92433164e2f7118d4122c7674c3834d9511722ba |
| nui.nvim                    | 80445d015d2b5f9af0d9e8bce63d303bc86eda8a |
| null-ls.nvim                | 0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7 |
| nvim-autopairs              | 9fd41181693dd4106b3e414a822bb6569924de81 |
| nvim-cmp                    | 538e37ba87284942c1d76ed38dd497e54e65b891 |
| nvim-dap                    | f0dca670fa059eb89dda8869a6310c804241345c |
| nvim-dap-ui                 | 7e5e16427aaf814dc2d58e1b219def9ef2fa2435 |
| nvim-dap-virtual-text       | d4542ac257d3c7ee4131350db6179ae6340ce40b |
| nvim-lspconfig              | ce0e625df61be77abe1340fbc9afe9ad39b31dd8 |
| nvim-surround               | 703ec63aa798e5e07d309b35e42def34bebe0174 |
| nvim-treesitter             | 8ae4080c5ba59d81b4e49525d4168807bc098e73 |
| nvim-treesitter-refactor    | 65ad2eca822dfaec2a3603119ec3cc8826a7859e |
| nvim-treesitter-textobjects | 85b9d0cbd4ff901abcda862b50dbb34e0901848b |
| nvim-web-devicons           | 3e24abe1ae66532135cec911562f553fe247cb56 |
| one-small-step-for-vimkind  | aaee281bdaa3141d9d0cdb3dec468532da61124f |
| persistence.nvim            | ad538bfd5336f1335cdb6fd4e0b0eebfa6e12f32 |
| playground                  | ba48c6a62a280eefb7c85725b0915e021a1a0749 |
| plenary.nvim                | 55d9fe89e33efd26f532ef20223e5f9430c8b0c0 |
| telescope-fzf-native.nvim   | 6c921ca12321edaa773e324ef64ea301a1d0da62 |
| telescope.nvim              | 87e92ea31b2b61d45ad044cf7b2d9b66dad2a618 |
| todo-comments.nvim          | 4a6737a8d70fe1ac55c64dfa47fcb189ca431872 |
| tokyonight.nvim             | f247ee700b569ed43f39320413a13ba9b0aef0db |
| trouble.nvim                | f1168feada93c0154ede4d1fe9183bf69bac54ea |
| which-key.nvim              | 4433e5ec9a507e5097571ed55c02ea9658fb268a |

<!--plugin end-->
