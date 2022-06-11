" This is my vimrc for my Mac.
" It may suit you or it may not. Hopefully you find something useful in it
" that you can adapt to your own needs. Above all Vim is meant to be
" infinitally customizable, so it would be a shame to use someone else's
" config file if it didn't actually suit you. Adapt it to your own needs.


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
filetype plugin on

" This function makes sure that if this config file is loaded by the VSCode
" neovim plugin than the plugins I won't need aren't loaded.
" I got it from https://github.com/vscode-neovim/vscode-neovim/issues/415
function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" This is my vim-plug section. To add something just say 'Plug' and then the
" link that follows github.com. The link has to be in single quotes. Then save
" the .vimrc file and quit vim. Reenter and put in the command ':PlugInstall'.
" From there you should be good to go.
call plug#begin()

Plug 'junegunn/vim-easy-align', Cond(!exists('g:vscode'))  " Python alignment
Plug 'yggdroot/indentline', Cond(!exists('g:vscode'))  " Correct Python identation
Plug 'nvie/vim-flake8',  Cond(!exists('g:vscode'), { 'for': 'python' })  " Python linting
Plug 'Raimondi/delimitMate', Cond(!exists('g:vscode'))  " Auto quotation marks and bracket completion
Plug 'davidhalter/jedi-vim', Cond(!exists('g:vscode'), { 'for': 'python' })  " Language server
Plug 'mikecoder/quickrun.vim', Cond(!exists('g:vscode'), { 'on': 'QuickRun' })  " Quickly run code without exiting Vim
Plug 'tmhedberg/SimpylFold', Cond(!exists('g:vscode'))  " Code folding
" Great code completion, if I start working with another programming language
" in Vim I'll just need to install another Coc plugin and add that language to
" the list coc will be loaded for
Plug 'neoclide/coc.nvim',  Cond(!exists('g:vscode'), {'branch': 'release', 'for': ['python', 'vim']})
Plug 'sonph/onehalf', Cond(!exists('g:vscode'), { 'rtp': 'vim' })  " My theme
Plug 'preservim/nerdtree', Cond(!exists('g:vscode'), { 'on': 'NERDTree' })  " File browser and manager
Plug 'Xuyuanp/nerdtree-git-plugin', Cond(!exists('g:vscode'), {'on': 'NERDTree'})  " Show git changes in the Nerdtree
Plug 'dense-analysis/ale', Cond(!exists('g:vscode'))  " Asynchronous Code Linting, it's checking code
" while I type
Plug 'airblade/vim-gitgutter', Cond(!exists('g:vscode'))  " Show git changes in the gutter
Plug 'tpope/vim-fugitive', Cond(!exists('g:vscode'))  " A git interface so awesome it should be illegal
Plug 'tpope/vim-commentary'  " Easily comment out parts of code
Plug 'mhinz/vim-startify', Cond(!exists('g:vscode'))  " Cool Vim start screen. Is it useful? Maybe. But
" why not?
Plug 'vim-airline/vim-airline', Cond(!exists('g:vscode')) " That nice little status bar at the bottow of
" the screen
Plug 'vim-airline/vim-airline-themes', Cond(!exists('g:vscode')) " Makes the bar match the theme
Plug 'sheerun/vim-polyglot', Cond(!exists('g:vscode'))  " Adds (hopefully) better syntax highlighting
Plug 'wincent/terminus'  " Better cursor
Plug 'errata-ai/vale', {'for': ['text', 'markdown']}
Plug 'jose-elias-alvarez/null-ls.nvim', {'for': ['text', 'markdown']}  " Vale integration with Vim
Plug 'github/copilot.vim', Cond(!exists('g:vscode'))  " Code suggestions using GPT-3
Plug 'junegunn/fzf.vim', {'on': 'FZF'}  " Fuzzy file searching
Plug 'gabrielelana/vim-markdown', {'for': 'markdown'}  " Better markdown syntax highlighting
Plug 'dkarter/bullets.vim'  " Finally stopped typing out my own numbered lists
" like a fucking peasant

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
set number

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

