" --------------------------
" Plug-in manager (vim-plug)
" --------------------------

" Run :PlugInstall to install newly added plugins
" Run :PlugUpdate to install or update plugins
" Run :PlugClean to uninstall deleted plugins

call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'romainl/vim-cool'
Plug 'sainnhe/everforest'
call plug#end()  "Automatically executes filetype plugin indent on and syntax enable

" -----------------
" Syntax and theme
" -----------------

set termguicolors

set background=dark
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1

colorscheme everforest 

let g:airline_theme = 'everforest'

filetype plugin indent on " enable file type detection

" Powerline symbols in airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.dirty='⚡'
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
let g:airline#extensions#tabline#enabled = 1

" --------------------
" Basic editing config
" --------------------

set number
set relativenumber
set linebreak
set showbreak=+++
set textwidth=80
set scrolloff=8
set showmatch " show matching braces when text indicator is over them
set showtabline=2
set mouse=a
set hidden

" Search options
set hlsearch
set ignorecase
set smartcase
set incsearch

"Tab options
set shiftwidth=2
set autoindent
set smartindent
set smarttab
set softtabstop=2
set expandtab

" Mode cursor settings
let &t_SI.="\e[5 q" "SI = INSERT MODE
let &t_SR.="\e[4 q" "SR = REPLACE MODE
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

"Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" Makes mode changes faster
set ttimeout
set ttimeoutlen=1

set wildmenu   " Display all matching files when tab completing

" Open new split panes to right and bottom
set splitbelow
set splitright

" Set terminal window size
set termwinsize=10*0

" ------------
" Key mappings
" ------------

" Set spacebar as leader key
let mapleader=" "

" Git Gutter
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
nmap <leader>gp <Plug>(GitGutterPreviewHunk)
nmap <leader>gs <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
let g:gitgutter_map_keys = 0


" 'Worst place in the universe' - Primeagen
nnoremap Q <nop>

"  Toggle NerdTree directory
nnoremap <C-n> :NERDTreeToggle<CR>

" Move lines up and down using arrow keys
nnoremap <down> :m .+1<CR>==
nnoremap <up> :m .-2<CR>==
vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv

" Keep cursor in place
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Open fzf
nnoremap <C-p> :FZF<cr>

" Easy insertion of trailing ; from insert mode
imap ;; <Esc>A;<Esc>

" Show all open buffers in fzf
nnoremap <leader>b :Buffers<cr>

" Go to next buffer
nnoremap L :bnext<cr>
nnoremap H :bprevious<cr>

" Delete buffer without closing window
map <C-q> :bp<bar>sp<bar>bn<bar>bd<CR>

" Move between windows
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j

" Right-align comments to 80 column width. Place cursor at first character of
" comment string.
nnoremap <leader><tab> mc80A <esc>080lDgelD`cP`

