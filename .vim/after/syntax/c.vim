" Vim syntax file
" Language: C Additions
" Maintainer: b3rb 
" Description: My fork of octol's vim-cpp-enhanced-highlight
" URL: http://www.github.com/b3rb/vim-dotfiles/
" Last Change: 13 Jun 2019

" Functions
if !exists('g:cpp_no_function_highlight')
    syn match   cCustomParen    transparent "(" contains=cParen contains=cCppParen
    syn match   cCustomFunc     "\w\+\s*(\@="
    hi def link cCustomFunc  Function
endif

" Sets certain keywords to use a custom color
syn keyword cKeywords static const typedef unsigned
hi cKeywords ctermfg=green cterm=bold
