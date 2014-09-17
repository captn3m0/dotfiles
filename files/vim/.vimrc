set nocompatible
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
syntax on
filetype on
set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set autoindent
set copyindent

set showmode
colorscheme zmrok  
set laststatus=2   " Always show the statusline
set cinkeys=0{,0},:,0#,!^F
set t_Co=256
inoremap jj <Esc>
" Folding Stuff
set foldenable
set foldcolumn=2
set foldmethod=marker
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

set nobackup
set noswapfile
set title
set visualbell
set noerrorbells
set showcmd

set relativenumber
let mapleader=","

"searching/moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"long lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

nnoremap j gj
nnoremap k gk

""F1-Esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; : 
au FocusLost * :wa

"Learn to use leader
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>ft Vatzf
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
nnoremap <leader>w <C-w>v<C-w>l


"Use Ctrl hjkl to move bw splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set hidden
set history=1000
set undolevels=1000

set pastetoggle=<F7>
nnoremap j gj
nnoremap k gk

cmap w!! w !sudo tee % >/dev/null
map <silent><F3> :NEXTCOLOR<cr>
map <silent><F2> :PREVCOLOR<cr>

" Open nerdtree if no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-t> :NERDTreeToggle<CR>

