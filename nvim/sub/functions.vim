command! PrologTest :call PrologTest()
function! PrologTest()
  call VimuxRunCommand('prolog_test')
endfunction
autocmd FileType prolog nnoremap <buffer> <Leader>rt :PrologTest<CR>

