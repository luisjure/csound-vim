" this file is part of csound-vim
" https://github.com/luisjure/csound
" Language:	csound	
" Maintainer:	luis jure <lj@eumus.edu.uy>
" License:	MIT
" Version:	2.1 
" Last Change:	2016-07-16

au BufNewFile,BufRead *.orc,*.sco,*.csd,*.udo   set filetype=csound
au BufNewFile		*.csd	0r <sfile>:p:h:h/templates/template.csd
au BufNewFile,BufRead	*.csd	runtime! macros/csound.vim

au FileType csound execute 'setlocal dict=<sfile>:p:h:h/words/csound.txt'
au FileType csound execute 'setlocal complete=k'
au FileType csound execute 'setlocal completeopt=longest,menuone'
