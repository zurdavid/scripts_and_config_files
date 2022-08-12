let g:ale_python_pylint_options = '--disable=missing-docstring,empty-docstring'

" python
let g:python3_host_prog = '~/Apps/miniforge3/envs/ml/bin/python'

" imap <F6> <Esc>:w<CR>:!python3 %<CR>
" nmap <F6> :w<CR>:!python3 %<CR>
"
" requires following packages
" neovim
" ipython
" probably ipython-cells

nnoremap <Leader>jjk :IPythonCellExecuteCellVerboseJump<cr>
nnoremap <Leader>jk :IPythonCellExecuteCellVerbose<cr>
nnoremap <Leader>vo :IPythonCellInsertBelow<cr>
nnoremap <Leader>vO :IPythonCellInsertAbove<cr>
nnoremap <Leader>vn :IPythonCellNextCell<cr>
nnoremap <Leader>vN :IPythonCellPrevCell<cr>
