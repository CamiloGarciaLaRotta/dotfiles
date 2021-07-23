" General {{{
syntax on               " syntax highlighting
set ruler               " show line and column number in the airline footer
set number              " show line number on the left hand side
set wildmenu            " enable command autocomplete menu (when executing :cmds)
set clipboard=unnamed   " link the system's clipboard with vim's copy-paste register
set cursorline          " highlight the complete line where the cursor is
set mouse=a             " capture all mouse events
set encoding=utf-8
set fileencoding=utf-8

noremap s <Nop>  " s messes up with the <leader>sv
" edit .vimrc in a split window
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Allow backspace to delete indentation and inserted text
" i.e. how it works in most programs
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.
set backspace=indent,eol,start

" undo across vim sessions {{{

" create undo-dir if it does not exist
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif

set undodir=~/.vim/undo-dir
set undofile
" }}}

" }}}

" Windows {{{

" more natural window splits
" currently focuses window will stay on the top/left side
set splitbelow
set splitright

" just do <C-*> to move to either window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }}}

" Indentation {{{
set expandtab                       " insert spaces instead of tabs
set shiftwidth=2                    " number of spaces to put for indentation
set tabstop=2                       " number of spaces to put for tabs
set softtabstop=2                   " number of spaces to put for tabs in insert mode

set autoindent                      " copy indent from current line onto new line
set smartindent                     " smarter indentation for C-like languages
set wrap                            " wrap text when it goes beyond window view
set list listchars=tab:→\ ,trail:·  " show \ and · for tabs and spaces

" whenever a new filetype is recognized,
" load it's correspondent plugin and indentation
filetype plugin indent on

