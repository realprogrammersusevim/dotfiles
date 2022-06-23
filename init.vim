" This is my NeoVim configuration for my Mac.
" It may suit you or it may not. Hopefully you find something useful in it
" that you can adapt to your own needs. Above all Vim is meant to be
" infinitally customizable, so it would be a shame to use someone else's
" config file if it didn't actually suit you. Adapt it to your own needs.


" Yes, yes, I know all of the hardcore touch typists will hate this. But it is
" useful.
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
Plug 'lukas-reineke/indent-blankline.nvim', Cond(!exists('g:vscode'))  " Show indentation
Plug 'Raimondi/delimitMate', Cond(!exists('g:vscode'))  " Auto quotation marks and bracket completion
Plug 'mikecoder/quickrun.vim', Cond(!exists('g:vscode'), { 'on': 'QuickRun' })  " Quickly run code without exiting Vim
Plug 'tmhedberg/SimpylFold', Cond(!exists('g:vscode'))  " Code folding
" Great code completion, if I start working with another programming language
" in Vim I'll just need to install another Coc plugin and add that language to
" the list coc will be loaded for
Plug 'neoclide/coc.nvim',  Cond(!exists('g:vscode'), {'branch': 'release', 'for': ['python', 'vim', 'rust']})
Plug 'sonph/onehalf', Cond(!exists('g:vscode'), { 'rtp': 'vim' })  " My theme
Plug 'preservim/nerdtree', Cond(!exists('g:vscode'), { 'on': 'NERDTree' })  " File browser and manager
Plug 'Xuyuanp/nerdtree-git-plugin', Cond(!exists('g:vscode'), {'on': 'NERDTree'})  " Show git changes in the Nerdtree
Plug 'dense-analysis/ale', Cond(!exists('g:vscode'))  " Asynchronous Code Linting, it's checking code
" while I type
Plug 'airblade/vim-gitgutter', Cond(!exists('g:vscode'))  " Show git changes in the gutter
Plug 'tpope/vim-fugitive', Cond(!exists('g:vscode'))  " A git interface so awesome it should be illegal
Plug 'tpope/vim-commentary'  " Easily comment out parts of code
Plug 'vim-airline/vim-airline', Cond(!exists('g:vscode')) " That nice little status bar at the bottow of
" the screen
Plug 'vim-airline/vim-airline-themes', Cond(!exists('g:vscode')) " Makes the bar match the theme
Plug 'wincent/terminus'  " Better cursor
Plug 'errata-ai/vale', {'for': ['text', 'markdown']}
Plug 'jose-elias-alvarez/null-ls.nvim', {'for': ['text', 'markdown']}  " Vale integration with Vim
Plug 'github/copilot.vim', Cond(!exists('g:vscode'))  " Code suggestions using GPT-3
Plug 'junegunn/fzf.vim', {'on': 'FZF'}  " Fuzzy file searching
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown', {'for': 'markdown'}  " Better markdown syntax highlighting
Plug 'dkarter/bullets.vim'  " Finally stopped typing out my own numbered lists
" like a fucking peasant
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }  " Markdown preview in the browser
Plug 'soywod/himalaya', Cond(!exists('g:vscode'), {'rtp': 'vim', 'on': 'Himalaya'})  " Email client
Plug 'mileszs/ack.vim', Cond(!exists('g:vscode'), {'on': 'Ack'})  " Search for things in files
Plug 'nvim-treesitter/nvim-treesitter', Cond(!exists('g:vscode'), {'do': ':TSUpdate'})	" Syntax highlighting
Plug 'nvim-lua/plenary.nvim', Cond(!exists('g:vscode'))  " Not sure what this does, but it's a requirement for telescope
Plug 'nvim-telescope/telescope.nvim', Cond(!exists('g:vscode'))  " A file explorer
Plug 'kyazdani42/nvim-web-devicons', Cond(!exists('g:vscode'))  " Web devicons
Plug 'rcarriga/nvim-notify', Cond(!exists('g:vscode'))  " Awesome GUI notifications
if has('nvim')
  function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction

  Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
else
  Plug 'gelguy/wilder.nvim'

  " To use Python remote plugin features in Vim, can be skipped
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" I believe this means that sytax highlighting is on which helps when you
" write code.
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
			\"rt": ["cargo run --release %"],
			\}

" Set up previewing with Simpyl Fold
let g:SimpylFold_docstring_preview = 1

" Make sure I'm always viewing my text documents in UTF-8 mode
set encoding=UTF-8

" Make undo history persistent between Vim sessions
set undofile

" Make sure the wrap doesn't cut midway through a word
set wrap linebreak nolist

" Ale config
let g:ale_fix_on_save = 1

" Set the Vim command memory to 200
set history=1000

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
set nobackup  " I live on the wild side
set nowritebackup
set completeopt=longest,menuone  " Automatically select the first autocomplete option
nmap <leader>rn <Plug>(coc-rename)

set rtp+=/opt/homebrew/opt/fzf " Hooray for fuzzy wuzzy ever so soft file completion!
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

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

if executable('ag')  " Use ag instead of ack for the backend search if it's available
  let g:ackprg = 'ag --vimgrep'
endif

let g:vim_markdown_folding_disabled = 1  " Disable Markdown folding

" Load my Lua customization for Lua only config options
luafile $HOME/.config/nvim/nvim_init.lua

set cursorline  " Highlight the current line

call wilder#setup({'modes': [':', '/', '?']})	" Setup wilder triggers

" Fuzzy command searching
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'language': 'python',
      \       'fuzzy': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern(),
      \       'sorter': wilder#python_difflib_sorter(),
      \       'engine': 're',
      \     }),
      \   ),
      \ ])

" Configure Wilder menu to show command completion in the status bar
call wilder#set_option('renderer', wilder#wildmenu_renderer(
      \ wilder#wildmenu_airline_theme({
      \   'highlights': {},
      \   'highlighter': wilder#basic_highlighter(),
      \   'separator': ' · ',
      \ })))
