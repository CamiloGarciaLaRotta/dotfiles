" general
syntax on
set ruler
set number
set wildmenu
set clipboard=unnamedplus
set backspace=eol,start,indent
set showmatch
set mat=2
set cursorline
set relativenumber

" search
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
set foldcolumn=1
filetype plugin indent on
set ai
set si
set wrap

" no visual & sound errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" theme
set t_Co=256
set background=dark
let g:hybrid_reduced_contrast = 1
colorscheme hybrid