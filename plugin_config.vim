" Colorscheme
" ===========
" This is the color scheme that's applied from the plugin I installed.
colorscheme nord

" QuickRun
" ========
let g:quickrun_known_file_types = {
			\"cpp": ["!g++ %", "./a.out"],
			\"c": ["!gcc %", "./a.out"],
			\"php": ["!php %"],
			\"vim": ["source %"],
			\"py": ["!python3 %"],
			\"rt": ["!cargo run --release %"],
			\"rs": ["!rustc %", "./a.out"],
			\"sh": ["!bash %"],
			\"js": ["!node %"],
			\"lisp": ["!clisp %"],
			\}

" Simpyl Fold
" ===========
let g:SimpylFold_docstring_preview = 1

" ALE
" ===
let g:ale_fix_on_save = 1

" Airline
" =======
set noshowmode
let g:airline_theme='deus'

" NERDTree
" ========
" Show hidden files by default with NERDTree
let NERDTreeShowHidden=1

" Conquer Of Completion
" =====================
set hidden  " TextEdit might fail without this setting
set nobackup  " I live on the wild side
set nowritebackup
set completeopt=longest,menuone  " Automatically select the first autocomplete option
nmap <leader>rn <Plug>(coc-rename)

" Vim Markdown
" ============
let g:vim_markdown_folding_disabled = 1  " Disable Markdown folding

" Wilder
" ======
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

" FZF
" ===
set rtp+=/opt/homebrew/opt/fzf " Hooray for fuzzy wuzzy ever so soft file completion!
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
