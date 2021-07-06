" Required settings
set nocompatible
set encoding=utf8

" Install vim-plug if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" PLUGINS
call plug#begin('~/.vim/plugged')

  " Snippets
  Plug 'SirVer/ultisnips'

  " Autocomplete
  Plug 'ycm-core/YouCompleteMe'

  " Language plugins
  Plug 'lervag/vimtex'
  Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'neovimhaskell/haskell-vim'

  " Code writing helpers
  Plug 'tomtom/tcomment_vim'
  Plug 'Raimondi/delimitMate'

  " Theming 
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'itchyny/lightline.vim'

  " Misc
  Plug 'preservim/nerdtree'
  Plug 'reedes/vim-pencil'
  Plug 'neomake/neomake'
  Plug 'voldikss/vim-floaterm'

call plug#end()

" Theming
set termguicolors
colorscheme dracula
let g:lightline = {'colorscheme': 'dracula'}
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

" Floaterm
let g:floaterm_keymap_toggle = '<F1>'

" Nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=3
let NERDTreeShowBookmarks=1

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="context"

" Pencil plugin
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#conceallevel = 0

" Python
au BufNewFile,BufRead *.py
      \ set foldmethod=indent |
      \ set foldlevel=99

" LaTeX word count function
function LatexWordCount()
  let f = expand("%")
  let cmd = "detex " . f . " | wc -w | tr -d '\n'"
  return system(cmd) . " words"
endfunction

" Plaintext word count
function TxtWordCount()
  let f = expand("%")
  let cmd = "wc -w < " . f . "| tr -d '\n'"
  return system(cmd) . " words"
endfunction

" LaTeX
let g:vimtex_fold_enabled=1
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
au BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex
au BufNewFile,BufRead *.tex
      \ set foldlevel=99 |
      \ call pencil#init() |
      \ nnoremap <localleader>w :echo LatexWordCount()<CR>

if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter *.tex let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" .txt
autocmd BufNewFile,BufRead *.txt
      \ call pencil#init() |
      \ nnoremap <localleader>w :echo TxtWordCount()<CR>

" Shell scripts
autocmd BufNewFile,BufRead *.sh
    \ call neomake#configure#automake('nrw')

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
