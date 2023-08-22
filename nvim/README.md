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

| Plugin                     | Commit                                   |
| -------------------------- | ---------------------------------------- |
| Comment.nvim               | 0236521ea582747b58869cb72f70ccfa967d2e89 |
| LuaSnip                    | c4d6298347f7707e9757351b2ee03d0c00da5c20 |
| alpha-nvim                 | 7a6b9487dba044a43fde534bf5036f0fda5b6b23 |
| bullets.vim                | 746f92ae05cdcc988857d8e76418326f07af9494 |
| catppuccin                 | b573866ef64122119668f375ebb794bcb3b518e2 |
| cmp-nvim-lsp               | 44b16d11215dce86f253ce0c30949813c0a90765 |
| cmp-path                   | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp_luasnip                | 18095520391186d634a0045dacaa346291096566 |
| dressing.nvim              | ee571505f3566f84fd252e76c4ce6df6eaf2fb94 |
| friendly-snippets          | 377d45475b49e37460a902d6d569d2093d4037d0 |
| gitsigns.nvim              | 749267aaa863c30d721c9913699c5d94e0c07dd3 |
| headlines.nvim             | 74a083a3c32a08be24f7dfcc6f448ecf47857f46 |
| indent-blankline.nvim      | 9637670896b68805430e2f72cf5d16be5b97a22a |
| lazy.nvim                  | dac844ed617dda4f9ec85eb88e9629ad2add5e05 |
| lspkind.nvim               | 57610d5ab560c073c465d6faf0c19f200cb67e6e |
| lualine.nvim               | 45e27ca739c7be6c49e5496d14fcf45a303c3a63 |
| mason-lspconfig.nvim       | 2997f467881ac4faa6f8c5e7065e3a672297c8ad |
| mason-nvim-dap.nvim        | 6148b51db945b55b3b725da39eaea6441e59dff8 |
| mason.nvim                 | a51c2d063c5377ee9e58c5f9cda7c7436787be72 |
| neo-tree.nvim              | 80dc74d081823649809f78370fa5b204aa9a853a |
| neodev.nvim                | c05273b0833021fee8069ea4258fc5ea327596ac |
| noice.nvim                 | 894db25ec726d32047799d4d0a982b701bec453b |
| nui.nvim                   | 9e3916e784660f55f47daa6f26053ad044db5d6a |
| null-ls.nvim               | 0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7 |
| nvim-autopairs             | ae5b41ce880a6d850055e262d6dfebd362bb276e |
| nvim-cmp                   | 51f1e11a89ec701221877532ee1a23557d291dd5 |
| nvim-dap                   | 897c433ff2fbcf6f71a57bf18460d810e173d1e0 |
| nvim-dap-ui                | 85b16ac2309d85c88577cd8ee1733ce52be8227e |
| nvim-dap-virtual-text      | 57f1dbd0458dd84a286b27768c142e1567f3ce3b |
| nvim-lspconfig             | 93c6826b16217eaef568ca5c224ea5d0c12bbb82 |
| nvim-notify                | ea9c8ce7a37f2238f934e087c255758659948e0f |
| nvim-surround              | 0d6882635817a2677749a330127d12ac30a4f3c8 |
| nvim-treesitter            | 2ee71c1a2fa74c10692be10ae420ff0c3a02eb3c |
| nvim-treesitter-refactor   | 65ad2eca822dfaec2a3603119ec3cc8826a7859e |
| nvim-web-devicons          | cfc8824cc1db316a276b36517f093baccb8e799a |
| one-small-step-for-vimkind | aa1c4a876c3a4e14614cd0dd55794d00f810dae9 |
| playground                 | 2b81a018a49f8e476341dfcb228b7b808baba68b |
| plenary.nvim               | 267282a9ce242bbb0c5dc31445b6d353bed978bb |
| rose-pine                  | e29002cbee4854a9c8c4b148d8a52fae3176070f |
| telescope-fzf-native.nvim  | 9bc8237565ded606e6c366a71c64c0af25cd7a50 |
| telescope.nvim             | 2d92125620417fbea82ec30303823e3cd69e90e8 |
| todo-comments.nvim         | 3094ead8edfa9040de2421deddec55d3762f64d1 |
| tokyonight.nvim            | 1ee11019f8a81dac989ae1db1a013e3d582e2033 |
| trouble.nvim               | 40aad004f53ae1d1ba91bcc5c29d59f07c5f01d3 |
| which-key.nvim             | 7ccf476ebe0445a741b64e36c78a682c1c6118b7 |

<!--plugin end-->
