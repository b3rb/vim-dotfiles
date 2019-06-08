" ~/.vimrc by b3rb
"            _
"		  _   __(_)___ ___  __________
"	   | | / / / __ `__ \/ ___/ ___/
"	  _| |/ / / / / / / / /  / /__
"	 (_)___/_/_/ /_/ /_/_/   \___/
"
" Last edited June 08, 2019

" vim-plug 
call plug#begin()
Plug 'tpope/vim-fugitive'
call plug#end()

" Disables swap file creation
set noswapfile

" Improves vi
set nocompatible

" Enables confirmation when exiting an unsaved file
set confirm

" Tab 
set tabstop=2
set shiftwidth=2

" Disables automatic text wrapping
set tw=0

" Enables mouse input
set mouse=a

" Automatically sets modeline variables
setglobal modeline

" Syntax highlighting/ colorscheme
set t_Co=16
colorscheme b3rb
syntax on
filetype indent plugin on
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

" Disables automatic comment continuation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Hide tildes on blank lines
hi EndOfBuffer ctermbg=black ctermfg=black

" Indentation
set autoindent
set smartindent
