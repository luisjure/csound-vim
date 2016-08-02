" this file is part of csound-vim
" https://github.com/luisjure/csound
" Language:	csound	
" Maintainer:	luis jure <lj@eumus.edu.uy>
" License:	MIT
" Last Change:	2016-07-31

" Vim syntax file

" clean syntax
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" csound is case sensitive
syntax case match

" set help program to vim help
set keywordprg=

" set fold method
set foldmethod=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load list of all opcodes from a file
runtime! syntax/csound_opcodes.vim

" csound opcodes and operators
syn match csOperator	"^"
syn match csOperator	"<<"
syn match csOperator	"<="
syn match csOperator	"<"
syn match csOperator	"=="
syn match csOperator	"="
syn match csOperator	">="
syn match csOperator	">>"
syn match csOperator	">"
syn match csOperator	"||"
syn match csOperator	"|"
syn match csOperator	"-" 
syn match csOperator	":" 
syn match csOperator	"!="
syn match csOperator	"?" 
syn match csOperator	"/"
syn match csOperator	"("
syn match csOperator	")"
syn match csOperator	"*" 
syn match csOperator	"&"
syn match csOperator	"&&"
syn match csOperator	"%" 
syn match csOperator	"+" 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" csd sections (with folding)
syn match	csdTags		"^\s*</*CsoundSynthesizer>"
syn region	csOptions	matchgroup=csdTags	start="<CsOptions>" end="</CsOptions>" fold transparent contains=CsComment
syn region	csVersion	matchgroup=csdTags	start="<CsVersion>" end="</CsVersion>" fold transparent contains=CsComment
syn region	csLicense	matchgroup=csdTags	start="<Cs\(Short\|\)License>" end="</Cs\(Short\|\)License>" fold transparent contains=CsComment
syn region	csFile	matchgroup=csdTags	start="<Cs\(File\|FileB\|MidifileB\|SampleB\)>" end="</Cs\(File\|FileB\|MidifileB\|SampleB\)>" fold transparent contains=CsComment
syn region	csInstruments	matchgroup=csdTags	start="<CsInstruments>" end="</CsInstruments>" fold transparent contains=ALLBUT,csScoStatement
syn region	csScore		matchgroup=csdTags	start="<CsScore>" end="</CsScore>" fold transparent contains=CsScoStatement,CsComment,CsString

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" header
syn keyword	csHeader	sr kr ar ksmps nchnls 0dbfs

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" local and global variables
syn	match	csVariable	"\<[akipSfw]\w\+\>"
syn	match	csVariable	"\<g[akipSfw]\w\+\>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" instruments and user-defined opcodes (with folding)
syn region	csInstrRegion	matchgroup=csInstrument	start="^\s*instr\>" end="^\s*endin\>" fold transparent
syn match	csInstrName	"\(^\s*instr\s\+\)\@<=\(\w\+,*\s*\)\+"

syn region	csOpcodeRegion	matchgroup=csInstrument	start="^\s*opcode\>" end="^\s*endop\>" fold transparent
syn match	csOpcodeName	"\(^\s*opcode\s\+\)\@<=\(\S\+\),"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" program flow control
syn keyword	CsConditional	cggoto cigoto ckgoto cngoto else elseif endif goto if igoto kgoto then tigoto timout
syn keyword	CsLoop	loop_ge loop_gt loop_le loop_lt until while do od
" label
syn match	csLabel	"^\s*\<\S\{-}:"
syn match	csLabel "\(\<\(goto\|igoto\|kgoto\|tigoto\|reinit\)\s\+\)\@<=\(\w\+\)"
syn match	csLabel	"\(\<\(cggoto\|cigoto\|ckgoto\|cngoto\)\s\+.\{-},\s*\)\@<=\(\w\+\)"
syn match	csLabel	"\(\<timout\s\+.\{-},\s*.\{-},\s*\)\@<=\(\w\+\)"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" defines
syn match	csMacro		+^\s*#\s*\<include\>\s\+.\{-}".\{-}"+
" define
syn region	csDefine	matchgroup=csMacro start="\(^\s*#\s*define\s\+\w\{-}\s\+\)\@<=#" end="#" fold transparent
syn match	csMacro		"^\s*#\(define\|undef\|ifdef\|ifndef\|else\|end\)"
syn match	csMacroName	"\(^\s*#\(define\|undef\|ifdef\|ifndef\)\s\+\)\@<=\(\w\+\)"
syn match	csMacroName	"$\w\{-}\.\{,1}\s"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" strings
syn match	csString        +".\{-}"+

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" comments
syn match	csComment	";.*$"
syn region	csComment	matchgroup=csComment	start="/\*" end="\*/" fold


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" score statements
syn match	csScoStatement	"^\s*f\s*\d\+"	" function tables
syn match	csScoStatement	"^\s*i\s*\d\+"	" numbered instrument
syn match	csScoStatement	+^\s*i\s*"[_a-zA-Z]\w*"+	" named instrument
syn match	csScoStatement	"^\s*[abemnrstvx]" " score events

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR DEFINITIONS
" Csound classes are linked to some of the default highlighting categories
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
hi link csConditional	Conditional
hi link csLoop	Repeat
hi link	csMacro 	Define
hi link	csMacroName	Label
hi link	csLabel 	Define
hi link	csString	String
hi link	csScoStatement  	Label

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
