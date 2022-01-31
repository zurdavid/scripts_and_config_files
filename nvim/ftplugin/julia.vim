" from Blue: a Style Guide for Julia
set tabstop=4       " Set tabstops to a width of four columns.
set softtabstop=4   " Determine the behaviour of TAB and BACKSPACE keys with expandtab.
set shiftwidth=4    " Determine the results of >>, <<, and ==.

setlocal expandtab       " Replace tabs with spaces.
setlocal textwidth=92    " Limit lines according to Julia's CONTRIBUTING guidelines.
setlocal colorcolumn=+1  " Highlight first column beyond the line limit.

" I need my plugin for this
nnoremap <Leader>vv :lua require"julia-run".select()<CR>y:lua require"julia-run".send()<CR>
onoremap iu :<c-u>lua require"julia-run".select()<CR>

