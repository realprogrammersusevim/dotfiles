local opt = vim.o
local datapath = vim.fn.stdpath('data')
vim.cmd('filetype plugin on') -- Turn on file type detection
opt.guifont = 'JetBrainsMono Nerd Font Mono:13'
opt.number = true
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = datapath .. '/undodir'
opt.wrap = true -- Set soft word wrap
opt.linebreak = true
opt.breakindent = true
opt.scrolloff = 8 -- Set scroll offset
opt.sidescrolloff = 8
vim.api.nvim_set_option('mousescroll', 'hor:0')
-- opt.clipboard = 'unnamedplus' -- Set clipboard to use system clipboard
opt.cmdheight = 1 -- Keep the command height nice and low for more space
opt.conceallevel = 0 -- Turn off conceal
opt.fileencoding = 'utf-8'
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()' -- Use Treesitter for folding
opt.foldenable = false
opt.hidden = true
opt.hlsearch = true -- Highlight all search matches
opt.ignorecase = true -- Ignore search case
opt.mouse = 'nc'
opt.pumheight = 10 -- Set popup menu height
opt.showmode = false
opt.showtabline = 1 -- Show tabs when more than one
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
opt.shadafile = datapath .. '/shada/main.shada'
opt.updatetime = 300
opt.thesaurus = datapath .. '/utils/thesaurii.txt' -- Get thesaurus word changes
vim.opt.shortmess:append('c')
vim.opt.shortmess:append('I')
vim.opt.whichwrap:append('<,>,[,],h,l')
opt.confirm = true -- Confirm before quitting
vim.g.neovide_hide_mouse_when_typing = true
