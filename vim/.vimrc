" Load pathogen plugin manager
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Indentation 
set expandtab    " Use spaces instead of tabs
set tabstop=2    " Make each tab 2 spaces long
set shiftwidth=2
set ai           " Set auto-indentation

" Line numbering
set relativenumber " Use relative line numbers
set number         " Show current line number

" vim-latex-live-preview config
let g:livepreview_previewer = 'xreader'
