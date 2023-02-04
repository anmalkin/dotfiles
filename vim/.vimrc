set nocompatible " not vi compatible

" -----------------
" Syntax and indent
" -----------------

syntax on " turn on syntax highlighting

"Color and airline tab settings
packadd! everforest 

if has ('termguicolors')
    set termguicolors
endif

set background=dark
let g:everforest_better_performance=1
colorscheme everforest 

let g:airline_theme='everforest'

filetype plugin indent on " enable file type detection

" Enable italics
highlight Comment cterm=italic
set t_ZH=[3m
set t_ZR=[23m

" --------------------
" Basic editing config
" --------------------

set number
set relativenumber
set linebreak
set showbreak=+++
set textwidth=100
set scrolloff=8
set wildmenu
set showmatch " show matching braces when text indicator is over them

" Search options
set hlsearch
set ignorecase
set smartcase
set incsearch

"Tab options
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set autoindent

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

" ------------
" Key mappings
" ------------

"  Toggle NerdTree directory
nnoremap <C-n> :NERDTreeToggle<CR>

" Move lines up and down
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

" Keep cursor in place
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv


" Set spacebar as leader key
let mapleader = " "

"Remove highlighting after search
nnoremap <Leader><space> :noh<cr>
