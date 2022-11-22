vim.cmd('filetype plugin indent on') -- Turn on file type detection
vim.o.guifont = 'FiraMono Nerd Font Mono:h12'
vim.o.number = true
-- vim.o.loaded_perl_provider = false -- This is needed to stop errors in :checkhealth
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = '/Users/jonathanmilligan/.local/share/nvim/undodir'
vim.o.wrap = true -- Set soft word wrap
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.scrolloff = 8 -- Set scroll offset
vim.o.sidescrolloff = 8
vim.o.clipboard = 'unnamedplus' -- Set clipboard to use system clipboard
vim.o.cmdheight = 1 -- Keep the command height nice and low for more space
vim.o.colorcolumn = '99999'
-- vim.o.completeopt = { "menuone", "noselect" }
vim.o.conceallevel = 0 -- Turn off conceal
vim.o.fileencoding = 'utf-8'
-- vim.o.foldmethod = 'expr'
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()' -- Use Treesitter for folding
vim.cmd('autocmd BufReadPost,FileReadPost * normal zR') -- Open all folds by default
vim.o.hidden = true
vim.o.hlsearch = true -- Highlight all search matches
vim.o.ignorecase = true -- Ignore search case
vim.o.mouse = 'a' -- Enable mouse support
vim.o.pumheight = 10 -- Set popup menu height
vim.o.showmode = false
vim.o.showtabline = 2 -- Always show tabs
vim.o.smartcase = true
vim.o.smartindent = true -- Use smart indentation
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.o.termguicolors = true -- Get all the nice colors
vim.o.timeoutlen = 500 -- Set timeout length on commands
vim.o.title = true -- Set window title
vim.o.writebackup = false -- Live dangerously
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.cursorline = false -- Don't highlight the current line
vim.o.relativenumber = false -- Absolute numbers
vim.o.signcolumn = 'yes' -- Always show the sign column so it doesn't jump back and forth
vim.o.shadafile = '/Users/jonathanmilligan/.local/share/nvim/shada/main.shada'
vim.o.updatetime = 300
vim.o.thesaurus = '/Users/jonathanmilligan/.config/nvim/utils/thesaurii.txt' -- Get thesaurus word changes
vim.opt.shortmess:append('c')
vim.opt.shortmess:append('I')
vim.opt.whichwrap:append('<,>,[,],h,l')
vim.cmd('colorscheme tokyonight') -- Set my beautiful colorscheme
vim.o.confirm = true -- Confirm before quitting
