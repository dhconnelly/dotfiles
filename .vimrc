set nocompatible
filetype plugin indent on
syntax enable
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set ruler
set hlsearch
set incsearch
set relativenumber
set ignorecase
set smartcase

set directory=$HOME/.vim/swapfiles//

nnoremap <C-a> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
nnoremap ]q :cn<CR>
nnoremap [q :cp<CR>
