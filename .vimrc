"------------ theme ---------------

call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
call plug#end()

if (has("termguicolors"))
	 set termguicolors
endif
syntax on
colorscheme onedark

"------------- mappings -----------

:map ;; :w <Enter>

"-------------- general configs -------------

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set number
set enc=utf-8
set nowrap
