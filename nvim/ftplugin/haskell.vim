setlocal formatprg=hindent

if !empty(glob('stack.yaml'))
  let g:ale_linters ={
      \   'haskell': [],
      \}
endif

" add signature -> then use code actions
nnoremap <Leader>as 0ywO<ESC>pA :: _<ESC>0
