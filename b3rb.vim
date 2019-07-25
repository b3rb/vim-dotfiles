" ~/.vim/colors/b3rb.vim
"      __   _____      __          _
"     / /_ |__  /_____/ /_  _   __(_)___ ___
"    / __ \ /_ </ ___/ __ \| | / / / __ `__ \
"   / /_/ /__/ / /  / /_/ /| |/ / / / / / / /
"  /_.___/____/_/  /_.___(_)___/_/_/ /_/ /_/
"
" Author: b3rb
" Repository: https://www.github.com/b3rb/vim-dotfiles
" Last Change: 2019 July 21

hi clear
set background=dark
if exists("syntax on")
	syntax reset
endif
let g:colors_name = "b3rb"

hi Normal		  	ctermfg=white
hi Comment	  	ctermfg=cyan
hi Const		  	ctermfg=green				cterm=bold
hi Ignore 	  	ctermfg=black
hi PreProc	  	ctermfg=blue				cterm=bold
hi Statement  	ctermfg=green 			cterm=bold
hi Special	  	ctermfg=red
hi Identifier   ctermfg=green 			cterm=italic
hi Type 		  	ctermfg=yellow 			cterm=bold
hi Number 	  	ctermfg=magenta 		cterm=bold
hi Boolean      ctermfg=magenta 		cterm=bold
hi String       ctermfg=darkmagenta
hi Function     ctermfg=green
hi EndOfBuffer  ctermfg=black

" Highlights functions in C and C++ files
au VimEnter *.c syn match cCustomFunc "\w\+\s*(\@="
au VimEnter *.h syn match cCustomFunc "\w\+\s*(\@="
au VimEnter *.cpp syn match cCustomFunc "\w\+\s*(\@="
au VimEnter *.hpp syn match cCustomFunc "\w\+\s*(\@="
hi def link cCustomFunc Function


" Highlight some C and C++ keywords in the const color
au VimEnter *.c syn keyword cKeywords static const typedef unsigned signed
au VimEnter *.h syn keyword cKeywords static const typedef unsigned signed
au VimEnter *.cpp syn keyword cKeywords static const typedef unsigned signed
au VimEnter *.hpp syn keyword cKeywords static const typedef unsigned signed
hi cKeywords ctermfg=green cterm=bold
 
" vim: ts=2 sw=2 tw=0
