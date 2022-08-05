" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
	packadd! matchit
endif
filetype plugin on

" I believe this means that sytax highlighting is on which helps when you
" write code.
syntax on

" Not completely sure what this does. I think it's making more colors
" available
set t_Co=256

" This makes sure that line numbers are always enabled when I open a file with
" vim.
set number

" Make sure I'm always viewing my text documents in UTF-8 mode
set encoding=UTF-8

" Make undo history persistent between Vim sessions
set undofile

" Make sure the wrap doesn't cut midway through a word
set wrap linebreak nolist

" Set the Vim command memory to 200
set history=1000

" Make sure Markdown lists and other stuff gets automatically indented
" correctly and doesn't wrap around bullet points
set autoindent

set incsearch  " Show search results in real time

" Clear the search highlighting after I'm done searching
nnoremap <silent> \ :noh<return>
let mapleader = ","

set splitright  " I prefer splitting right and below
set splitbelow

set scrolloff=3 " Keep three lines between the cursor and the edge of the screen

set signcolumn=yes  " Always show the sign column

set cursorline  " Highlight the current line

" Break myself of the habit of using the arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Down> <Nop>

" Always use the hjkl keys to move by display lines rather than real lines
noremap j gj
noremap gj j
noremap k gk
noremap gk k


" Yes, yes, I know all of the hardcore touch typists will hate this. But it is
" useful.
if has('mouse')
	set mouse=a
endif
