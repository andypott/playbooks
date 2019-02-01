" Use vim, not vi
set nocompatible

""""""""""""""""""""""""""""""
"Vim Plug
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'fatih/vim-go'
Plug 'bling/vim-airline'
Plug 'tikhomirov/vim-glsl'
Plug 'morhetz/gruvbox'
Plug 'w0rp/ale'
Plug 'shawncplus/phpcomplete.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug '/usr/share/vim/vimfiles/plugin/fzf.vim'
Plug 'junegunn/fzf.vim'

call plug#end()
filetype plugin indent on
" End of Vim Plug stuff
""""""""""""""""""""""""""""""
syntax on

if exists("+termguicolors")
    set termguicolors
endif

let mapleader=" "

set background=dark
" Make this silent so that we don't get an error message before it's installed
silent! colorscheme gruvbox
"Don't clear the background color
set t_ut=

set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set wildmenu
set wildmode=longest:full,full

" fzf.vim
nnoremap <leader>p :Files<CR>
nnoremap <leader>F :Rg 
nnoremap <leader>f :Rg<CR>
nnoremap <leader>m :History<CR>

"ALE
let g:ale_linters = {'javascript': ['tsserver']}
let g:ale_fixers = {'javascript': ['prettier']}
let g:ale_fix_on_save = 1
autocmd BufEnter *.go ALEDisable

"YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_rust_src_path = '/home/andy/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:ycm_goto_buffer_command = 'vertical-split'

"vim-go
autocmd FileType go nmap <leader>t <Plug>(go-test)<CR>
autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>d <Plug>(go-def)
autocmd FileType go nmap <leader>n <Plug>(go-rename)
"let g:go_auto_type_info = 1
"set updatetime=500
let g:go_fmt_command = "goimports"
"let g:go_highlight_types = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_fields = 1

" Airline
let g:airline_powerline_fonts = 0
set laststatus=2
set encoding=utf-8

" Rainbow Settings
let g:rainbow_active = 1

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

" Set swp file directory
set directory=~/.vim/swp//

set nobackup writebackup

" allow vim to open man pages
runtime ftplugin/man.vim

" Keep 5 lines at top/bottom of screen
set scrolloff=5
