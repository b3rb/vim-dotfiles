" Vim syntax file
" Language: C++ Additions
" Maintainer: Jon Haggblad <jon@haeggblad.com>
" URL: http://www.haeggblad.com
" Last Change: 1 Feb 2018
" Version: 0.6
" Changelog:
"   0.1 - initial version.
"   0.2 - C++14
"   0.3 - Incorporate lastest changes from Mizuchi/STL-Syntax
"   0.4 - Add template function highlight
"   0.5 - Redo template function highlight to be more robust. Add options.
"   0.6 - more C++14, C++17, library concepts
"
" Additional Vim syntax highlighting for C++ (including C++11/14/17)
"
" This file contains additional syntax highlighting that I use for C++11/14
" development in Vim. Compared to the standard syntax highlighting for C++ it
" adds highlighting of (user defined) functions and the containers and types
" in the standard library / boost.
"
" Based on:
"   http://stackoverflow.com/q/736701
"   http://www.vim.org/scripts/script.php?script_id=4293
"   http://www.vim.org/scripts/script.php?script_id=2224
"   http://www.vim.org/scripts/script.php?script_id=1640
"   http://www.vim.org/scripts/script.php?script_id=3064


" -----------------------------------------------------------------------------
"  Highlight Class and Function names.
"
" Based on the discussion in: http://stackoverflow.com/q/736701
" -----------------------------------------------------------------------------

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

" Clear cppStructure and replace "class" and/or "template" with matches
" based on user configuration
let s:needs_cppstructure_match = 0
if exists('g:cpp_class_decl_highlight') && g:cpp_class_decl_highlight
	let s:needs_cppstructure_match += 1
endif
if exists('g:cpp_experimental_template_highlight') && g:cpp_experimental_template_highlight
	let s:needs_cppstructure_match += 2
endif

syn clear cppStructure
if s:needs_cppstructure_match == 0
	syn keyword cppStructure typename namespace template class
elseif s:needs_cppstructure_match == 1
	syn keyword cppStructure typename namespace template
elseif s:needs_cppstructure_match == 2
	syn keyword cppStructure typename namespace class
elseif s:needs_cppstructure_match == 3
	syn keyword cppStructure typename namespace
endif
unlet s:needs_cppstructure_match


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
" Template functions.
" Naive implementation that sorta works in most cases. Should correctly
" highlight everything in test/color2.cpp
if exists('g:cpp_experimental_simple_template_highlight') && g:cpp_experimental_simple_template_highlight
    syn region  cCustomAngleBrackets matchgroup=AngleBracketContents start="\v%(<operator\_s*)@<!%(%(\_i|template\_s*)@<=\<[<=]@!|\<@<!\<[[:space:]<=]@!)" end='>' contains=@cppSTLgroup,cppStructure,cType,cCustomClass,cCustomAngleBrackets,cNumbers
    syn match   cCustomBrack    "<\|>" contains=cCustomAngleBrackets
    syn match   cCustomTemplateFunc "\w\+\s*<.*>(\@=" contains=cCustomBrack,cCustomAngleBrackets
    hi def link cCustomTemplateFunc  Function

" Template functions (alternative faster parsing).
" More sophisticated implementation that should be faster but doesn't always
" correctly highlight inside template arguments. Should correctly
" highlight everything in test/color.cpp
elseif exists('g:cpp_experimental_template_highlight') && g:cpp_experimental_template_highlight

    syn match   cCustomAngleBracketStart "<\_[^;()]\{-}>" contained
                \ contains=cCustomAngleBracketStart,cCustomAngleBracketEnd
    hi def link cCustomAngleBracketStart  cCustomAngleBracketContent

    syn match   cCustomAngleBracketEnd ">\_[^<>;()]\{-}>" contained
                \ contains=cCustomAngleBracketEnd
    hi def link cCustomAngleBracketEnd  cCustomAngleBracketContent

    syn match cCustomTemplateFunc "\<\l\w*\s*<\_[^;()]\{-}>(\@="hs=s,he=e-1
                \ contains=cCustomAngleBracketStart
    hi def link cCustomTemplateFunc  cCustomFunc

    syn match    cCustomTemplateClass    "\<\w\+\s*<\_[^;()]\{-}>"
                \ contains=cCustomAngleBracketStart,cCustomTemplateFunc
    hi def link cCustomTemplateClass cCustomClass

    syn match   cCustomTemplate "\<template\>"
    hi def link cCustomTemplate  cppStructure
    syn match   cTemplateDeclare "\<template\_s*<\_[^;()]\{-}>"
                \ contains=cppStructure,cCustomTemplate,cCustomClassKey,cCustomAngleBracketStart

    " Remove 'operator' from cppOperator and use a custom match
    syn clear cppOperator
    syn keyword cppOperator typeid
    syn keyword cppOperator and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq

    syn match   cCustomOperator "\<operator\>"
    hi def link cCustomOperator  cppStructure
    syn match   cTemplateOperatorDeclare "\<operator\_s*<\_[^;()]\{-}>[<>]=\?"
                \ contains=cppOperator,cCustomOperator,cCustomAngleBracketStart
endif

if !exists("cpp_no_boost")
    syntax keyword cppSTLnamespace boost
    syntax keyword cppSTLcast lexical_cast
endif " boost


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
