au BufNewFile,BufRead *.orc,*.sco,*.csd,*.udo   set filetype=csound
au BufNewFile		*.csd	0r $VIM/vimfiles/templates/template.csd
au BufNewFile,BufRead	*.csd	so $VIM/vimfiles/macros/csound_macros.vim