noremap <leader>= mmgg=G`mzz<cr>    " auto indent all file
" }}}

" Folding {{{
set foldmethod=indent   " fold based on indentation
set foldnestmax=10      " deepest fold is 10 levels
set foldlevel=1         " open files with all indentations >1 folded

augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Search {{{
set sel=inclusive   " include last character in the visual selection
set ignorecase      " case insensitive search
set smartcase       " if a combination of upper and lower case is used, case sensitive
set hlsearch        " highlight the search results
set incsearch       " show the matches as the word is typed (incrementally)
set magic           " grep notation

" fzf {{{

" runtime path (homebrew)
set rtp+=/usr/local/opt/fzf

" keep the popup in the bottom part of the screen
let g:fzf_layout = { 'down': '90%' }

" to search git tracked
nnoremap <Leader>f :GFiles<cr>
" to search all files
nnoremap <Leader>F :Files<cr>
" search open buffers
nnoremap <Leader>b :Buffers<cr>
" search buffer history
nnoremap <Leader>h :History<cr>
" to search word through project
nnoremap <Leader>/ :Rg<Space>

" }}}

" }}}

" Error sound & lights {{{
set noerrorbells      " no sound
set visualbell        " no visual flash
set t_vb=
set tm=500            " time for tooltip menu to popup
" }}}

" Abbreviations {{{
inoreabbrev :gg: 🎉
inoreabbrev :r: ❌
inoreabbrev :g: ✅
inoreabbrev eye 👀
inoreabbrev lod ಠ_ಠ
inoreabbrev sadface ʘ︵ʘ

inoreabbrev tdate <c-r>=strftime("%d-%m-%Y")<cr>
inoreabbrev @@ camilogarcialarotta@github.com
inoreabbrev hato Co-authored-by: foo <foo@github.com>

inoreabbrev lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla.<cr>
" }}}

" Linter {{{

" loop through next/previous errors
noremap <C-m> :ALEPreviousWrap<cr>
noremap <C-n> :ALENextWrap<cr>
" close quickfix window
nnoremap <leader>a :cclose<cr>


" user tab and stab to cycle through autocomplete
inoremap <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-TAB>"

let g:ale_sign_error = '◉'
let g:ale_sign_warning = '◉'
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1    " always show sign column, so text doesn't move around
let g:ale_completion_delay = 20
let g:ale_set_quickfix = 1

let g:ale_linters = {
            \ 'go': ['gopls'],
            \ }
highlight ALEError ctermbg=DarkMagenta
highlight ALEWarning ctermbg=DarkMagenta
" }}}

" Golang {{{

augroup filetype_go
  " ts - show existing tab with 4 spaces width
  " sw - when indenting with '>', use 4 spaces width
  " sts - control <tab> and <bs> keys to match tabstop
  autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4

  " use go-vim instead
  autocmd FileType go :ALEDisable


  " loop through next/previous errors
  autocmd FileType go nnoremap <C-n> :cnext<cr>
  autocmd FileType go nnoremap <C-m> :cprevious<cr>

  " build/run/test/coverate go file
  autocmd FileType go nmap <leader>b  <Plug>(go-build)
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)

  set foldlevel=3         " open files with all indentations >1 folded

  autocmd FileType go nnoremap gdq :GoDebugStop<CR>
  autocmd FileType go nnoremap gdd :GoDebugTestFunc<CR>
  autocmd FileType go nnoremap gdb :GoDebugBreakpoint<CR>
  autocmd FileType go nnoremap gds :GoDebugStep<CR>
  autocmd FileType go nnoremap gdn :GoDebugNext<CR>
  autocmd FileType go nnoremap gdo :GoDebugStepOut<CR>
  autocmd FileType go nnoremap gdc :GoDebugContinue<CR>
augroup END


  let g:go_debug_mappings = {
    \ '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
    \ '(go-debug-next)': {'key': 'n', 'arguments': '<nowait>'},
    \ '(go-debug-step)': {'key': 's'},
    \ '(go-debug-print)': {'key': 'p'},
  \}

let g:go_debug_windows = {
      \ 'vars':       'rightbelow 75vnew',
      \ 'stack':      'rightbelow 25new',
      \ 'out':        'botright 10new',
\ }

let g:go_version_warning = 0
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1         " display func signature when on top of it
let g:go_auto_sameids = 1           " highlight same var
let g:go_list_type = "quickfix"     " only quickfix, no location list windows

" syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1  " highlight Reader, Buffer, etc

let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_rename_command = 'gopls'
let g:go_gopls_complete_unimported = 1


let g:go_metalinter_enabled = []
let g:go_metalinter_autosave_enabled = []
let g:go_metalinter_deadline = "60s"
let g:go_metalinter_autosave = 1 " vet, lint, errcheck on save
let g:go_metalinter_command='golangci-lint'

" }}}

" Ruby {{{

augroup filetype_ruby
  " Use older regex engine, massively speeds ruby syntax highlighting
  autocmd Filetype ruby setlocal re=1

  " % is a shorthand to expand full filename
  " tt is a .zhsenv alias to 'rails test'
  autocmd Filetype ruby nnoremap <leader>t :!tt %<cr>
augroup END
" }}}

" Python {{{

augroup filetype_python
  " ts - show existing tab with 4 spaces width
  " sw - when indenting with '>', use 4 spaces width
  " sts - control <tab> and <bs> keys to match tabstop
  autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
augroup END
" }}}

" HTML {{{

augroup filetype_html
  " autocomplete HTML
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
augroup END
" }}}

" Autocompletion {{{

" don't show the preview window (bottom half) just show the dropdown
set completeopt-=preview
" }}}

" Airline {{{
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
" }}}

" Color Theme {{{
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
" }}}

" Useful mappings {{{

" ff to escape
inoremap ff <Esc>
vnoremap ff <Esc>

" replace curent selection
nnoremap <Leader>c :%s/\<<C-r><C-w>\>/
vnoremap <Leader>c "hy:%s/<C-r>h/

" Bubble single lines up and down
nnoremap - :.move +1<CR>==
nnoremap + :.move -2<CR>==
" Bubble lines up and down in visual mode
vnoremap + :move '<-2<CR>gv=gv
vnoremap - :move '>+1<CR>gv=gv

" enclose word with quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" comment selection
noremap <leader>\ :Commentary<cr>
" }}}

" Tags {{{

" location of tags file. This file is often generated by an git post-merge
" hook or shell config file (.zshenv, .bashrc) which calls 'ctags -R'
set tags=tags

" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" " Load all of the helptags now, after plugins have been loaded.
" " All messages and errors will be ignored.
silent! helptags ALL
" load helptags in /doc
helptags ~/.vim/doc
" }}}

" vipJ: join lines in paragraph
" I :   insert at the beginning of the line
" ():   sentence
" {}:   paragraph
