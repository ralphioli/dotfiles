" Required settings
set nocompatible
set encoding=utf8

" Install vim-plug if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Set leader
let mapleader = ","
let maplocalleader = "."

" Load plugins
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'tomtom/tcomment_vim'
call plug#end()

" Use correct syntax highlighting
autocmd BufNewFile,BufRead *.njk set syntax=html

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
