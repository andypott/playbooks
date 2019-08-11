" Use vim, not vi
set nocompatible

syntax on

let mapleader=" "

set background=dark
"Don't clear the background color
set t_ut=

set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set wildmenu
set wildmode=longest:full,full

autocmd FileType javascript,css,scheme,lua setlocal shiftwidth=2 softtabstop=2
autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=8 tabstop=8
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType php setlocal smartindent

" Disable arrow keys in normal mode, to force the use of hjkl
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> :bprevious<CR>
noremap <Right> :bnext<CR>
"use jj to get back to normal mode
inoremap jj <esc>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :lclose<CR>

nnoremap <leader>j :cn<CR>
nnoremap <leader>k :cp<CR>

" Open splits on the right hand side
set splitright

set nobackup writebackup

" Keep 5 lines at top/bottom of screen
set scrolloff=5
