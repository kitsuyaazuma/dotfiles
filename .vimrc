set number
set backspace=2

runtime! config/*.vim

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
" :CocInstall coc-go
" :CocCommand go.install.gopls
" :CocInstall coc-pyright
" :CocInstall coc-rust-analyzer

" https://github.com/rust-lang/rust.vim
Plug 'rust-lang/rust.vim'

" https://github.com/previm/previm
Plug 'kannokanno/previm'

" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'

" https://github.com/mattn/vim-goimports
Plug 'mattn/vim-goimports'

" https://github.com/lambdalisue/vim-fern
Plug 'lambdalisue/fern.vim'

" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" https://github.com/hashivim/vim-terraform
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

call plug#end()

let g:previm_open_cmd = 'open -a "Google Chrome"'

let g:rustfmt_autosave = 1

nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
let g:fern#default_hidden = 1

let g:airline#extensions#tabline#enabled = 1

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

call vundle#end()            " required
filetype plugin indent on    " required

