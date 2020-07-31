" folding
"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=2         "this is just what i use
" fzf for grep-search
set rtp+=/usr/local/opt/fzf
" \f to search git tracked
nmap <Leader>f :GFiles<CR>
" \F to search all files
nmap <Leader>F :Files<CR>
" \b search open buffers
nmap <Leader>b :Buffers<CR>
" \h search buffer history
nmap <Leader>h :History<CR>
" \t search tags in curr folder
nmap <Leader>t :BTags<CR>
" \T search tags accross project
nmap <Leader>T :Tags<CR>
" \/ to search word through project
nmap <Leader>/ :Rg<Space>

" Go
filetype plugin indent on
" set autowrite " autosave

autocmd FileType go :ALEDisable
map <C-m> :ALEPreviousWrap<cr> " next error for ale
map <C-n> :ALENextWrap<cr> " next error for ale
autocmd FileType go nmap <C-n> :cnext<CR> " next error for go-vim
autocmd FileType go nmap <C-m> :cprevious<CR> " prev error

nnoremap <leader>a :cclose<CR> "\a to close quickfix window

" \b to build go file
autocmd FileType go nmap <leader>b  <Plug>(go-build)
" \r to run go file
autocmd FileType go nmap <leader>r  <Plug>(go-run)
" \t to test file
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" \c to coverage
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

let g:go_version_warning = 0
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1 " display func signature when on top of it
let g:go_auto_sameids = 1   " highlight same var
let g:go_list_type = "quickfix" " only quickfix, no location list windows

" syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1 " highlight Reader, Buffer, etc

let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_rename_command = 'gopls'
let g:go_gopls_complete_unimported = 1

let g:go_metalinter_enabled = ['govet', 'golint', 'errcheck', 'gocyclo', 'deadcode', 'gosimple', 'staticcheck']
let g:go_metalinter_autosave_enabled = ['govet', 'golint', 'errcheck', 'gocyclo', 'deadcode', 'gosimple', 'staticcheck']
let g:go_metalinter_deadline = "60s"
let g:go_metalinter_autosave = 1 " vet, lint, errcheck on save
" let g:go_metalinter_command = 'golangci-lint run '

" autocomplete
set rtp+=~/.vim/bundle/YouCompleteMe
" no preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0

" fuzzy search
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" general
syntax on
set ruler
set number
set wildmenu
set clipboard=unnamed
set showmatch
set mat=2
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set mouse=a "capture all mouse events
" " Use older regex engine, massively speeds ruby syntax highlighting
autocmd Filetype ruby setlocal re=1

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
" ts - show existing tab with 4 spaces width
" sw - when indenting with '>', use 4 spaces width
" sts - control <tab> and <bs> keys to match tabstop

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.

" search
set sel=inclusive
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic

" indentation
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
filetype plugin indent on
set ai
set si
set wrap
set list listchars=tab:→\ ,trail:·

" error sound & lights
set noerrorbells
set visualbell
set t_vb=
set tm=500

" auto-indent
noremap <leader>= mmgg=G`mzz<CR>

" shortcut to replace
nnoremap <Leader>c :%s/\<<C-r><C-w>\>/
vnoremap <Leader>c "hy:%s/<C-r>h/

" % is a shorthand to expand full filename
map ,t :!tt %<CR>

" ff to escape
imap ff <Esc>
vmap ff <Esc>
" ctrl-d to dd in insert mode
imap <c-d> <Esc>ddi

" autocomplete HTML
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" rails
nnoremap <Plug>(rails-test) :Rails test<CR>
autocmd User Rails nmap <leader>t <Plug>(rails-test)

let g:ale_sign_error = '◉'
let g:ale_sign_warning = '◉'
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1 " always show sign column, so text doesn't move around
let g:ale_set_quickfix = 1

" commentary
noremap <leader>\ :Commentary<CR>

" theme
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
syntax on
set tags=tags

" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" " Load all of the helptags now, after plugins have been loaded.
" " All messages and errors will be ignored.
silent! helptags ALL

highlight ALEError ctermbg=DarkMagenta
highlight ALEWarning ctermbg=DarkMagenta
