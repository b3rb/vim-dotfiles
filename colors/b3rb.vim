" vim: ts=2 sw=2 tw=0
" Vim Color File
" Author: b3rb
" Repository: https://www.github.com/b3rb/vim-dotfiles.git
" Last Change: 2019 June 07

hi clear
set background=dark
if exists("syntax on")
	syntax reset
endif
let g:colors_name = "b3rb"

hi Normal			ctermfg=white
hi Comment		ctermfg=cyan  			cterm=italic
hi Const			ctermfg=green				cterm=bold
hi Ignore 		ctermfg=black
hi PreProc		ctermfg=blue				cterm=bold
hi Statement	ctermfg=green 			cterm=bold
hi Special		ctermfg=red
hi Identifier ctermfg=green 			cterm=italic
hi Type 			ctermfg=yellow 			cterm=bold
hi Number 		ctermfg=magenta 		cterm=bold
hi Boolean 		ctermfg=magenta 		cterm=bold
hi String			ctermfg=darkmagenta
