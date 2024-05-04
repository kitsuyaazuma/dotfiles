set number
set updatetime=250

"https://github.com/ku1ik/vim-monokai
syntax enable
colorscheme monokai

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

highlight! link SignColumn LineNr
set signcolumn=yes
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
highlight link GitGutterChangeLine DiffText
" let g:gitgutter_highlight_lines = 1

call plug#begin()

" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

call vundle#end()            " required
filetype plugin indent on    " required

