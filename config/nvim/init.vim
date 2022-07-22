set nocompatible
set encoding=utf-8
set exrc
set secure
set history=500
set nu
set rnu
set incsearch
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set wildmenu
set hid
set lazyredraw
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set foldcolumn=1
set lbr
set tw=500
set ai
set si
set wrap
set splitbelow splitright

let g:python_recommended_style = 0

filetype plugin on
filetype indent on
syntax on

call plug#begin('~/.vim/plugged')
 
Plug 'kien/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex'
Plug 'mhinz/neovim-remote'
Plug 'nelsyeung/twig.vim'
Plug 'dolfly/plantuml'
Plug 'aklt/plantuml-syntax'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

call plug#end()

let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:tidal_target = "terminal"

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_progname = 'nvr'

inoremap <silent><expr> <tab>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<tab>" :
	\ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"


function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

set autoread

au BufRead,BufNewFile *.pow set filetype=pow

au FocusGained,BufEnter * checktime
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

au BufEnter,BufWinEnter,BufNewFile,BufRead *.sc,*.scd set filetype=supercollider
au Filetype supercollider packadd scvim

let g:syntastic_sh_shellcheck_args = "-x"

let mapleader = ","
let maplocalleader = ";"

nnoremap <leader>v :CHADopen<cr>

" quick save
nmap <leader>, :w!<cr>

" bash comment
nmap <leader>bc I# <esc>^
" c(ss) comment
nmap <leader>cc I/\* <esc>A\*/<esc>^
" haskell comment
nmap <leader>hc I-- <esc>^
" C comment
nmap <leader>cc I// <esc>^
"add empty line below
nmap <leader>b o<esc>k
"add empty line above
nmap <leader>a O<esc>j
nmap <leader>s :%sor<cr>

nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>paw :CocSearch <C-R>=expand("<cword>")<cr><cr>

" clear search
nmap <leader><space> :let @/ = ""<cr>

" navigate panes
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" navigate buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" navigate tabs
map <leader>n :tabnew<cr>
map <leader>j :tabnext<cr>
map <leader>k :tabprevious<cr>

" quick escape
inoremap jk <esc>

" move selected text
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" add new line at cursor
function! GetCharAtCursor()
    return getline('.')[col('.')-1]
endfunction

nnoremap <expr>K getline('.')[col('.')-1] == ' ' ? "r<cr>" : "i<cr><esc>"

" status line
highlight StatusLine ctermfg=232 ctermbg=240
highlight Todo cterm=bold ctermbg=52 ctermfg=0
highlight DiffText ctermbg=240 ctermfg=232

set ruler
set laststatus=2
set noshowmode
set noshowcmd

let g:currentmode={
  \ 'n'  : 'NORMAL',
  \ 'no' : 'N-OP-PENDING',
  \ 'i'  : 'INSERT',
  \ 'R'  : 'RPLACE',
  \ 'v'  : 'VISUAL',
  \ 'V'  : 'V-LINE',
  \ '' : 'V-BLOCK',
  \ 's'  : 'SELECT',
  \ 'S'  : 'S-LINE',
  \ '?'  : 'S-BLOCK',
  \ 'c'  : 'COMMAND',
  \ 'cv' : 'VIM-EX',
  \ 'ce' : 'EX',
  \ 'r'  : 'PROMPT',
  \ 'rm' : 'MORE',
  \ 'r?' : 'CONFIRM',
  \ '!'  : 'SHELL',
  \ 't'  : 'TERMINAL'
  \}

set statusline=%#Todo#
set statusline+=\ %{g:currentmode[mode()]} "MODE
set statusline+=\ 
set statusline+=%#DiffText#
set statusline+=\ %Y                       "FILE TYPE
set statusline+=\ 
set statusline+=%#StatusLine#
set statusline+=\ %t                       "FILENAME
set statusline+=\ %m                       "MODIFIED FLAG
set statusline+=\ 
set statusline+=%R                         "READ-ONLY FLAG
set statusline+=%=
" set statusline+=<%{GetCharAtCursor()}>
set statusline+=%k
set statusline+=\ %3l:%-2c                 "LINE:COL
set statusline+=\ %3p%%                    "PERCENTAGE

set shortmess=
set shortmess+=F
