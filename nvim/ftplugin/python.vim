
let g:ale_python_pylint_options = '--disable=missing-docstring,empty-docstring'

call plug#begin('~/.config/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" coc-nvim 
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> üc <Plug>(coc-diagnostic-prev)
nmap <silent> ¨c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" python
let g:python3_host_prog = '~/miniconda3/bin/python'

" imap <F6> <Esc>:w<CR>:!python3 %<CR>
" nmap <F6> :w<CR>:!python3 %<CR>

