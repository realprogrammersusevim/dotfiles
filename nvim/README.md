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
| LuaSnip                     | 80a8528f084a97b624ae443a6f50ff8074ba486b |
| alpha-nvim                  | 234822140b265ec4ba3203e3e0be0e0bb826dff5 |
| bullets.vim                 | 746f92ae05cdcc988857d8e76418326f07af9494 |
| cmp-nvim-lsp                | 44b16d11215dce86f253ce0c30949813c0a90765 |
| cmp-path                    | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp_luasnip                 | 05a9ab28b53f71d1aece421ef32fee2cb857a843 |
| dressing.nvim               | 1f2d1206a03bd3add8aedf6251e4534611de577f |
| friendly-snippets           | 43727c2ff84240e55d4069ec3e6158d74cb534b6 |
| gitsigns.nvim               | 5a9a6ac29a7805c4783cda21b80a1e361964b3f2 |
| indent-blankline.nvim       | 9301e434dd41154ffe5c3d5b8a5c9acd075ebeff |
| lazy.nvim                   | 4c75c8eeb957a99aa44ce8e526c04340ab358c5e |
| lspkind.nvim                | 57610d5ab560c073c465d6faf0c19f200cb67e6e |
| lualine.nvim                | 7533b0ead663d80452210c0c089e5105089697e5 |
| mason-lspconfig.nvim        | e7b64c11035aa924f87385b72145e0ccf68a7e0a |
| mason-nvim-dap.nvim         | 6148b51db945b55b3b725da39eaea6441e59dff8 |
| mason.nvim                  | cd7835b15f5a4204fc37e0aa739347472121a54c |
| neodev.nvim                 | b094a663ccb71733543d8254b988e6bebdbdaca4 |
| noice.nvim                  | e50fc6de68333633fa9eaaa54cb4cdfe7de5f25a |
| nui.nvim                    | c0c8e347ceac53030f5c1ece1c5a5b6a17a25b32 |
| null-ls.nvim                | 0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7 |
| nvim-autopairs              | f6c71641f6f183427a651c0ce4ba3fb89404fa9e |
| nvim-cmp                    | d3a3056204e1a9dbb7c7fe36c114dc43b681768c |
| nvim-dap                    | 92dc531eea2c9a3ef504a5c8ac0decd1fa59a6a3 |
| nvim-dap-ui                 | 34160a7ce6072ef332f350ae1d4a6a501daf0159 |
| nvim-dap-virtual-text       | 57f1dbd0458dd84a286b27768c142e1567f3ce3b |
| nvim-lspconfig              | e49b1e90c1781ce372013de3fa93a91ea29fc34a |
| nvim-surround               | 0d6882635817a2677749a330127d12ac30a4f3c8 |
| nvim-treesitter             | afa103385a2b5ef060596ed822ef63276ae88016 |
| nvim-treesitter-refactor    | 65ad2eca822dfaec2a3603119ec3cc8826a7859e |
| nvim-treesitter-textobjects | 78c49ca7d2f7ccba2115c11422c037713c978ad1 |
| nvim-web-devicons           | 3af745113ea537f58c4b1573b64a429fefad9e07 |
| one-small-step-for-vimkind  | edbb34ee779049f2071dc7becff0bbf51c865906 |
| persistence.nvim            | ad538bfd5336f1335cdb6fd4e0b0eebfa6e12f32 |
| playground                  | ba48c6a62a280eefb7c85725b0915e021a1a0749 |
| plenary.nvim                | 50012918b2fc8357b87cff2a7f7f0446e47da174 |
| telescope-fzf-native.nvim   | 6c921ca12321edaa773e324ef64ea301a1d0da62 |
| telescope.nvim              | 74ce793a60759e3db0d265174f137fb627430355 |
| todo-comments.nvim          | 3094ead8edfa9040de2421deddec55d3762f64d1 |
| tokyonight.nvim             | 633039585dff7fd2b9b62fb190bf768702609d95 |
| trouble.nvim                | f1168feada93c0154ede4d1fe9183bf69bac54ea |
| which-key.nvim              | ce741eb559c924d72e3a67d2189ad3771a231414 |

<!--plugin end-->
