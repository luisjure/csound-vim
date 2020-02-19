" this file is part of csound-vim
" https://github.com/luisjure/csound-vim
" Language:	csound	
" Maintainer:	luis jure <lj@eumus.edu.uy>
" License:	MIT
" Last Change:	2020-02-19

" configure dictionary for autocompletion
au FileType csound execute 'setlocal dict=<sfile>:p:h:h/words/csound.txt'
au FileType csound execute 'setlocal complete+=k'
au FileType csound execute 'setlocal completeopt=longest,menuone'

" detect OS 
if !exists("g:os")
  if has("win32")
    let g:os = "Windows"
  elseif has("haiku")
    let g:os = "Haiku"
  elseif has("unix")
    if system('uname')=~?'Darwin'
      let g:os = "OSX"
    elseif system('uname')=~?'Linux'
      let g:os = "Linux"
    elseif system('uname')=~?'MINGW'
      let g:os = "Mingw"
    endif
  endif
endif

" open the manual page for the opcode under the cursor
function! OpenManual()
  if !exists ("g:csound_manual")
    let manual_dir = "http://csound.github.io/docs/manual/"
  else
    let manual_dir = resolve(expand(g:csound_manual)) 
  endif
  let opcode = expand("<cword>")
  let manual_page = manual_dir . "/" . opcode . ".html"
  if g:os == "Linux"
    execute "!xdg-open" manual_page "&"
  elseif g:os == "OSX"
    execute "!open" manual_page
  elseif g:os == "Windows"
    execute "!start cmd /c start" manual_page
  elseif g:os == "Mingw"
    execute "!start" manual_page
  elseif g:os == "Haiku"
    execute "!open" manual_page
  else
    echo "sorry, cannot detect your OS"
    echo "try setting the variable g:os in your .vimrc"
    echo 'valid strings are "Linux" "OSX" "Windows", "Mingw" and "Haiku"'
  endif
endfunction

" open the example csd for the opcode under the cursor
function! OpenExample()
  if exists ("g:csound_manual")
    let opcode = expand("<cword>")
    let examplecsd = resolve(expand(g:csound_manual)) . "/examples/" . opcode . ".csd"
    if filereadable(examplecsd)
  	  execute "tabnew | silent view" examplecsd
    else
  	  echo examplecsd "does not exist"
    endif
  else
    echo 'the variable g:csound_manual does not exist'
    echo 'set it in your .vimrc pointing to the html csound manual'
  endif
endfunction

noremap <F1> :call OpenManual()<CR><CR>
noremap <F2> :call OpenExample()<CR>
