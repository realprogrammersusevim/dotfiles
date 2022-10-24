-- Turn on file type detection
vim.cmd('filetype plugin indent on')
vim.o.guifont = "FiraMono Nerd Font Mono:h12"
vim.o.number = true
vim.g.loaded_perl_provider = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = "/Users/jonathanmilligan/.local/share/nvim/undodir"
vim.o.wrap = true -- Set soft word wrap
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.scrolloff = 8 -- Set scroll offset
vim.o.sidescrolloff = 8
vim.o.clipboard = "unnamedplus" -- Set clipboard to use system clipboard
vim.o.cmdheight = 2 -- Set cmdheight for better status line
vim.o.colorcolumn = "99999"
-- vim.o.completeopt = { "menuone", "noselect" }
vim.o.conceallevel = 0
vim.o.fileencoding = "utf-8"
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd('autocmd BufReadPost,FileReadPost * normal zR')
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.mouse = "a"
vim.o.pumheight = 10
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.timeoutlen = 500
vim.o.title = true
vim.o.writebackup = false
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.cursorline = true
vim.o.relativenumber = false
vim.o.signcolumn = "yes"
vim.o.shadafile = "/Users/jonathanmilligan/.local/share/nvim/shada/main.shada"
vim.o.updatetime = 300
vim.opt.thesaurus = "/Users/jonathanmilligan/.config/nvim/mthesaur.txt"
vim.opt.shortmess:append("c")
vim.opt.shortmess:append("I")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.cmd('colorscheme tokyonight')
