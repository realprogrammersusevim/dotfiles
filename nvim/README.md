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
| Comment.nvim               | 0236521ea582747b58869cb72f70ccfa967d2e89 |
| FTerm.nvim                 | d1320892cc2ebab472935242d9d992a2c9570180 |
| LuaSnip                    | 99a94cc35ec99bf06263d0346128e908a204575c |
| alpha-nvim                 | e4fc5e29b731bdf55d204c5c6a11dc3be70f3b65 |
| bullets.vim                | 746f92ae05cdcc988857d8e76418326f07af9494 |
| catppuccin                 | 490078b1593c6609e6a50ad5001e7902ea601824 |
| cmp-calc                   | 50792f34a628ea6eb31d2c90e8df174671e4e7a0 |
| cmp-cmdline                | 8ee981b4a91f536f52add291594e89fb6645e451 |
| cmp-emoji                  | 19075c36d5820253d32e2478b6aaf3734aeaafa0 |
| cmp-nerdfont               | 853a946eda00016f60c0602a20d8595c6eb074a6 |
| cmp-nvim-lsp               | 44b16d11215dce86f253ce0c30949813c0a90765 |
| cmp-path                   | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp-treesitter             | 389eadd48c27aa6dc0e6b992644704f026802a2e |
| cmp_luasnip                | 18095520391186d634a0045dacaa346291096566 |
| deadcolumn.nvim            | b9b5e237371ae5379e280e4df9ecf62e4bc8d7a5 |
| diffview.nvim              | 500d8b2013812e05ab87db83a8d22319986519f2 |
| dressing.nvim              | 169877dbcae54b23b464b219e053e92854bbb37f |
| friendly-snippets          | bc38057e513458cb2486b6cd82d365fa294ee398 |
| gitsigns.nvim              | bae45ef449d8811061cc940459e70e883a3aa83a |
| headlines.nvim             | 74a083a3c32a08be24f7dfcc6f448ecf47857f46 |
| indent-blankline.nvim      | 4541d690816cb99a7fc248f1486aa87f3abce91c |
| lazy.nvim                  | dac844ed617dda4f9ec85eb88e9629ad2add5e05 |
| lspkind.nvim               | 57610d5ab560c073c465d6faf0c19f200cb67e6e |
| lualine.nvim               | 45e27ca739c7be6c49e5496d14fcf45a303c3a63 |
| markdown-preview.nvim      | 02cc3874738bc0f86e4b91f09b8a0ac88aef8e96 |
| mason-lspconfig.nvim       | e86a4c84ff35240639643ffed56ee1c4d55f538e |
| mason-nvim-dap.nvim        | 6148b51db945b55b3b725da39eaea6441e59dff8 |
| mason.nvim                 | 74eac861b013786bf231b204b4ba9a7d380f4bd9 |
| neo-tree.nvim              | 80dc74d081823649809f78370fa5b204aa9a853a |
| neodev.nvim                | 81a893eb94d502b2cbb08ed3871eeaadfd240131 |
| neogit                     | 02b7032f397d5c7d457e8d604fda98f72c396e4d |
| noice.nvim                 | 894db25ec726d32047799d4d0a982b701bec453b |
| nui.nvim                   | 9e3916e784660f55f47daa6f26053ad044db5d6a |
| null-ls.nvim               | db09b6c691def0038c456551e4e2772186449f35 |
| nvim-autopairs             | ae5b41ce880a6d850055e262d6dfebd362bb276e |
| nvim-cmp                   | 3b9f28061a67b19cadc13946de981426a6425e4a |
| nvim-dap                   | 1c63f37f95cd4fb54512898168138d9a75d1516a |
| nvim-dap-ui                | 85b16ac2309d85c88577cd8ee1733ce52be8227e |
| nvim-dap-virtual-text      | 57f1dbd0458dd84a286b27768c142e1567f3ce3b |
| nvim-lspconfig             | a981d4447b92c54a4d464eb1a76b799bc3f9a771 |
| nvim-notify                | ea9c8ce7a37f2238f934e087c255758659948e0f |
| nvim-surround              | 0d6882635817a2677749a330127d12ac30a4f3c8 |
| nvim-treesitter            | 15129f6d70a4d7adc380abe57a64af93478f72e5 |
| nvim-treesitter-refactor   | 65ad2eca822dfaec2a3603119ec3cc8826a7859e |
| nvim-web-devicons          | ab899311f8ae00a47eae8e0879506cead8eb1561 |
| one-small-step-for-vimkind | 5cacc816153c66a50de92c9cee29077b4a380254 |
| persistence.nvim           | 4b8051c01f696d8849a5cb8afa9767be8db16e40 |
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
