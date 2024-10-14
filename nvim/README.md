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
| LuaSnip                     | e808bee352d1a6fcf902ca1a71cee76e60e24071 |
| alpha-nvim                  | b6f4129302db197a7249e67a90de3f2b676de13e |
| bullets.vim                 | 2253f970e54320dbd76fd6bb4f5a0bf2436ce232 |
| cmp-nvim-lsp                | 39e2eda76828d88b773cc27a3f61d2ad782c922d |
| cmp-path                    | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp_luasnip                 | 05a9ab28b53f71d1aece421ef32fee2cb857a843 |
| copilot.lua                 | 1a237cf50372830a61d92b0adf00d3b23882e0e1 |
| dressing.nvim               | 1b7921eecc65af1baf8ac1dc06f0794934cbcfb2 |
| friendly-snippets           | 00ebcaa159e817150bd83bfe2d51fa3b3377d5c4 |
| gitsigns.nvim               | 1ef74b546732f185d0f806860fa5404df7614f28 |
| indent-blankline.nvim       | 18603eb949eba08300799f64027af11ef922283f |
| lazy.nvim                   | 460e1cd8f24e364d54543a4b0e83f6f4ec1f65fb |
| lspkind.nvim                | cff4ae321a91ee3473a92ea1a8c637e3a9510aec |
| lualine.nvim                | b431d228b7bbcdaea818bdc3e25b8cdbe861f056 |
| mason-lspconfig.nvim        | 25c11854aa25558ee6c03432edfa0df0217324be |
| mason-nvim-dap.nvim         | 8b9363d83b5d779813cdd2819b8308651cec2a09 |
| mason.nvim                  | e2f7f9044ec30067bc11800a9e266664b88cda22 |
| mini.comment                | 03c13e37318bdb18481311c0ac1adc9ed731caf1 |
| neodev.nvim                 | 46aa467dca16cf3dfe27098042402066d2ae242d |
| noice.nvim                  | c1ba80ccf6b3bd8c7fc88fe2e61085131d44ad65 |
| none-ls.nvim                | 9b98991e15dce8fc502993e23caac2528b8b667f |
| nui.nvim                    | b58e2bfda5cea347c9d58b7f11cf3012c7b3953f |
| nvim-autopairs              | f158dcb865c36f72c92358f87787dab2c272eaf3 |
| nvim-cmp                    | ae644feb7b67bf1ce4260c231d1d4300b19c6f30 |
| nvim-dap                    | 90616ae6ae40053103dc66872886fc26b94c70c8 |
| nvim-dap-ui                 | 1c351e4e417d4691da12948b6ecf966936a56d28 |
| nvim-dap-virtual-text       | 3497eb39bf413a57ab5b7e7e2e192683e462148c |
| nvim-lspconfig              | f4fef355efa3c5d0813512480ee7b2c050b09fe4 |
| nvim-surround               | ec2dc7671067e0086cdf29c2f5df2dd909d5f71f |
| nvim-treesitter             | 20b5cbfa92cac93ab78f3fefeb6169e4ea303189 |
| nvim-treesitter-refactor    | d8b74fa87afc6a1e97b18da23e762efb032dc270 |
| nvim-treesitter-textobjects | bf8d2ad35d1d1a687eae6c065c3d524f7ab61b23 |
| nvim-web-devicons           | 26220156aafb198b2de6a4cf80c1b120a3768da0 |
| one-small-step-for-vimkind  | 0f0d5bc67786c36edc2cb6fb5faa5c09dd1a6e10 |
| persistence.nvim            | f6aad7dde7fcf54148ccfc5f622c6d5badd0cc3d |
| playground                  | ba48c6a62a280eefb7c85725b0915e021a1a0749 |
| plenary.nvim                | 2d9b06177a975543726ce5c73fca176cedbffe9d |
| rainbow-delimiters.nvim     | 5f73b24aeb94f5274c218955573153c69ce4d1ee |
| telescope-fzf-native.nvim   | cf48d4dfce44e0b9a2e19a008d6ec6ea6f01a83b |
| telescope.nvim              | 175178e3889c13a840f036d464aee2d145157b9e |
| todo-comments.nvim          | ae0a2afb47cf7395dc400e5dc4e05274bf4fb9e0 |
| tokyonight.nvim             | 817bb6ffff1b9ce72cdd45d9fcfa8c9cd1ad3839 |
| trouble.nvim                | 6efc446226679fda0547c0fd6a7892fd5f5b15d8 |
| which-key.nvim              | fb070344402cfc662299d9914f5546d840a22126 |

<!--plugin end-->
