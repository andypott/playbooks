" Use vim, not vi
set nocompatible

""""""""""""""""""""""""""""""
"Vim Plug
call plug#begin('~/.vim/plugged')

"Plug 'Valloric/YouCompleteMe'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'fatih/vim-go'
Plug 'bling/vim-airline'
Plug 'tikhomirov/vim-glsl'
Plug 'morhetz/gruvbox'
"Plug 'w0rp/ale'
"Plug 'shawncplus/phpcomplete.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug '/usr/share/vim/vimfiles/plugin/fzf.vim'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" coc.nvim
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}



" fzf.vim
nnoremap <leader>p :Files<CR>
nnoremap <leader>F :Rg 
nnoremap <leader>f :Rg<CR>
nnoremap <leader>m :History<CR>

"ALE
"let g:ale_linters = {'javascript': ['tsserver']}
"let g:ale_fixers = {'javascript': ['prettier'], 'php': ['php_cs_fixer']}
"let g:ale_fix_on_save = 1
"autocmd BufEnter *.go ALEDisable

"YouCompleteMe
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_rust_src_path = '/home/andy/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
"let g:ycm_goto_buffer_command = 'vertical-split'

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
