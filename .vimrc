" Go
filetype plugin indent on
set autowrite " autosave

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
let g:go_metalinter_autosave = 1 " vet, lint, errcheck on save

map <C-n> :cnext<CR> " next error
map <C-m> :cprevious<CR> " prev error

nnoremap <leader>a :cclose<CR> "\a to close quickfix window
" \b to build go file
autocmd FileType go nmap <leader>b  <Plug>(go-build)
" \r to run go file
autocmd FileType go nmap <leader>r  <Plug>(go-run)
" \t to test file
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" \c to coverage
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
" open test filest in split
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')

" autocomplete
set rtp+=~/.vim/bundle/YouCompleteMe
" no preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0

" snippet expansion
let g:UltiSnipsExpandTrigger="<c-j>"

" nerdtree
map <C-f> :NERDTreeToggle<CR>

" fuzzy search
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" airline
let g:airline_powerline_fonts = 1

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
set clipboard=unnamedplus
set showmatch
set mat=2
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set mouse=a "capture all mouse events

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

" theme
color pablo

" ff to escape
imap ff <Esc>
vmap ff <Esc>
" ctrl-d to dd in insert mode
imap <c-d> <Esc>ddi

