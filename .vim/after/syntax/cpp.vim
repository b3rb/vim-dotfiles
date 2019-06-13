" Vim syntax file
" Language: C++ Additions
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

" Class and namespace scope
if exists('g:cpp_class_scope_highlight') && g:cpp_class_scope_highlight
    syn match   cCustomScope    "::"
    syn match   cCustomClass    "\w\+\s*::"
                \ contains=cCustomScope
    hi def link cCustomClass Function
endif

" Class name declaration
if exists('g:cpp_class_decl_highlight') && g:cpp_class_decl_highlight
	syn match cCustomClassKey "\<class\>"
	hi def link cCustomClassKey cppStructure

	" Clear cppAccess entirely and redefine as matches
	syn clear cppAccess
	syn match cCustomAccessKey "\<private\>"
	syn match cCustomAccessKey "\<public\>"
	syn match cCustomAccessKey "\<protected\>"
	hi def link cCustomAccessKey cppAccess

	" Match the parts of a class declaration
	syn match cCustomClassName "\<class\_s\+\w\+\>"
				\ contains=cCustomClassKey
	syn match cCustomClassName "\<private\_s\+\w\+\>"
				\ contains=cCustomAccessKey
	syn match cCustomClassName "\<public\_s\+\w\+\>"
				\ contains=cCustomAccessKey
	syn match cCustomClassName "\<protected\_s\+\w\+\>"
				\ contains=cCustomAccessKey
	hi def link cCustomClassName Function
endif

" Sets certain keywords to use a custom color
syn keyword cKeywords static const unsigned
hi cKeywords ctermfg=green cterm=bold

" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
  if version < 508
    let did_cpp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink cppSTLbool         Boolean
  HiLink cppStorageClass    StorageClass
  HiLink cppStatement       Statement
  HiLink cppSTLfunction     Function
  HiLink cppSTLfunctional   Typedef
  HiLink cppSTLconstant     Constant
  HiLink cppSTLnamespace    Constant
  HiLink cppSTLtype         Typedef
  HiLink cppSTLexception    Exception
  HiLink cppSTLiterator     Typedef
  HiLink cppSTLiterator_tag Typedef
  HiLink cppSTLenum         Typedef
  HiLink cppSTLios          Function
  HiLink cppSTLcast         Statement " be consistent with official syntax
  HiLink cppRawString       String
  HiLink cppRawDelimiter    Delimiter
  delcommand HiLink
endif
