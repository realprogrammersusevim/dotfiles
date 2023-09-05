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
| alpha-nvim                  | 5f211a1597b06be24b1600d72a62b94cab1e2df9 |
| bullets.vim                 | 746f92ae05cdcc988857d8e76418326f07af9494 |
| cmp-nvim-lsp                | 44b16d11215dce86f253ce0c30949813c0a90765 |
| cmp-path                    | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp_luasnip                 | 18095520391186d634a0045dacaa346291096566 |
| dressing.nvim               | c1e1d5fa44fe08811b6ef4aadac2b50e602f9504 |
| friendly-snippets           | ebf6d6e83494cdd88a54a429340256f4dbb6a052 |
| gitsigns.nvim               | d927caa075df63bf301d92f874efb72fd22fd3b4 |
| indent-blankline.nvim       | 9637670896b68805430e2f72cf5d16be5b97a22a |
| lazy.nvim                   | 2a9354c7d2368d78cbd5575a51a2af5bd8a6ad01 |
| lspkind.nvim                | 57610d5ab560c073c465d6faf0c19f200cb67e6e |
| lualine.nvim                | 45e27ca739c7be6c49e5496d14fcf45a303c3a63 |
| mason-lspconfig.nvim        | dfdd771b792fbb4bad8e057d72558255695aa1a7 |
| mason-nvim-dap.nvim         | 6148b51db945b55b3b725da39eaea6441e59dff8 |
| mason.nvim                  | ee6a7f179ebf8aa9da9d53b1cf1b57d292ea0182 |
| neo-tree.nvim               | 80dc74d081823649809f78370fa5b204aa9a853a |
| neodev.nvim                 | dcd34653b0f1d3e7ea9aeb3e37dc7c8da445c4fe |
| noice.nvim                  | 74c2902146b080035beb19944baf6f014a954720 |
| nui.nvim                    | aa1b4c1e05983ff7debd2b4b2788651db099de2f |
| null-ls.nvim                | 0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7 |
| nvim-autopairs              | 35493556b895f54c129918aca43ae9a63af42a1f |
| nvim-cmp                    | 5dce1b778b85c717f6614e3f4da45e9f19f54435 |
| nvim-dap                    | 31e1ece773e10448dcb616d5144290946a6264b7 |
| nvim-dap-ui                 | 85b16ac2309d85c88577cd8ee1733ce52be8227e |
| nvim-dap-virtual-text       | 57f1dbd0458dd84a286b27768c142e1567f3ce3b |
| nvim-lspconfig              | 499314f76fa6e8f82f7cfd116578906d61ba2560 |
| nvim-surround               | 0d6882635817a2677749a330127d12ac30a4f3c8 |
| nvim-treesitter             | 95d02cdafe704fa5b86eac81f2eb1de3d8f52330 |
| nvim-treesitter-refactor    | 65ad2eca822dfaec2a3603119ec3cc8826a7859e |
| nvim-treesitter-textobjects | bd103502252027434ec42f628d2dbf54821d4ce6 |
| nvim-web-devicons           | bc11ee2498de2310de5776477dd9dce65d03b464 |
| one-small-step-for-vimkind  | aa1c4a876c3a4e14614cd0dd55794d00f810dae9 |
| persistence.nvim            | 4b8051c01f696d8849a5cb8afa9767be8db16e40 |
| playground                  | 429f3e76cbb1c59fe000b690f7a5bea617b890c0 |
| plenary.nvim                | 0dbe561ae023f02c2fb772b879e905055b939ce3 |
| telescope-fzf-native.nvim   | 9bc8237565ded606e6c366a71c64c0af25cd7a50 |
| telescope.nvim              | 20a37e43bb43c74c6091f9fea6551af0964ad45a |
| todo-comments.nvim          | 3094ead8edfa9040de2421deddec55d3762f64d1 |
| tokyonight.nvim             | 9a01eada39558dc3243278e6805d90e8dff45dc0 |
| trouble.nvim                | 3f85d8ed30e97ceeddbbcf80224245d347053711 |
| which-key.nvim              | 7ccf476ebe0445a741b64e36c78a682c1c6118b7 |

<!--plugin end-->
