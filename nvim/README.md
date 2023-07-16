# Neovim configuration

My handcrafted Neovim configuration written purely in Lua.

## Layout

The scheme of my Neovim configuration is rather simple once you understand it.

```
.
├── ftplugin
│   └── markdown.lua
├── init.lua
├── lazy-lock.json
├── lua
│   ├── commands.lua
│   ├── core.lua
│   ├── keymaps.lua
│   ├── plain.lua
│   ├── plugins
│   │   ├── alpha.lua
│   │   ├── autopairs.lua
│   │   ├── bullets.lua
│   │   ├── cmp.lua
│   │   ├── colorscheme.lua
│   │   ├── comment.lua
│   │   ├── copilot.lua
│   │   ├── dap
│   │   │   ├── bash.lua
│   │   │   ├── init.lua
│   │   │   ├── lua.lua
│   │   │   ├── python.lua
│   │   │   └── rust.lua
│   │   ├── deadcolumn.lua
│   │   ├── dressing.lua
│   │   ├── fterm.lua
│   │   ├── gitsigns.lua
│   │   ├── headlines.lua
│   │   ├── indent_blankline.lua
│   │   ├── lsp.lua
│   │   ├── lualine.lua
│   │   ├── markdown_preview.lua
│   │   ├── neogit.lua
│   │   ├── neotree.lua
│   │   ├── noice.lua
│   │   ├── null_ls.lua
│   │   ├── persistence.lua
│   │   ├── surround.lua
│   │   ├── telescope.lua
│   │   ├── todo.lua
│   │   ├── treesitter.lua
│   │   ├── trouble.lua
│   │   ├── ts_playground.lua
│   │   └── which-key
│   │       ├── config.lua
│   │       ├── init.lua
│   │       └── keymappings.lua
│   └── utils.lua
├── spell
│   ├── en.utf-8.add
│   ├── en.utf-8.add.spl
└── utils
    ├── linter-config
    │   ├── .luacheckrc
    │   └── .stylua.toml
    └── thesaurii.txt
```

The `init.lua` file is the main configuration file. It bootstraps my plugin
manager lazy.nvim and then loads the other modules. `keymaps.lua` contains
keymaps for the editor. The plugins folder is the largest and most important
since it contains all the plugins and configuration for each of them that I use.
All my plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim)
and are grouped in separate files.

The `utils` folder has the configuration files for my Lua linters. I copied them
from the Neovim repository.

The `ftplugin` folder holds the configuration files for special file types. So
far, I have one for Markdown.

## Plugins

<!--plugin start-->

