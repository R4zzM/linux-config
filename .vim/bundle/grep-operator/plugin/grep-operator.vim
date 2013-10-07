function! s:GrepOperator(type)
  let saved_unnamed_register = @@

  if a:type ==# 'v'
    execute "normal! `<v`>y"
  elseif a:type ==# 'char' 
    execute "normal! `[v`]y"
  else 
    return
  end

  " echom shellescape(@@)
  silent execute "grep! -I -R " . shellescape(@@) . " ."
  copen

  let @@ = saved_unnamed_register
endfunction

nnoremap <leader>gr :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>gr :<c-u>call <SID>GrepOperator(visualmode())<cr>
