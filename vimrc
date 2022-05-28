if v:progname =~? "evim"
	finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
	au!

	" For all text files set 'textwidth' to 78 characters.
	autocmd FileType text setlocal textwidth=78
augroup END

if has('mouse')
	set mouse=a
endif

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
	packadd! matchit
endif

" This is my vim-plug section. To add something just say 'Plug' and then the
" link that follows github.com. The link has to be in single quotes. Then save
" the .vimrc file and quit vim. Reenter and put in the command ':PlugInstall'.
" From there you should be good to go.
call plug#begin()

Plug 'junegunn/vim-easy-align'  " Python alignment
Plug 'yggdroot/indentline'  " Correct Python identation
Plug 'nvie/vim-flake8'  " Python linting
Plug 'Raimondi/delimitMate'  " Auto quotation marks and bracket completion
Plug 'davidhalter/jedi-vim', { 'for': 'python'}  " Language server
Plug 'mikecoder/quickrun.vim'  " Quickly run code without exiting Vim
Plug 'tmhedberg/SimpylFold'  " Code folding
Plug 'Valloric/YouCompleteMe'  " Code completion
Plug 'sonph/onehalf', { 'rtp': 'vim' }  " My theme
Plug 'preservim/nerdtree'  " File browser and manager
Plug 'Xuyuanp/nerdtree-git-plugin'  " Show git changes in the Nerdtree
Plug 'Chiel92/vim-autoformat'  " Automatically format code on save (replaced by ALE?)
Plug 'dense-analysis/ale'  " Asynchronous Code Linting, it's checking code while I type
Plug 'kien/ctrlp.vim'  " Fuzzy searching in Vim
Plug 'airblade/vim-gitgutter'  " Show git changes in the gutter
Plug 'tpope/vim-fugitive'  " A git interface so awesome it should be illegal
Plug 'tpope/vim-commentary'  " Easily comment out parts of code
Plug 'mhinz/vim-startify'  " Cool Vim start screen. Is it useful? No. But why not?

call plug#end()

" I believe this means that sytax highlighting is on which helps when you
" write code.
let python_highlight_all=1
syntax on

" This is the color scheme that's applied from the plugin I installed.
colorscheme onehalfdark

" Not completely sure what this does. I think it's making more colors
" available
set t_Co=256

" This makes sure that line numbers are always enabled when I open a file with
" vim.
:set number

" Get rid of those annoying swap and backup files by moving them.
set backupdir=.backup/,~/.backup?,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

" Configure the QuickRun plugin
let g:quickrun_known_file_types = {
			\"cpp": ["!g++ %", "./a.out"],
			\"c": ["!gcc %", "./a.out"],
			\"php": ["!php %"],
			\"vim": ["source %"],
			\"py": ["!python3 %"],
			\}

" Set up previewing with Simpyl Fold
let g:SimpylFold_docstring_preview = 1

" Make sure I'm always viewing my text documents in UTF-8 mode
set encoding=UTF-8

" Autoformat Python code when a file is saved
au BufWrite *.py :Autoformat

" Make undo history persistent between Vim sessions
set undofile

" Make sure the wrap doesn't cut midway through a word
:set wrap linebreak nolist

" Vim command aliases
cmap tw tabnew

" Make sure Vim saves to the system clipboard
set clipboard=unnamed

" Ale config
let g:ale_fix_on_save = 1