| Plugin                     | Commit                                   |
| -------------------------- | ---------------------------------------- |
| Comment.nvim               | 176e85eeb63f1a5970d6b88f1725039d85ca0055 |
| FTerm.nvim                 | d1320892cc2ebab472935242d9d992a2c9570180 |
| LuaSnip                    | 45a4e899ca8f54936fe32ead6bba65f2a8d42e12 |
| alpha-nvim                 | e4fc5e29b731bdf55d204c5c6a11dc3be70f3b65 |
| bullets.vim                | 746f92ae05cdcc988857d8e76418326f07af9494 |
| catppuccin                 | e0dd3f9bb1513c98ab4ef9404ea26e18babf858a |
| cmp-calc                   | 50792f34a628ea6eb31d2c90e8df174671e4e7a0 |
| cmp-cmdline                | 8ee981b4a91f536f52add291594e89fb6645e451 |
| cmp-emoji                  | 19075c36d5820253d32e2478b6aaf3734aeaafa0 |
| cmp-nerdfont               | 853a946eda00016f60c0602a20d8595c6eb074a6 |
| cmp-nvim-lsp               | 44b16d11215dce86f253ce0c30949813c0a90765 |
| cmp-path                   | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp-treesitter             | 389eadd48c27aa6dc0e6b992644704f026802a2e |
| cmp_luasnip                | 18095520391186d634a0045dacaa346291096566 |
| deadcolumn.nvim            | b9b5e237371ae5379e280e4df9ecf62e4bc8d7a5 |
| diffview.nvim              | b0cc22f5708f6b2b4f873b44fbc5eb93020f4e0c |
| dressing.nvim              | e6eff7a5a950a853c3903d906dbcea03f778db5f |
| friendly-snippets          | 8f5db6c5b691a6bbaa5dabd9afeb164ef8a06d04 |
| gitsigns.nvim              | 5a04466685008f29c71fa5ec25d421deb1c83fea |
| headlines.nvim             | ddef41b2664f0ce25fe76520d708e2dc9dfebd70 |
| indent-blankline.nvim      | 4541d690816cb99a7fc248f1486aa87f3abce91c |
| lazy.nvim                  | 25beed5e2e935ebc00d7e3eed1dc502df3c40e39 |
| lspkind.nvim               | 57610d5ab560c073c465d6faf0c19f200cb67e6e |
| lualine.nvim               | 05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9 |
| markdown-preview.nvim      | 02cc3874738bc0f86e4b91f09b8a0ac88aef8e96 |
| mason-lspconfig.nvim       | 828a538ac8419f586c010996aefa5df6eb7c250b |
| mason-nvim-dap.nvim        | e4d56b400e9757b1dc77d620fd3069396e92d5fc |
| mason.nvim                 | 5ad3e113b0c3fde3caba8630599373046f6197e8 |
| neo-tree.nvim              | 80dc74d081823649809f78370fa5b204aa9a853a |
| neodev.nvim                | d89c108a091172fa46dbdcb8486c6645127aabe1 |
| neogit                     | 1b6edb56e8c754494be1564912d33e50ddd8a023 |
| noice.nvim                 | 26394ed09d47160a493d4e9e754f5f78d4556a6b |
| nui.nvim                   | d146966a423e60699b084eeb28489fe3b6427599 |
| null-ls.nvim               | db09b6c691def0038c456551e4e2772186449f35 |
| nvim-autopairs             | ae5b41ce880a6d850055e262d6dfebd362bb276e |
| nvim-cmp                   | c4e491a87eeacf0408902c32f031d802c7eafce8 |
| nvim-dap                   | 3bde6f786057fa29d8356559b2ae3a52d9317fba |
| nvim-dap-ui                | 85b16ac2309d85c88577cd8ee1733ce52be8227e |
| nvim-dap-virtual-text      | 57f1dbd0458dd84a286b27768c142e1567f3ce3b |
| nvim-lspconfig             | 4b26897a80c41eb2f116b271cbdcd4686fb52dd6 |
| nvim-notify                | ea9c8ce7a37f2238f934e087c255758659948e0f |
| nvim-surround              | 211eaad7c6d01ef4ac02cba9052b3082ec232101 |
| nvim-treesitter            | 51ea343f705a89326cff8dd7a0542d7fe0e6699a |
| nvim-treesitter-refactor   | 65ad2eca822dfaec2a3603119ec3cc8826a7859e |
| nvim-web-devicons          | efbfed0567ef4bfac3ce630524a0f6c8451c5534 |
| one-small-step-for-vimkind | 5cacc816153c66a50de92c9cee29077b4a380254 |
| persistence.nvim           | 4b8051c01f696d8849a5cb8afa9767be8db16e40 |
| playground                 | 2b81a018a49f8e476341dfcb228b7b808baba68b |
| plenary.nvim               | 1a6a7c929628566cf406aa7da1d048a1ddc7e9a8 |
| rose-pine                  | 76cae45b4e6716ee93afc78bd3860134935ea9d7 |
| telescope-fzf-native.nvim  | 9bc8237565ded606e6c366a71c64c0af25cd7a50 |
| telescope.nvim             | 2ea8dcd17b4f9b7714354965a28ae4fef4139c71 |
| todo-comments.nvim         | 09b0b17d824d2d56f02ff15967e8a2499a89c731 |
| tokyonight.nvim            | 1ee11019f8a81dac989ae1db1a013e3d582e2033 |
| trouble.nvim               | 20d1b30d6925213abece21d35858a16e11d1e9fc |
| which-key.nvim             | 38b990f6eabf62014018b4aae70a97d7a6c2eb88 |

<!--plugin end-->
