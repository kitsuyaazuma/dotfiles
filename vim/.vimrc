set number
set backspace=2
set guifont="Hack Nerd Font"
set encoding=UTF-8

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

" https://github.com/lambdalisue/vim-nerdfont
Plug 'lambdalisue/vim-nerdfont'

" https://github.com/lambdalisue/vim-fern-renderer-nerdfont
Plug 'lambdalisue/vim-fern-renderer-nerdfont'

" https://github.com/lambdalisue/vim-fern-git-status
Plug 'lambdalisue/vim-fern-git-status'

" https://github.com/lambdalisue/vim-glyph-palette
Plug 'lambdalisue/vim-glyph-palette'

" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" :CocInstall coc-go
" :CocCommand go.install.gopls
" :CocInstall coc-pyright
" :CocInstall coc-rust-analyzer
" :CocInstall coc-terraform

" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'

" https://github.com/previm/previm
Plug 'kannokanno/previm'

" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'

" https://github.com/mattn/vim-goimports
Plug 'mattn/vim-goimports'

" https://github.com/lambdalisue/vim-fern
Plug 'lambdalisue/fern.vim'
" https://github.com/yuki-yano/fern-preview.vim
Plug 'yuki-yano/fern-preview.vim'

" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" https://github.com/github/copilot.vim
Plug 'github/copilot.vim'
" :Copilot setup

" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

call plug#end()

let g:previm_open_cmd = 'open -a "Google Chrome"'

let g:rustfmt_autosave = 1

nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
let g:fern#default_hidden = 1
let g:fern#renderer = "nerdfont"

let g:airline#extensions#tabline#enabled = 1

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

