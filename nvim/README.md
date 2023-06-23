# Neovim configuration

My handcrafted Neovim configuration written purely in Lua.

## Layout

The scheme of my Neovim configuration is rather simple once you understand it.

```
.
|-- ftplugin
|   `-- markdown.lua
|-- init.lua
|-- lazy-lock.json
|-- lua
|   |-- core
|   |   |-- autocmds.lua
|   |   |-- init.lua
|   |   `-- vars.lua
|   |-- keymaps.lua
|   `-- plugins
|       |-- alpha.lua
|       |-- autopairs.lua
|       |-- barbar.lua
|       |-- bullets.lua
|       |-- cmp.lua
|       |-- colorscheme.lua
|       |-- comment.lua
|       |-- copilot.lua
|       |-- general.lua
|       |-- gitsigns.lua
|       |-- lspconfig.lua
|       |-- lualine.lua
|       |-- markdown.lua
|       |-- noice.lua
|       |-- null-ls.lua
|       |-- nvim-tree.lua
|       |-- telekasten.lua
|       |-- telescope.lua
|       |-- todo.lua
|       |-- treesitter.lua
|       |-- trouble.lua
|       `-- which-key
|           |-- config.lua
|           |-- init.lua
|           `-- keymappings.lua
|-- spell
|   |-- en.utf-8.add
|   `-- en.utf-8.add.spl
`-- utils
    |-- linter-config
    `-- thesaurii.txt
```

The `init.lua` file is the main configuration file. It bootstraps my plugin
manager lazy.nvim and then loads the other modules. The `core` folder contains
some basic configuration for Neovim variables. `keymaps.lua` contains keymaps
for the editor. The plugins folder is the largest and most important since it
contains all the plugins and configuration for each of them that I use. All my
plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim) and are
grouped in separate files.

The `utils` folder has the configuration files for my Lua linters. I copied them
from the Neovim repository.

The `ftplugin` folder holds the configuration files for special file types. So
far, I have one for Markdown.

## Plugins

