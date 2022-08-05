call plug#begin()

Plug 'junegunn/vim-easy-align'  " Python alignment
Plug 'lukas-reineke/indent-blankline.nvim'  " Show indentation
Plug 'Raimondi/delimitMate'  " Auto quotation marks and bracket completion
Plug 'mikecoder/quickrun.vim', { 'on': 'QuickRun' }  " Quickly run code without exiting Vim
Plug 'tmhedberg/SimpylFold'  " Code folding
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
Plug 'ryanoasis/vim-devicons', Cond(!exists('g:vscode'))  " Icons and glyphs
Plug 'ajmwagar/vim-deus', Cond(!exists('g:vscode'))  " Deus colorscheme
Plug 'arcticicestudio/nord-vim', Cond(!exists('g:vscode'))  " Nord colorscheme
Plug 'vlime/vlime', Cond(!exists('g:vscode'), {'rtp': 'vim'})  " Lisp coding
Plug 'nvim-orgmode/orgmode', Cond(!exists('g:vscode'), {'rtp': 'vim'})  " Orgmode from Emacs

call plug#end()
