-- Thank God for the keymapping syntactic sugar introduced in 0.5.0
vim.g.mapleader = ' '

------------------------------
-- Insert mode               |
------------------------------

------------------------------
-- Normal mode               |
------------------------------
-- Better window movement (remember to do it silently)
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })

-- Resize with Option-arrow (MacOS)
vim.keymap.set('n', '<M-Up>', ':resize -2<CR>', { silent = true })
vim.keymap.set('n', '<M-Down>', ':resize +2<CR>', { silent = true })
vim.keymap.set('n', '<M-Left>', ':vertical resize -2<CR>', { silent = true })
vim.keymap.set('n', '<M-Right>', ':vertical resize +2<CR>', { silent = true })

-- Tab switch buffer
vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', { silent = true })

-- QuickFix
vim.keymap.set('n', ']q', ':cnext<CR>', { silent = true })
vim.keymap.set('n', '[q', ':cprev<CR>', { silent = true })
vim.keymap.set('n', '<C-q>', ':call QuickFixToggle()<CR>', { silent = true })

-- Move visually
vim.keymap.set('n', 'j', 'gj', { silent = true })
vim.keymap.set('n', 'gj', 'j', { silent = true })
vim.keymap.set('n', 'k', 'gk', { silent = true })
vim.keymap.set('n', 'gk', 'k', { silent = true })

------------------------------
-- Terminal mode             |
------------------------------
-- Terminal window navigation
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { silent = true })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { silent = true })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { silent = true })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { silent = true })

------------------------------
-- Visual mode	             |
------------------------------
-- Move selected line / block of text in visual mode
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv", { silent = true })
vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv", { silent = true })

------------------------------
-- Visual block mode         |
------------------------------
-- Move selected line / block of text in visual mode
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv", { silent = true })
vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv", { silent = true })

------------------------------
-- Exceptions for Mac        |
------------------------------
if vim.fn.has('mac') == 1 then
  vim.keymap.set('n', '<D-h>', '<C-w>h', { silent = true })
  vim.keymap.set('n', '<D-j>', '<C-w>j', { silent = true })
  vim.keymap.set('n', '<D-k>', '<C-w>k', { silent = true })
  vim.keymap.set('n', '<D-l>', '<C-w>l', { silent = true })
  vim.keymap.set('t', '<D-h>', '<C-\\><C-n><C-w>h', { silent = true })
  vim.keymap.set('t', '<D-j>', '<C-\\><C-n><C-w>j', { silent = true })
  vim.keymap.set('t', '<D-k>', '<C-\\><C-n><C-w>k', { silent = true })
  vim.keymap.set('t', '<D-l>', '<C-\\><C-n><C-w>l', { silent = true })
end
