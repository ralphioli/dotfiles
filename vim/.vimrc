" Required settings
set nocompatible
set encoding=utf8

" Install vim-plug if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'tomtom/tcomment_vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'neovimhaskell/haskell-vim'
Plug 'SirVer/ultisnips'
Plug 'preservim/nerdtree'
Plug 'joshdick/onedark.vim'
call plug#end()

" Theme settings
set termguicolors
colorscheme onedark

" Custom key bindings
  let mapleader = "\\"
  let maplocalleader = ","
  " Use space bar to fold
  nnoremap <space> za
  " Replace using gs
  nnoremap gs :%s/
  xnoremap gs :s/
  nnoremap <C-n> :NERDTreeToggle<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="context"

" Python
au BufNewFile,BufRead *.py
      \ set foldmethod=indent |
      \ set foldlevel=99

" LaTeX
let g:vimtex_fold_enabled=1
au BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex
au BufNewFile,BufRead *.tex
      \ set foldlevel=99 |
      \ command C echo system("detex " . expand("%") . " | wc -w | tr -d [:space:]") . " words"

" Misc syntax highlighting
autocmd BufNewFile,BufRead *.njk set syntax=html
autocmd BufNewFile,BufRead *.y set syntax=happy
autocmd BufNewFile,BufRead *.x set syntax=alex

" Indentation settings
set expandtab      " Use spaces instead of tabs
set tabstop=2      " Make each tab 2 spaces long
set shiftwidth=2
set autoindent
filetype plugin indent on

" Misc settings
set title
set mouse=a
set relativenumber " Use relative line numbers
set number         " Show current line number
