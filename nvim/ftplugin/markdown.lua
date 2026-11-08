vim.opt_local.spell = true
vim.opt_local.spelllang = 'en_us'
vim.opt_local.textwidth = 80
vim.opt_local.softtabstop = 3 -- Works better for indenting markdown lists
vim.opt_local.shiftwidth = 3

local pandoc_preview = require('pandoc_preview')
vim.keymap.set('n', '<leader>pm', pandoc_preview.toggle, { buffer = true, desc = 'Toggle pandoc preview' })
vim.keymap.set('n', '<leader>pM', pandoc_preview.pdf, { buffer = true, desc = 'Pandoc PDF in sioyek' })
