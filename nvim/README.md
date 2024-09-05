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
| LuaSnip                     | 45db5addf8d0a201e1cf247cae4cdce605ad3768 |
| alpha-nvim                  | b6f4129302db197a7249e67a90de3f2b676de13e |
| bullets.vim                 | 2253f970e54320dbd76fd6bb4f5a0bf2436ce232 |
| cmp-nvim-lsp                | 39e2eda76828d88b773cc27a3f61d2ad782c922d |
| cmp-path                    | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp_luasnip                 | 05a9ab28b53f71d1aece421ef32fee2cb857a843 |
| copilot.lua                 | 86537b286f18783f8b67bccd78a4ef4345679625 |
| dressing.nvim               | c5775a888adbc50652cb370073fcfec963eca93e |
| friendly-snippets           | 00ebcaa159e817150bd83bfe2d51fa3b3377d5c4 |
| gitsigns.nvim               | 1ef74b546732f185d0f806860fa5404df7614f28 |
| indent-blankline.nvim       | 18603eb949eba08300799f64027af11ef922283f |
| lazy.nvim                   | 48b52b5cfcf8f88ed0aff8fde573a5cc20b1306d |
| lspkind.nvim                | cff4ae321a91ee3473a92ea1a8c637e3a9510aec |
| lualine.nvim                | b431d228b7bbcdaea818bdc3e25b8cdbe861f056 |
| mason-lspconfig.nvim        | 482350b050bd413931c2cdd4857443c3da7d57cb |
| mason-nvim-dap.nvim         | 8b9363d83b5d779813cdd2819b8308651cec2a09 |
| mason.nvim                  | e2f7f9044ec30067bc11800a9e266664b88cda22 |
| mini.comment                | 03c13e37318bdb18481311c0ac1adc9ed731caf1 |
| neodev.nvim                 | 46aa467dca16cf3dfe27098042402066d2ae242d |
| noice.nvim                  | 448bb9c524a7601035449210838e374a30153172 |
| none-ls.nvim                | 9b98991e15dce8fc502993e23caac2528b8b667f |
| nui.nvim                    | 61574ce6e60c815b0a0c4b5655b8486ba58089a1 |
| nvim-autopairs              | fd2badc24e675f947162a16c124d395bde80dbd6 |
| nvim-cmp                    | ae644feb7b67bf1ce4260c231d1d4300b19c6f30 |
| nvim-dap                    | 20a4859ebde1c9bc8e96f8cc11a20667e7fdd516 |
| nvim-dap-ui                 | 1c351e4e417d4691da12948b6ecf966936a56d28 |
| nvim-dap-virtual-text       | 484995d573c0f0563f6a66ebdd6c67b649489615 |
| nvim-lspconfig              | bdbc65aadc708ce528efb22bca5f82a7cca6b54d |
| nvim-surround               | ec2dc7671067e0086cdf29c2f5df2dd909d5f71f |
| nvim-treesitter             | bfe74a4899882a4ef45abb80813f14644a110a34 |
| nvim-treesitter-refactor    | 65ad2eca822dfaec2a3603119ec3cc8826a7859e |
| nvim-treesitter-textobjects | fe3deb7f67ce0cc4ebfe2ea6c1c7ae1c7a939d73 |
| nvim-web-devicons           | 3722e3d1fb5fe1896a104eb489e8f8651260b520 |
| one-small-step-for-vimkind  | 0f0d5bc67786c36edc2cb6fb5faa5c09dd1a6e10 |
| persistence.nvim            | f6aad7dde7fcf54148ccfc5f622c6d5badd0cc3d |
| playground                  | ba48c6a62a280eefb7c85725b0915e021a1a0749 |
| plenary.nvim                | ec289423a1693aeae6cd0d503bac2856af74edaa |
| telescope-fzf-native.nvim   | cf48d4dfce44e0b9a2e19a008d6ec6ea6f01a83b |
| telescope.nvim              | 5972437de807c3bc101565175da66a1aa4f8707a |
| todo-comments.nvim          | 319c01b99b7a8c9ac2066bf0efd4d6ec68fef444 |
| tokyonight.nvim             | 4b386e66a9599057587c30538d5e6192e3d1c181 |
| trouble.nvim                | 6efc446226679fda0547c0fd6a7892fd5f5b15d8 |
| which-key.nvim              | bfec3d6bc0a9b0b2cb11644642f78c2c3915eef0 |

<!--plugin end-->
