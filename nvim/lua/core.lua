local opt = vim.o
local datapath = vim.fn.stdpath('data')

-- On Windows, pin the internal shell to cmd.exe regardless of which terminal
-- launched nvim. Launching from MSYS2/Git Bash exports $SHELL=/usr/bin/bash,
-- which makes nvim set 'shell' to bash but keep the cmd.exe-style 'shellcmdflag'
-- (/s /c), so every plugin that shells out fails with "bash: /s: No such file".
if vim.fn.has('win32') == 1 then
  opt.shell = 'cmd.exe'
  opt.shellcmdflag = '/s /c'
  opt.shellquote = ''
  opt.shellxquote = ''
end

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
opt.mousescroll = 'hor:0'
-- opt.clipboard = 'unnamedplus' -- Set clipboard to use system clipboard
opt.cmdheight = 1    -- Keep the command height nice and low for more space
opt.conceallevel = 0 -- Turn off conceal
opt.fileencoding = 'utf-8'
opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- Use Treesitter for folding
opt.foldlevel = 99
opt.foldenable = false
opt.hidden = true
opt.hlsearch = true      -- Highlight all search matches
opt.ignorecase = true    -- Ignore search case
opt.mouse = 'nc'
opt.pumheight = 10       -- Set popup menu height
opt.showmode = false
opt.showtabline = 1      -- Show tabs when more than one
opt.smartcase = true
opt.smartindent = true   -- Use smart indentation
opt.splitbelow = true    -- Horizontal splits will automatically be below
opt.splitright = true    -- Vertical splits will automatically be to the right
opt.termguicolors = true -- Get all the nice colors
opt.timeoutlen = 500     -- Set timeout length on commands
opt.title = true         -- Set window title
opt.writebackup = false  -- Live dangerously
opt.expandtab = true     -- Use spaces instead of tabs
opt.shiftwidth = 2
opt.tabstop = 2
opt.cursorline = false    -- Don't highlight the current line
opt.relativenumber = true -- Try out relative numbers
opt.signcolumn =
'yes'                     -- Always show the sign column so it doesn't jump back and forth
opt.shadafile = datapath .. '/shada/main.shada'
opt.updatetime = 300
opt.thesaurus = datapath .. '/utils/thesaurii.txt' -- Get thesaurus word changes
vim.opt.shortmess:append('c')
vim.opt.shortmess:append('I')
vim.opt.whichwrap:append('<,>,[,],h,l')
opt.confirm = true -- Confirm before quitting
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_cursor_short_animation_length = 0.04
vim.g.neovide_cursor_trail_size = 0.5
