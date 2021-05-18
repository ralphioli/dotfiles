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
Plug 'Raimondi/delimitMate'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'chriskempson/base16-vim'
Plug 'daviesjamie/vim-base16-lightline'
call plug#end()

" Theming
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
let g:lightline = {'colorscheme': 'base16'}
set laststatus=2
set noshowmode

" Custom leader keys
let mapleader = ";"
let maplocalleader = ","

" Use space bar to fold
nnoremap <space> za

" Replace using gs
nnoremap gs :%s/
xnoremap gs :s/

" Copy to clipboard with Ctrl+C
xnoremap <C-c> :w !xclip -i -sel c<CR><CR>

" Nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=3
let NERDTreeShowBookmarks=1

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

" Mouse options
set ttymouse=xterm2
set mouse=a

" Misc settings
set title
set relativenumber " Use relative line numbers
set number         " Show current line number
hi Normal guibg=NONE
