local opt = vim.o
vim.cmd('filetype plugin on') -- Turn on file type detection
opt.number = true
opt.swapfile = false
opt.backup = false
opt.wrap = true -- Set soft word wrap
opt.linebreak = true
opt.breakindent = true
opt.scrolloff = 8 -- Set scroll offset
opt.sidescrolloff = 8
opt.clipboard = 'unnamedplus' -- Set clipboard to use system clipboard
opt.cmdheight = 1 -- Keep the command height nice and low for more space
opt.colorcolumn = '99999'
opt.conceallevel = 0 -- Turn off conceal
opt.fileencoding = 'utf-8'
opt.foldmethod = 'expr'
opt.foldenable = false
opt.hidden = true
opt.hlsearch = true -- Highlight all search matches
opt.ignorecase = true -- Ignore search case
opt.mouse = '' -- Disable mouse support to break bad habits
opt.pumheight = 10 -- Set popup menu height
opt.showmode = false
opt.showtabline = 2 -- Always show tabs
opt.smartcase = true
opt.smartindent = true -- Use smart indentation
opt.splitbelow = true -- Horizontal splits will automatically be below
opt.splitright = true -- Vertical splits will automatically be to the right
opt.termguicolors = true -- Get all the nice colors
opt.timeoutlen = 500 -- Set timeout length on commands
opt.title = true -- Set window title
opt.writebackup = false -- Live dangerously
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 2
opt.tabstop = 2
opt.cursorline = false -- Don't highlight the current line
opt.relativenumber = true -- Try out relative numbers
opt.signcolumn = 'yes' -- Always show the sign column so it doesn't jump back and forth
opt.updatetime = 300
vim.opt.shortmess:append('c')
vim.opt.shortmess:append('I')
vim.opt.whichwrap:append('<,>,[,],h,l')
opt.confirm = true -- Confirm before quitting

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
