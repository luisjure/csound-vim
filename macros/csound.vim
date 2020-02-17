" this file is part of csound-vim
" https://github.com/luisjure/csound-vim
" Language:	csound	
" Maintainer:	luis jure <lj@eumus.edu.uy>
" License:	MIT
" Last Change:	2018-08-23 10:11:31

" load macros from a file
let mycsound_macros=globpath(&rtp, "macros/mycsound_macros")
if filereadable(mycsound_macros)
   runtime! macros/mycsound_macros
else
   runtime! macros/csound_macros
endif
