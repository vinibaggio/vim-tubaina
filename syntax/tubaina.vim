" Vim syntax file
" Language: Tubaína Markup file
" Author: Vinicius Baggio Fuentes (vinibaggio@gmail.com)

if exists("b:current_syntax")
  finish
endif

syn case ignore

syn include @rubyTop syntax/ruby.vim

syn match tubainaLineStart "^\s*" contained

syn keyword label ref
syn region tubainaKeyword start="\[.*" end="\]" keepend contains=tubainaKeywords
syn match tubainaKeyword "\[.*\]" contains=tubainaKeywords

syn region tubainaCodeBlock matchgroup=tubainaBlockOpen start="\[code.*\]" matchgroup=tubainaBlockClose end="\[/code\]" keepend contains=tubainaLineStart
syn region tubainaCodeRubyBlock matchgroup=tubainaBlockOpen start="\[code.*ruby.*\]" matchgroup=tubainaBlockClose end="\[/code\]" keepend contains=@rubyTop
syn region tubainaBoxBlock matchgroup=tubainaBoxOpen start="\[box.*\]" matchgroup=tubainaBoxClose end="\[/box\]" keepend contains=tubainaLineStart,tubainaInlineCode
syn region tubainaQuote start="\[quote" end="\]" keepend contains=tubainaLineStart

syn match tubainaTitle "\[section.*\]" contains=tubainaLineStart
syn match tubainaTitle "\[title.*\]" contains=tubainaLineStart
syn match tubainaTitle "\[chapter.*\]" contains=tubainaLineStart

syn match tubainaToDo "\[TODO.*\]" contains=tubainaLineStart

syn region tubainaListing matchgroup=tubainaBlockOpen start="\[list\]" matchgroup=tubainaBlockClose end="\[/list\]" contains=tubainaListItem

syn match tubainaListItem "\*" contains=tubainaLineStart contained

syn region tubainaItalic start="::" end="::" keepend
syn region tubainaBold start="\*\*" end="\*\*" keepend
syn region tubainaInlineCode start="%%" end="%%" keepend

hi def link tubainaTitle Identifier
hi def link tubainaToDo Comment
hi def link tubainaBlockOpen Function
hi def link tubainaBlockClose Function
hi def link tubainaBoxOpen Statement
hi def link tubainaBoxClose Statement
hi def link tubainaListItem Statement

hi def link tubainaItalic Underlined
hi def link tubainaBold String
hi def link tubainaInlineCode Float
hi def link tubainaQuote Macro
hi def link tubainaKeyword Type

let b:current_syntax = "tubaina"