" Make undo history persistent between Vim sessions
set undofile

" Make sure the wrap doesn't cut midway through a word
set wrap linebreak nolist

" Vim command aliases
cmap tw tabnew

" Ale config
let g:ale_fix_on_save = 1

" Startify config
" This is the header that shows every time I open Vim. Pretty sweet if I do
" say so myself.
" Got it from asciiart.eu
let g:ascii = [
	\ '                    / \							',
	\ '                   / | \  Three Rings for the Elvin-Kings under the sky.	',
	\ '                  /  |  \ Seven for the DwarfLords in their halls of stone.	',
	\ '                 |   |   |    Nine for the Mortal Men doomed to die.		',
	\ '                 |   |   |    One for the Dark Lord on his dark throne.	',
	\ '                 |   |   |In the Land of Mordor where the Shadow Lies.	',
	\ '                 |   |   |							',
	\ '                 |   |   |  One Ring to rule them all,One Ring to find them,	',
	\ '                 |   |   |One Ring to bring them all and in the Darkness	',
	\ '                 |   |   |   Bind Them					',
	\ '                 |   |   |  In the Land of Mordor where the Shadows Lie.	',
	\ '                 |   |   |							',
	\ '                 |   |   |							',
	\ '                 |   |   |							',
	\ '                 |   |   |                        "Lord Of The Rings"	',
	\ '                 |   |   |                              by J.R.R. Tolkien	',
	\ '                 |   |   |							',
	\ '                 |   |   |							',
	\ '                 |   |   |							',
	\ '                 |   |   |							',
	\ '                 |   |   |                      .____---^^     ^^---____.	',
	\ '                 |   |   |                      TI      *       *      IT	',
	\ '                 |   |   |                      !I          *          I!	',
	\ '                 |  / \  |                       X                     X	',
	\ '/\               |/     \|               /\      XL         ?         JX	',
	\ '\ \_____________/         \_____________/ /      II    ?   / \   ?    II	',
	\ ' \______________\         /______________/       II   / \ /   \ / \   II	',
	\ '                 \       /                        X  /   v     v   \  X	',
	\ '                 |\\   //|                        ``/    _     _    \''	',
	\ '                 |//\ ///|                         \\- _-_ -_- _-_ -//	',
	\ '                 |///////|                           \\_-  -_-  -_//		',
	\ '                 |///////|                             ``       ''		',
	\ '                 |///////|                               ``-_-''		',
	\ '                 |///////|							',
	\ '                 |///////|							',
	\ '                 |///////|							',
	\ '                / \/\_/\/ \							',
	\ '               |\_/\/ \/\_/|							',
	\ '               |/ \/\ /\/ \|							',
	\ '                \_/\/_\/\_/							',
	\ '                  \_/_\_/							',
	\]
let g:startify_custom_header =
          \ 'startify#pad(g:ascii + startify#fortune#boxed())'

" Set the Vim command memory to 200
set history=200

" Airline configuration
set noshowmode
let g:airline_theme='deus'

" Show hidden files by default with NERDTree
let NERDTreeShowHidden=1

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

" COC Configuration
set hidden  " TextEdit might fail without this setting
set nobackup
set nowritebackup
set completeopt=longest,menuone  " Automatically select the first option

" Hooray for fuzzy wuzzy ever so soft file completion!
set rtp+=/opt/homebrew/opt/fzf

" Make sure Markdown lists and other stuff gets automatically indented
" correctly and doesn't wrap around bullet points
set autoindent

" Show search results in real time
set incsearch

" Bullets plugin config
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]  " Only allow Bullets to work on these filetypes
let g:bullet_line_spacing = 2  " One empty space between bullets

" Clear the search highlighting after I'm done searching
nnoremap <silent> \ :noh<return>
