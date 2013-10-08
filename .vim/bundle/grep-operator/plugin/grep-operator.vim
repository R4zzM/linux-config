function! s:GrepOperator(type)
  if !exists("g:grep_root")
    g:grep_root="."
  endif

  let saved_unnamed_register = @@

  if a:type ==# 'v'
    execute "normal! `<v`>y"
  elseif a:type ==# 'char' 
    execute "normal! `[v`]y"
  else 
    return
  end

  " echom shellescape(@@)
  silent execute "grep! -I -R " . shellescape(@@) . " " . g:grep_root
  copen

  let @@ = saved_unnamed_register
endfunction

nnoremap <leader>gr :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>gr :<c-u>call <SID>GrepOperator(visualmode())<cr>
