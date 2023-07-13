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

| Plugin                     | Commit                                     |
| -------------------------- | ------------------------------------------ |
| nvim-cmp                   | `2743dd989e9b932e1b4813a4927d7b84272a14e2` |
| bullets.vim                | `746f92ae05cdcc988857d8e76418326f07af9494` |
| nvim-dap                   | `bb1ddce6cd951ef3c1319e4fd8596131113163c3` |
| catppuccin                 | `278bfeb61bd627dc2a8885180a0441a1ebe65a41` |
| nvim-dap-ui                | `c020f660b02772f9f3d11f599fefad3268628a9e` |
| cmp-calc                   | `50792f34a628ea6eb31d2c90e8df174671e4e7a0` |
| nvim-dap-virtual-text      | `57f1dbd0458dd84a286b27768c142e1567f3ce3b` |
| cmp-cmdline                | `8ee981b4a91f536f52add291594e89fb6645e451` |
| nvim-lspconfig             | `51739a8bc531542079698c58512feb68469f5d27` |
| cmp-emoji                  | `19075c36d5820253d32e2478b6aaf3734aeaafa0` |
| nvim-notify                | `ea9c8ce7a37f2238f934e087c255758659948e0f` |
| cmp-nerdfont               | `853a946eda00016f60c0602a20d8595c6eb074a6` |
| nvim-surround              | `211eaad7c6d01ef4ac02cba9052b3082ec232101` |
| cmp-nvim-lsp               | `44b16d11215dce86f253ce0c30949813c0a90765` |
| nvim-treesitter            | `1ef286e5b0cfd17f56586a8445cd83d61647f851` |
| cmp-path                   | `91ff86cd9c29299a64f968ebb45846c485725f23` |
| nvim-treesitter-refactor   | `65ad2eca822dfaec2a3603119ec3cc8826a7859e` |
| cmp-treesitter             | `389eadd48c27aa6dc0e6b992644704f026802a2e` |
| nvim-web-devicons          | `9ab9b0b894b2388a9dbcdee5f00ce72e25d85bf9` |
| cmp_luasnip                | `18095520391186d634a0045dacaa346291096566` |
| one-small-step-for-vimkind | `42c36bf4a6442a3a9fe8e477b63a134a4892f5ee` |
| deadcolumn.nvim            | `b9b5e237371ae5379e280e4df9ecf62e4bc8d7a5` |
| persistence.nvim           | `4b8051c01f696d8849a5cb8afa9767be8db16e40` |
| diffview.nvim              | `94f5f40543e393d9028bae9ce2fedf6da3af701a` |
| playground                 | `2b81a018a49f8e476341dfcb228b7b808baba68b` |
| dressing.nvim              | `e6eff7a5a950a853c3903d906dbcea03f778db5f` |
| plenary.nvim               | `bda256fab0eb66a15e8190937e417e6a14ee5d72` |
| friendly-snippets          | `a94db1ee6ddfd238e725b0f90163fdd65d382464` |
| rose-pine                  | `932adb0d9351186db047302de021bb2976756a07` |
| gitsigns.nvim              | `dc2962f7fce953a2a98e7c6d3d7fc4c1d1f66758` |
| telescope-fzf-native.nvim  | `9bc8237565ded606e6c366a71c64c0af25cd7a50` |
| headlines.nvim             | `ddef41b2664f0ce25fe76520d708e2dc9dfebd70` |
| telescope.nvim             | `276362a8020c6e94c7a76d49aa00d4923b0c02f3` |
| indent-blankline.nvim      | `4541d690816cb99a7fc248f1486aa87f3abce91c` |
| todo-comments.nvim         | `09b0b17d824d2d56f02ff15967e8a2499a89c731` |
| lazy.nvim                  | `5af331ea65418dc9361769891921fdee4bcc837a` |
| tokyonight.nvim            | `284667adfff02b9a0adc65968c553c6096b543b6` |
| lspkind.nvim               | `57610d5ab560c073c465d6faf0c19f200cb67e6e` |
| trouble.nvim               | `d99e2abd10808ef91738ce98a5c767e6a51df449` |
| lualine.nvim               | `05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9` |
| which-key.nvim             | `d871f2b664afd5aed3dc1d1573bef2fb24ce0484` |
| markdown-preview.nvim      | `02cc3874738bc0f86e4b91f09b8a0ac88aef8e96` |
| mason-lspconfig.nvim       | `82685fdd0f67a694b244cb058b83761f54664d68` |
| mason-nvim-dap.nvim        | `e4d56b400e9757b1dc77d620fd3069396e92d5fc` |
| mason.nvim                 | `5ad3e113b0c3fde3caba8630599373046f6197e8` |
| neo-tree.nvim              | `7f6fa04dbd8e8c79d1af33bc90e856b65d8641da` |
| neodev.nvim                | `0705c72c281626f45c78d0916151d3e2bfb53fae` |
| neogit                     | `1b6edb56e8c754494be1564912d33e50ddd8a023` |
| noice.nvim                 | `6c87c1d11c38180fb72bf8f45518a0a3e081afc1` |
| nvim-autopairs             | `e8f7dd7a72de3e7b6626c050a802000e69d53ff0` |
| FTerm.nvim                 | `d1320892cc2ebab472935242d9d992a2c9570180` |
| null-ls.nvim               | `db09b6c691def0038c456551e4e2772186449f35` |
| LuaSnip                    | `a658ae2906344a1d2b9c507738e585cf68e685c7` |
| nui.nvim                   | `d146966a423e60699b084eeb28489fe3b6427599` |
| alpha-nvim                 | `9e33db324b8bb7a147bce9ea5496686ee859461d` |
| Comment.nvim               | `176e85eeb63f1a5970d6b88f1725039d85ca0055` |