| Plugin | Commit |
| ------ | ------- |
| nvim-notify | `ea9c8ce7a37f2238f934e087c255758659948e0f` |
| twilight.nvim | `a4843e6e67092a1e6fa9666f02bf0ab59174c1df` |
| LuaSnip | `3d2ad0c0fa25e4e272ade48a62a185ebd0fe26c1` |
| which-key.nvim | `d871f2b664afd5aed3dc1d1573bef2fb24ce0484` |
| alpha-nvim | `9e33db324b8bb7a147bce9ea5496686ee859461d` |
| zen-mode.nvim | `68f554702de63f4b7b6b6d4bcb10178f41a0acc7` |
| nvim-treesitter-refactor | `65ad2eca822dfaec2a3603119ec3cc8826a7859e` |
| bracey.vim | `4e1a22acc01787814819df1057d039d4ecf357eb` |
| nvim-web-devicons | `14b3a5ba63b82b60cde98d0a40319d80f25e8301` |
| bullets.vim | `746f92ae05cdcc988857d8e76418326f07af9494` |
| one-small-step-for-vimkind | `f239ca0dc772f214e7ff0627ccbd45bceae88bf8` |
| catppuccin | `506a4aa13443e0104ea49b99947cc09488d0791d` |
| persistence.nvim | `4b8051c01f696d8849a5cb8afa9767be8db16e40` |
| cmp-calc | `50792f34a628ea6eb31d2c90e8df174671e4e7a0` |
| playground | `2b81a018a49f8e476341dfcb228b7b808baba68b` |
| cmp-cmdline | `8ee981b4a91f536f52add291594e89fb6645e451` |
| cmp-emoji | `19075c36d5820253d32e2478b6aaf3734aeaafa0` |
| cmp-nerdfont | `853a946eda00016f60c0602a20d8595c6eb074a6` |
| headlines.nvim | `ddef41b2664f0ce25fe76520d708e2dc9dfebd70` |
| indent-blankline.nvim | `7075d7861f7a6bbf0de0298c83f8a13195e6ec01` |
| copilot.lua | `9cb5396205faf609bc9df0e841e133ccb1b70540` |
| lazy.nvim | `b7043f2983d7aead78ca902f3f2053907081859a` |
| cmp-nvim-lsp | `0e6b2ed705ddcff9738ec4ea838141654f12eeef` |
| lspkind.nvim | `57610d5ab560c073c465d6faf0c19f200cb67e6e` |
| cmp-path | `91ff86cd9c29299a64f968ebb45846c485725f23` |
| lualine.nvim | `05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9` |
| cmp-treesitter | `389eadd48c27aa6dc0e6b992644704f026802a2e` |
| markdown-preview.nvim | `02cc3874738bc0f86e4b91f09b8a0ac88aef8e96` |
| cmp_luasnip | `18095520391186d634a0045dacaa346291096566` |
| mason-lspconfig.nvim | `d381fcb78d7a562c3244e1c8f76406954649db36` |
| copilot-cmp | `c2cdb3c0f5078b0619055af192295830a7987790` |
| mason-nvim-dap.nvim | `e4d56b400e9757b1dc77d620fd3069396e92d5fc` |
| gitsigns.nvim | `a36bc3360d584d39b4fb076d855c4180842d4444` |
| mason.nvim | `664c987c3b14d2262a4e580f993a3e5045baded0` |
| nvim-treesitter | `ae0415331483bd143f80c186401fb2aa783f33df` |
| neo-tree.nvim | `8324fd52f7880bf17142f56b45f544d64eff5ac9` |
| nvim-surround | `211eaad7c6d01ef4ac02cba9052b3082ec232101` |
| nvim-lspconfig | `11a1be0e5f180b57079db56de10a20b4323111ae` |
| neodev.nvim | `8bce31c0899bcf369351147518be77a5e4c7b889` |
| friendly-snippets | `5749f093759c29e3694053d048ceb940fe12c3d3` |
| neogit | `68a3e90e9d1ed9e362317817851d0f34b19e426b` |
| firenvim | `3c4babfa0a561d1dc3640a902e67ca0b8af70927` |
| noice.nvim | `7d01b45174d0d642302518275ab7cedf73e2690b` |
| dressing.nvim | `5fb5cce0cbfcedeadbcee43e5674e8c9a9f28d4a` |
| nui.nvim | `d146966a423e60699b084eeb28489fe3b6427599` |
| diffview.nvim | `b3a763f8c7810b352226c95faa7d3ac9fb93b8d9` |
| null-ls.nvim | `bbaf5a96913aa92281f154b08732be2f57021c45` |
| plenary.nvim | `36aaceb6e93addd20b1b18f94d86aecc552f30c4` |
| nvim-autopairs | `e8f7dd7a72de3e7b6626c050a802000e69d53ff0` |
| rose-pine | `932adb0d9351186db047302de021bb2976756a07` |
| nvim-cmp | `8a1694ff330ed58ed29716686fcef79c28090354` |
| telescope-fzf-native.nvim | `9bc8237565ded606e6c366a71c64c0af25cd7a50` |
| nvim-dap | `a6d48d23407fbad7a4c1451803b8f34cab31c441` |
| telescope.nvim | `ffe35cb433192fcb5080b557c1aef14d37092035` |
| nvim-dap-ui | `c020f660b02772f9f3d11f599fefad3268628a9e` |
| todo-comments.nvim | `09b0b17d824d2d56f02ff15967e8a2499a89c731` |
| nvim-dap-virtual-text | `57f1dbd0458dd84a286b27768c142e1567f3ce3b` |
| tokyonight.nvim | `a0a7bfbc4c54348b56880a162afac9d103c618c1` |
| Comment.nvim | `176e85eeb63f1a5970d6b88f1725039d85ca0055` |
| trouble.nvim | `2af0dd9767526410c88c628f1cbfcb6cf22dd683` |
