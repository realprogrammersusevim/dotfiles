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
| LuaSnip                     | 878ace11983444d865a72e1759dbcc331d1ace4c |
| alpha-nvim                  | 41283fb402713fc8b327e60907f74e46166f4cfd |
| bullets.vim                 | 448ad2a159c5f2540f6c9738f3bb9e6f15a41734 |
| cmp-nvim-lsp                | 39e2eda76828d88b773cc27a3f61d2ad782c922d |
| cmp-path                    | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp_luasnip                 | 05a9ab28b53f71d1aece421ef32fee2cb857a843 |
| copilot.lua                 | f7612f5af4a7d7615babf43ab1e67a2d790c13a6 |
| dressing.nvim               | 3c38ac861e1b8d4077ff46a779cde17330b29f3a |
| friendly-snippets           | d0610077b6129cf9f7f78afbe3a1425d60f6e2f1 |
| gitsigns.nvim               | af3fdad8ddcadbdad835975204f6503310526fd9 |
| indent-blankline.nvim       | d98f537c3492e87b6dc6c2e3f66ac517528f406f |
| lazy.nvim                   | 24fa2a97085ca8a7220b5b078916f81e316036fd |
| lspkind.nvim                | 1735dd5a5054c1fb7feaf8e8658dbab925f4f0cf |
| lualine.nvim                | 0a5a66803c7407767b799067986b4dc3036e1983 |
| mason-lspconfig.nvim        | a4caa0d083aab56f6cd5acf2d42331b74614a585 |
| mason-nvim-dap.nvim         | 67210c0e775adec55de9826b038e8b62de554afc |
| mason.nvim                  | 49ff59aded1047a773670651cfa40e76e63c6377 |
| mini.comment                | c8406379987c321ecdef9f53e1ca741a55002104 |
| neodev.nvim                 | ce9a2e8eaba5649b553529c5498acb43a6c317cd |
| noice.nvim                  | f119045f38792ad5311e5f9be7a879e4c1a95fe0 |
| none-ls-extras.nvim         | 336e84b9e43c0effb735b08798ffac382920053b |
| none-ls.nvim                | 60f5f80686f5a272ed3281a7d4962cb54dc5348e |
| nui.nvim                    | b1b3dcd6ed8f355c78bad3d395ff645be5f8b6ae |
| nvim-autopairs              | c15de7e7981f1111642e7e53799e1211d4606cb9 |
| nvim-cmp                    | 5260e5e8ecadaf13e6b82cf867a909f54e15fd07 |
| nvim-dap                    | 922ebc75c2fa9305e36402fbd8c984c8638770a0 |
| nvim-dap-ui                 | 334cf3038c4756e6ab999cbac67c847fb654c190 |
| nvim-dap-virtual-text       | d7c695ea39542f6da94ee4d66176f5d660ab0a77 |
| nvim-lspconfig              | 38de86f82efd9ba0881203767d6a8e1815abca28 |
| nvim-surround               | 79aaa42da1f698ed31bcbe7f83081f69dca7ba17 |
| nvim-treesitter             | ea2b137f35fb1e87a6471ec311805920fdf45745 |
| nvim-treesitter-refactor    | 65ad2eca822dfaec2a3603119ec3cc8826a7859e |
| nvim-treesitter-textobjects | 3557e41418b4a6c5b85d5d64abe94c9c50fa9b14 |
| nvim-web-devicons           | b77921fdc44833c994fdb389d658ccbce5490c16 |
| one-small-step-for-vimkind  | e92abbce0b9b77fed1aaf6f122fb18b7045b15ec |
| persistence.nvim            | 5fe077056c821aab41f87650bd6e1c48cd7dd047 |
| playground                  | ba48c6a62a280eefb7c85725b0915e021a1a0749 |
| plenary.nvim                | a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683 |
| telescope-fzf-native.nvim   | 9ef21b2e6bb6ebeaf349a0781745549bbb870d27 |
| telescope.nvim              | 2df52609a1632de5d77a0b2416db6ad9cf32e463 |
| todo-comments.nvim          | e1549807066947818113a7d7ed48f637e49620d3 |
| tokyonight.nvim             | 0fae425aaab04a5f97666bd431b96f2f19c36935 |
| trouble.nvim                | a8264a65a0b894832ea642844f5b7c30112c458f |
| which-key.nvim              | 4433e5ec9a507e5097571ed55c02ea9658fb268a |

<!--plugin end-->
