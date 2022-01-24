nmap <Leader>so F-la~~<ESC>A~~<ESC>
nmap <Leader><Leader>c lbi`jkea`jk " enclose word in ``

" build notes in Vimux
command! BuildNotes :call BuildNotes()
function! BuildNotes()
  call VimuxRunCommand('./compile.sh ' . @%)
endfunction
nnoremap <buffer> <Leader>rt :BuildNotes<CR>

autocmd BufWritePost <buffer> BuildNotes

