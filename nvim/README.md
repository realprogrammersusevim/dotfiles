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

The `ftplugin` folder holds the configuration files for special file types.

## Plugins

<!--plugin start-->

| Plugin                      | Commit                                   |
| --------------------------- | ---------------------------------------- |
| blink.cmp                   | 327fff91fe6af358e990be7be1ec8b78037d2138 |
| bullets.vim                 | 1c13e510e11d08b0259e8e627f128359c5521962 |
| conform.nvim                | c64cc754ace603e185ab30113aaef174187eacf8 |
| friendly-snippets           | 572f5660cf05f8cd8834e096d7b4c921ba18e175 |
| gitsigns.nvim               | 89f75073da1c8fab1d8b6285da72366ee54633ba |
| lazy.nvim                   | 6c3bda4aca61a13a9c63f1c1d1b16b9d3be90d7a |
| lazydev.nvim                | 258d2a5ef4a3e3d6d9ba9da72c9725c53e9afcbd |
| lualine.nvim                | b8c23159c0161f4b89196f74ee3a6d02cdc3a955 |
| mini.icons                  | e8fae66cb400744daeedf6e387347df50271c252 |
| mini.pairs                  | 69864a2efb36c030877421634487fd90db1e4298 |
| noice.nvim                  | 0427460c2d7f673ad60eb02b35f5e9926cf67c59 |
| nui.nvim                    | de740991c12411b663994b2860f1a4fd0937c130 |
| nvim-lspconfig              | 8e4cdc6aeddb7361ff774b41dd85a86e8b87404f |
| nvim-surround               | a868c256c861044beb9794b4dd126480dcdfbdad |
| nvim-treesitter             | 42fc28ba918343ebfd5565147a42a26580579482 |
| nvim-treesitter-refactor    | d8b74fa87afc6a1e97b18da23e762efb032dc270 |
| nvim-treesitter-textobjects | 71385f191ec06ffc60e80e6b0c9a9d5daed4824c |
| nvim-web-devicons           | b8221e42cf7287c4dcde81f232f58d7b947c210d |
| oil.nvim                    | 919e155fdf38e9148cdb5304faaaf53c20d703ea |
| plenary.nvim                | b9fd5226c2f76c951fc8ed5923d85e4de065e509 |
| render-markdown.nvim        | 9ab9dade85d8c7d411cc89b592028da3d1b7955a |
| snacks.nvim                 | bfe8c26dbd83f7c4fbc222787552e29b4eccfcc0 |
| telescope-fzf-native.nvim   | 1f08ed60cafc8f6168b72b80be2b2ea149813e55 |
| telescope.nvim              | b4da76be54691e854d3e0e02c36b0245f945c2c7 |
| todo-comments.nvim          | 304a8d204ee787d2544d8bc23cd38d2f929e7cc5 |
| tokyonight.nvim             | 4d159616aee17796c2c94d2f5f87d2ee1a3f67c7 |
| trouble.nvim                | f176232e7759c4f8abd923c21e3e5a5c76cd6837 |
| typst-preview.nvim          | 1603d37bb44ed2efa0b4378d1dfedc087b4f2141 |
| which-key.nvim              | 904308e6885bbb7b60714c80ab3daf0c071c1492 |

<!--plugin end-->
