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
| LuaSnip                     | 2737edc9e674e537dc0a97e3405658d57d2d31ed |
| alpha-nvim                  | bf3c8bb8c02ed3d9644cc5bbc48e2bdc39349cd7 |
| bullets.vim                 | 2253f970e54320dbd76fd6bb4f5a0bf2436ce232 |
| cmp-nvim-lsp                | 39e2eda76828d88b773cc27a3f61d2ad782c922d |
| cmp-path                    | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp_luasnip                 | 98d9cb5c2c38532bd9bdb481067b20fea8f32e90 |
| codecompanion.nvim          | 6329698f9f98f59da079e179c8b81f43d8692cba |
| copilot.lua                 | f8d8d872bb319f640d5177dad5fbf01f7a16d7d0 |
| dressing.nvim               | 6ef1ca479d37d4ff66f13eed44d08912caff483a |
| friendly-snippets           | de8fce94985873666bd9712ea3e49ee17aadb1ed |
| gitsigns.nvim               | 4daf7022f1481edf1e8fb9947df13bb07c18e89a |
| indent-blankline.nvim       | 04e44b09ee3ff189c69ab082edac1ef7ae2e256c |
| lazy.nvim                   | b1134ab82ee4279e31f7ddf7e34b2a99eb9b7bc9 |
| lspkind.nvim                | a700f1436d4a938b1a1a93c9962dc796afbaef4d |
| lualine.nvim                | ef3f2ee04140aeca037bdcabafab4339da4d5b5f |
| mason-lspconfig.nvim        | 4d0e5b49363cac187326998b96aa6a2884e0e89b |
| mason-nvim-dap.nvim         | 8b9363d83b5d779813cdd2819b8308651cec2a09 |
| mason.nvim                  | e2f7f9044ec30067bc11800a9e266664b88cda22 |
| mini.comment                | a56581c40c19fa26f2b39da72504398de3173c5a |
| nabla.nvim                  | 27a6ea9ed7452bb9e0b19eb0942b5bcf7d051b2f |
| neodev.nvim                 | 46aa467dca16cf3dfe27098042402066d2ae242d |
| noice.nvim                  | 4d48c360a19b3920a4041868530fd4b99919fa0c |
| none-ls.nvim                | dcc8cd4efdcb29275681a3c95786a816330dbca6 |
| nui.nvim                    | b58e2bfda5cea347c9d58b7f11cf3012c7b3953f |
| nvim-autopairs              | ee297f215e95a60b01fde33275cc3c820eddeebe |
| nvim-cmp                    | f17d9b4394027ff4442b298398dfcaab97e40c4f |
| nvim-dap                    | 8517126e9323e346f6a99b3b594c5a940b914dcd |
| nvim-dap-ui                 | ffa89839f97bad360e78428d5c740fdad9a0ff02 |
| nvim-dap-virtual-text       | 76d80c3d171224315b61c006502a1e30c213a9ab |
| nvim-lspconfig              | d01864641c6e43c681c3e9f6cf4745c75fdd9dcc |
| nvim-surround               | ec2dc7671067e0086cdf29c2f5df2dd909d5f71f |
| nvim-treesitter             | eab2005cb5a839abb4af9961a76bbf819650a1a9 |
| nvim-treesitter-refactor    | d8b74fa87afc6a1e97b18da23e762efb032dc270 |
| nvim-treesitter-textobjects | 3e450cd85243da99dc23ebbf14f9c70e9a0c26a4 |
| nvim-web-devicons           | 19d257cf889f79f4022163c3fbb5e08639077bd8 |
| one-small-step-for-vimkind  | ad065ad2c814249cfb9e344ce5b2b35d36fbc09f |
| persistence.nvim            | f6aad7dde7fcf54148ccfc5f622c6d5badd0cc3d |
| playground                  | ba48c6a62a280eefb7c85725b0915e021a1a0749 |
| plenary.nvim                | 2d9b06177a975543726ce5c73fca176cedbffe9d |
| rainbow-delimiters.nvim     | a25248a9e5cbfa117043f6740b10248dd596b576 |
| telescope-fzf-native.nvim   | cf48d4dfce44e0b9a2e19a008d6ec6ea6f01a83b |
| telescope.nvim              | 85922dde3767e01d42a08e750a773effbffaea3e |
| todo-comments.nvim          | ae0a2afb47cf7395dc400e5dc4e05274bf4fb9e0 |
| tokyonight.nvim             | ce91ba480070c95f40753e4663e32b4632ac6db3 |
| trouble.nvim                | 3dc00c0447c016cd43e03054c3d49436a1f2076d |
| twilight.nvim               | 1584c0b0a979b71fd86b18d302ba84e9aba85b1b |
| which-key.nvim              | 68e37e12913a66b60073906f5d3f14dee0de19f2 |

<!--plugin end-->
