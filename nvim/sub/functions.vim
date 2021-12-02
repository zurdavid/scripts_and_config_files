" GENERAL
function! ToggleLineNumber()
  if v:version > 703
    set norelativenumber!
  endif
  set nonumber!
endfunction
map <leader>r :call ToggleLineNumber()<CR>


" PROLOG using Vimux
command! PrologTest :call PrologTest()
function! PrologTest()
  call VimuxRunCommand('prolog_test')
endfunction
autocmd FileType prolog nnoremap <buffer> <Leader>rt :PrologTest<CR>


" HASKELL using Vimux
command! HaskellRun :call HaskellRun()
function! HaskellRun()
  call VimuxRunCommand('runhaskell ' . @%)
endfunction
autocmd FileType haskell nnoremap <buffer> <Leader>rr :HaskellRun<CR>

command! HaskellTest :call HaskellTest()
function! HaskellTest()
  call VimuxRunCommand('stack test')
endfunction
autocmd FileType haskell nnoremap <buffer> <Leader>rt :HaskellTest<CR>


