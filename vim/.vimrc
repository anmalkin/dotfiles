set nocompatible " not vi compatible

"------------------
" Syntax and indent
" -----------------

syntax on " turn on syntax highlighting

"Color and airline tab settings
packadd! onedark.vim

if has ('termguicolors')
    set termguicolors
endif

set background=dark
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=0
colorscheme onedark 

let g:airline_theme='onedark'

set showmatch " show matching braces when text indicator is over them
set autoindent
filetype plugin indent on " enable file type detection

" --------------------
" Basic editing config
" --------------------

set number
set relativenumber
set linebreak
set showbreak=+++
set textwidth=100
set scrolloff=8

" Search options
set hlsearch
set ignorecase
set smartcase
set incsearch

set laststatus=2

"Tab options
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

" Mode cursor settings
let &t_SI.="\e[5 q" "SI = INSERT MODE
let &t_SR.="\e[4 q" "SR = REPLACE MODE
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

" Makes mode changes faster
set ttimeout
set ttimeoutlen=1
set ttyfast

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" -----------
" Misc config
" -----------

" open new split panes to right and bottom
set splitbelow
set splitright
