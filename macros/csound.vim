" this file is part of csound-vim
" https://github.com/luisjure/csound
" Language:	csound	
" Maintainer:	luis jure <lj@eumus.edu.uy>
" License:	MIT
" Version:	2.1 
" Last Change:	2016-08-04

" function-key maps

" saves present file, compiles with flags in options, returns to vim
:noremap <F8> :up <CR> :!csound "%:p" <CR>
" saves present file, compiles and sends to audio output, returns to vim
:noremap <F9> :up <CR> :!csound -b4096 -B4096 -d -o devaudio "%:p" <CR> <CR>
" saves present file, compiles and writes output to file, returns to vim
:noremap <F10> :up <CR> :!csound -W -d -o "%:p:h/test.wav" "%:p" <CR> <CR>
" saves present file, compiles and writes output to file, stays in console (for debugging) 
:noremap <F11> :up <CR> :!csound -W -d -o "%:p:h/test.wav" "%:p" <CR>
" plays last compiled file
:noremap <F12> :!aplay "%:p:h/test.wav" <CR><CR>
