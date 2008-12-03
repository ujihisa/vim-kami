" $ mkdir ~/kami
" $ cp kami.vim ~/.vim/ftplugin/kami.vim
" or
" $ ln -s `pwd`/kami.vim ~/.vim/ftplugin/kami.vim

if exists("b:did_kami_ftplugin")
  finish
endif
let b:did_kami_ftplugin = 1

" FIXME: this function is a mock
function! s:create_file()
  let filename = "~/kami/" . escape(getline(1), '/')
  echo "create file"
endfunction

" FIXME: this function is a mock
function! s:rename_file_if_changed()
  let new_filename = "~/kami/" . escape(getline(1), '/')
  let old_filename = expand('%')
  if new_filename != old_filename
    echo "filename changed"
    write new_filename
    call delete(old_filename)
  endif
endfunction

function! s:main()
  let existent_file_p = filereadable(expand('%'))
  if existent_file_p
    silent update
    call s:rename_file_if_changed()
  else
    call s:create_file()
  endif
endfunction

" CursorHold call main()
