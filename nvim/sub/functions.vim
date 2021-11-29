command! PrologTest :call PrologTest()
function! PrologTest()
  call VimuxRunCommand('prolog_test')
endfunction
autocmd FileType pl nnoremap <buffer> <Leader>rt :PrologTest<CR>

