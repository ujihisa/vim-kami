" $ mkdir ~/kami
" $ cp kami.vim ~/.vim/ftplugin/kami.vim
" or
" $ ln -s `pwd`/kami.vim ~/.vim/ftplugin/kami.vim

" FIXME: this function is a mock
function! s:create_file()
  let filename = "~/kami/" . escape(getline(1), '/')
  echo "create file"
endfunction

" FIXME: this function is a mock
function! s:rename_file_if_changed()
  let filename0 = "~/kami/" . escape(getline(1), '/')
  let filename1 = expand('%')
  if filename0 != filename1
    echo "filename changed"
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
