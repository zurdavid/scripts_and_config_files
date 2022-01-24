nmap <Leader>so F-la~~<ESC>A~~<ESC>

" build notes in Vimux
command! BuildNotes :call BuildNotes()
function! BuildNotes()
  call VimuxRunCommand('./compile.sh ' . @%)
endfunction
nnoremap <buffer> <Leader>rt :BuildNotes<CR>

autocmd BufWritePost <buffer> BuildNotes
