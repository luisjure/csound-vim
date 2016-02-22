" Vim syntax file
" Language:	csound	
" Maintainer:	luis jure <lj@eumus.edu.uy>
" Version:	3.1
" Last change:	2010-06-09 00:55:30

" clean syntax
syntax clear

" csound is case sensitive
syntax case match

" set help program to vim help
set keywordprg=

" set fold method
set foldmethod=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load list of all opcodes from a file
source	$VIM/vimfiles/syntax/csound_opcodes.vim

" csound opcodes and operators

syn match csOperator	"||"
syn match csOperator	"!="
syn match csOperator	"/"
syn match csOperator	"("
syn match csOperator	")"
syn match csOperator	"&&"
syn match csOperator	"<"
syn match csOperator	"<="
syn match csOperator	"="
syn match csOperator	"=="
syn match csOperator	">"
syn match csOperator	">="
syn match csOperator	"+" 
syn match csOperator	"*" 
syn match csOperator	"-" 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" csound header
syn keyword	csHeader	sr kr ar ksmps nchnls 0dbfs

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" csound local and global variables
syn	match	csVariable	"\<[akipSfw].\{-}\>"
syn	match	csVariable	"\<g[akiSfw].\{-}\>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" csound strings
syn match	csString        +".\{-}"+

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" csound defines
syn match	csMacro		+^\s*#\s*\<include\>\s\+.\{-}".\{-}"+
" define
syn region	csDefine	matchgroup=csMacro start="\(^\s*#\s*define\s\+\w\{-}\s\+\)\@<=#" end="#" fold transparent
syn match	csMacro		"^\s*#\(define\|undef\|ifdef\|ifndef\|else\|end\)"
syn match	csMacroName	"\(^\s*#\(define\|undef\|ifdef\|ifndef\)\s\+\)\@<=\(\w\+\)"
syn match	csMacroName	"$\w\{-}\.\{,1}\s"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" csd sections (with folding)
syn region	csOptions	matchgroup=csdTags	start="<CsOptions>" end="</CsOptions>" fold transparent
syn region	csInstruments	matchgroup=csdTags	start="<CsInstruments>" end="</CsInstruments>" fold transparent contains=ALLBUT,csScoStatements
syn region	csScore		matchgroup=csdTags	start="<CsScore>" end="</CsScore>" fold transparent contains=ALLBUT,csVariable,csOpcode
syn match	csdTags		"^\s*</*CsoundSynthesizer>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" csound instruments and user-defined opcodes (with folding)
syn region	csInstrRegion	matchgroup=csInstrument	start="^\s*instr\>" end="^\s*endin\>" fold transparent
syn match	csInstrName	"\(^\s*instr\s\+\)\@<=\(\w\+,*\s*\)\+"

syn region	csOpcodeRegion	matchgroup=csInstrument	start="^\s*opcode\>" end="^\s*endop\>" fold transparent
syn match	csOpcodeName	"\(^\s*opcode\s\+\)\@<=\(\S\+\),"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" csound label	
syn match	csLabel	"^\s*\<\S\{-}:"	

" score statements
syn match	csF	"^\s*f\s*\d\+"
syn match	csI	"^\s*i\s*\d\+"
syn match	csI	+\(^\s*i\s*\)\@<="+
syn match	csScoStatements	"^\s*[abemnrstvx]" contained


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" csound comments
syn match	csComment	";.*$"
syn region	csComment	matchgroup=csComment	start="/\*" end="\*/" fold


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR DEFINITIONS
" I link the Csound classes to some of the default highlighting categories
" defined in synload.vim:
   
hi link	csOpcode	Label
hi link	csOperator	Type
hi link	csHeader	Statement
hi link	csInstrument	Special
hi link	csInstrName	Label
hi link	csOpcodeName	Label
hi link	csVariable  	String
hi link	csdSection  	Label
hi link	csdTags  	Define
hi link	csComment	Comment
hi link	csMacro 	Define
hi link	csMacroName	Label
" hi link	PreProc 	Define
hi link	csLabel 	Define
hi link	csString	String

hi link	csF	  	String
hi link	csI	  	String
hi link	csScoStatements  	String

" to change the appearance you can either:
" 1. link to some other default methods (i. e. Constant, Identifier, etc.) 
" 2. change the color definition of these defaults in synload.vim
" 3. instead of linking to defaults, define your colours right here.
"    For example, you can try the following lines:

" hi csOpcode   	term=bold	ctermfg=darkred 	guifg=red	gui=bold
" hi csInstrument	term=bold	ctermfg=lightblue	guifg=blue	gui=bold
" hi csComment  	term=bold	ctermfg=darkgreen	guifg=#259025	gui=bold
" hi csdTags    	term=bold	ctermbg=blue     	guifg=blue	gui=bold
"
" You can easily change them to suit your preferences.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let b:current_syntax = "csound"
