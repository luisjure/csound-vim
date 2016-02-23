" this file is part of the csound-vim plugin
" Language:	csound	
" Maintainer:	luis jure <lj@eumus.edu.uy>
" Version:	2.1 
" Last change:	2016-02-23

au BufNewFile,BufRead *.orc,*.sco,*.csd,*.udo   set filetype=csound
au BufNewFile		*.csd	0r <sfile>:p:h:h/templates/template.csd
au BufNewFile,BufRead	*.csd	runtime! macros/csound_macros.vim
