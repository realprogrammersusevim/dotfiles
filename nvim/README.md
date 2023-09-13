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
| LuaSnip                     | ea7d7ea510c641c4f15042becd27f35b3e5b3c2b |
| alpha-nvim                  | 712dc1dccd4fd515ef8bd126b3718f79d3e23b0d |
| bullets.vim                 | 746f92ae05cdcc988857d8e76418326f07af9494 |
| cmp-nvim-lsp                | 44b16d11215dce86f253ce0c30949813c0a90765 |
| cmp-path                    | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp_luasnip                 | 18095520391186d634a0045dacaa346291096566 |
| dressing.nvim               | c1e1d5fa44fe08811b6ef4aadac2b50e602f9504 |
| friendly-snippets           | ebf6d6e83494cdd88a54a429340256f4dbb6a052 |
| gitsigns.nvim               | 907ae8636016aab2f283576fc60d46ca3427e579 |
| indent-blankline.nvim       | 9637670896b68805430e2f72cf5d16be5b97a22a |
| lazy.nvim                   | 2a9354c7d2368d78cbd5575a51a2af5bd8a6ad01 |
| lspkind.nvim                | 57610d5ab560c073c465d6faf0c19f200cb67e6e |
| lualine.nvim                | 45e27ca739c7be6c49e5496d14fcf45a303c3a63 |
| mason-lspconfig.nvim        | 01b4b6724ebcf5b43fc021486f6a260f1d09311e |
| mason-nvim-dap.nvim         | 6148b51db945b55b3b725da39eaea6441e59dff8 |
| mason.nvim                  | d66c60e17dd6fd8165194b1d14d21f7eb2c1697a |
| neo-tree.nvim               | 80dc74d081823649809f78370fa5b204aa9a853a |
| neodev.nvim                 | b07f1c4c0d5f0d077f29c776df3fd8c98c70e2f7 |
| noice.nvim                  | 74c2902146b080035beb19944baf6f014a954720 |
| nui.nvim                    | c8de23342caf8d50b15d6b28368d36a56a69d76f |
| null-ls.nvim                | 0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7 |
| nvim-autopairs              | defad64afbf19381fe31488a7582bbac421d6e38 |
| nvim-cmp                    | 5dce1b778b85c717f6614e3f4da45e9f19f54435 |
| nvim-dap                    | 0e6b7c47dd70e80793ed39271b2aa712d9366dbc |
| nvim-dap-ui                 | 34160a7ce6072ef332f350ae1d4a6a501daf0159 |
| nvim-dap-virtual-text       | 57f1dbd0458dd84a286b27768c142e1567f3ce3b |
| nvim-lspconfig              | 57139c690dc8d594b2f9de8d1e609f2854a4fe45 |
| nvim-surround               | 0d6882635817a2677749a330127d12ac30a4f3c8 |
| nvim-treesitter             | 9ab4e9cc8989e3811b14897cd0eb21ae35e5541e |
| nvim-treesitter-refactor    | 65ad2eca822dfaec2a3603119ec3cc8826a7859e |
| nvim-treesitter-textobjects | bd103502252027434ec42f628d2dbf54821d4ce6 |
| nvim-web-devicons           | 925e2aa30dc9fe9332060199c19f132ec0f3d493 |
| one-small-step-for-vimkind  | edbb34ee779049f2071dc7becff0bbf51c865906 |
| persistence.nvim            | 4b8051c01f696d8849a5cb8afa9767be8db16e40 |
| playground                  | 429f3e76cbb1c59fe000b690f7a5bea617b890c0 |
| plenary.nvim                | 9ce85b0f7dcfe5358c0be937ad23e456907d410b |
| telescope-fzf-native.nvim   | 6c921ca12321edaa773e324ef64ea301a1d0da62 |
| telescope.nvim              | a19770625aed49ad2a9f591a5e3946707f7359f6 |
| todo-comments.nvim          | 3094ead8edfa9040de2421deddec55d3762f64d1 |
| tokyonight.nvim             | 9a01eada39558dc3243278e6805d90e8dff45dc0 |
| trouble.nvim                | 3f85d8ed30e97ceeddbbcf80224245d347053711 |
| which-key.nvim              | 7ccf476ebe0445a741b64e36c78a682c1c6118b7 |

<!--plugin end-->
