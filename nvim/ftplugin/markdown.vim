nmap <Leader>so F-la~~<ESC>A~~<ESC>
nmap <Leader><Leader>c lbi`jkea`jk " enclose word in ``

" build notes in Vimux
command! BuildNotes :call BuildNotes()
function! BuildNotes()
  let b:projectroot = getcwd()
  if b:projectroot == '~/Documents/notes'
    call VimuxRunCommand('./compile.sh ' . @%)
  endif
endfunction
nnoremap <buffer> <Leader>rt :BuildNotes<CR>

autocmd BufWritePost <buffer> BuildNotes

