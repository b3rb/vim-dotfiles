" ~/.vimrc by b3rb
"            _
"		  _   __(_)___ ___  __________
"	   | | / / / __ `__ \/ ___/ ___/
"	  _| |/ / / / / / / / /  / /__
"	 (_)___/_/_/ /_/ /_/_/   \___/
"
" Last edited July 21, 2019

" vim-plug 
call plug#begin()
Plug 'tpope/vim-fugitive'
call plug#end()

" Disables swap file creation
set noswapfile

" Improves vi
set nocompatible

" Set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Enables confirmation when exiting an unsaved file
set confirm

" Tab 
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Disables automatic text wrapping
set wrap!

" Automatically sets modeline variables
setglobal modeline

" Syntax highlighting/ colorscheme
colorscheme b3rb
set t_Co=16
syntax on
filetype indent plugin on

" Disables automatic comment continuation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Indentation
set autoindent
set smartindent
