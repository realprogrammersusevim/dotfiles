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
| LuaSnip                     | f3b3d3446bcbfa62d638b1903ff00a78b2b730a1 |
| alpha-nvim                  | 1356b9ef31b985d541d94314f2cf73c61124bf1d |
| bullets.vim                 | d9a47f114031d3030b1e4de3c0b6a664b1201524 |
| cmp-nvim-lsp                | 5af77f54de1b16c34b23cba810150689a3a90312 |
| cmp-path                    | 91ff86cd9c29299a64f968ebb45846c485725f23 |
| cmp_luasnip                 | 05a9ab28b53f71d1aece421ef32fee2cb857a843 |
| copilot.lua                 | 03f825956ec49e550d07875d867ea6e7c4dc8c00 |
| dressing.nvim               | 6f212262061a2120e42da0d1e87326e8a41c0478 |
| friendly-snippets           | dbd45e9ba76d535e4cba88afa1b7aa43bb765336 |
| gitsigns.nvim               | 2c2463dbd82eddd7dbab881c3a62cfbfbe3c67ae |
| indent-blankline.nvim       | 821a7acd88587d966f7e464b0b3031dfe7f5680c |
| lazy.nvim                   | aedcd79811d491b60d0a6577a9c1701063c2a609 |
| lspkind.nvim                | 1735dd5a5054c1fb7feaf8e8658dbab925f4f0cf |
| lualine.nvim                | 7d131a8d3ba5016229e8a1d08bf8782acea98852 |
| mason-lspconfig.nvim        | 21d33d69a81f6351e5a5f49078b2e4f0075c8e73 |
| mason-nvim-dap.nvim         | 3614a39aae98ccd34124b072939d6283853b3dd2 |
| mason.nvim                  | c43eeb5614a09dc17c03a7fb49de2e05de203924 |
| mini.comment                | a4b7e46deb9ad2feb8902cc5dbf087eced112ee5 |
| neodev.nvim                 | b0ccf605c952eb0d1efe3692d5b241c52ceee187 |
| noice.nvim                  | bf67d70bd7265d075191e7812d8eb42b9791f737 |
| none-ls.nvim                | bb680d752cec37949faca7a1f509e2fe67ab418a |
| nui.nvim                    | c3c7fd618dcb5a89e443a2e1033e7d11fdb0596b |
| nvim-autopairs              | 90f824d37c0cb079d2764927e73af77faa9ba0ef |
| nvim-cmp                    | 04e0ca376d6abdbfc8b52180f8ea236cbfddf782 |
| nvim-dap                    | fc880e82059eb21c0fa896be60146e5f17680648 |
| nvim-dap-ui                 | 9720eb5fa2f41988e8770f973cd11b76dd568a5d |
| nvim-dap-virtual-text       | d4542ac257d3c7ee4131350db6179ae6340ce40b |
| nvim-lspconfig              | 6b9f4bbe0aa1f351fd4845dc5fd4f3450b010f88 |
| nvim-surround               | 703ec63aa798e5e07d309b35e42def34bebe0174 |
| nvim-treesitter             | 19bf991be2403c10fa379fa0fb11b7de2560ac31 |
| nvim-treesitter-refactor    | 65ad2eca822dfaec2a3603119ec3cc8826a7859e |
| nvim-treesitter-textobjects | 7f00d94543f1fd37cab2afa2e9a6cd54e1c6b9ef |
| nvim-web-devicons           | 14ac5887110b06b89a96881d534230dac3ed134d |
| one-small-step-for-vimkind  | aaee281bdaa3141d9d0cdb3dec468532da61124f |
| persistence.nvim            | 4982499c1636eac254b72923ab826ee7827b3084 |
| playground                  | ba48c6a62a280eefb7c85725b0915e021a1a0749 |
| plenary.nvim                | 4f71c0c4a196ceb656c824a70792f3df3ce6bb6d |
| telescope-fzf-native.nvim   | 6c921ca12321edaa773e324ef64ea301a1d0da62 |
| telescope.nvim              | b744cf59752aaa01561afb4223006de26f3836fd |
| todo-comments.nvim          | 833d8dd8b07eeda37a09e99460f72a02616935cb |
| tokyonight.nvim             | 610179f7f12db3d08540b6cc61434db2eaecbcff |
| trouble.nvim                | f1168feada93c0154ede4d1fe9183bf69bac54ea |
| which-key.nvim              | 4433e5ec9a507e5097571ed55c02ea9658fb268a |

<!--plugin end-->
