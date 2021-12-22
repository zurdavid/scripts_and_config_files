setlocal formatprg=hindent

if !empty(glob('stack.yaml'))
  let g:ale_linters ={
      \   'haskell': [],
      \}
endif
