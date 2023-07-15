" NERDComments
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" FUGITIVE
nnoremap <Leader>gs :G<CR>

" GITGUTTER
nnoremap <Leader>hl :GitGutterLineHighlightsToggle<CR>
nmap <LEADER>hn <Plug>(GitGutterNextHunk)
nmap <LEADER>hN <Plug>(GitGutterPrevHunk)
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=4
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃⎯'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed = "┃"

" MINIMAP
" let g:minimap_auto_start=1
" let g:minimap_auto_start_win_enter=1
let g:minimap_git_colors=1
let g:minimap_width=10
let g:minimap_block_filetypes=['fugitive', 'nerdtree', 'tagbar', 'fzf']
let g:minimap_close_filetypes=['startify', 'netrw', 'vim-plug']
autocmd FileType c,cpp,java,tex,julia,python,haskell,vim autocmd BufEnter <buffer> Minimap

" Bbye (Buffer Bye) for Vim
:nnoremap <Leader><Leader>q :Bdelete<CR>

" ALE - linter
nmap <silent> <Leader>ad <Plug>(ale_detail)
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
"let g:ale_list_window_size = 5
let g:ale_hover_to_floating_preview=1
" only lint on save
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" let g:ale_lint_on_enter = 0 " disable on opening
let g:ale_pattern_options = {'\.tex$': {'ale_enabled': 0}}

" fuzzy search
nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>
nnoremap <silent> <Leader>ss <cmd>Telescope live_grep<cr>
nnoremap <silent> <Leader>sg <cmd> Telescope git_status<cr>
nnoremap <silent> <Leader>sf <cmd> Telescope file_browser hidden=true no_ignore=true<cr><ESC>
nnoremap <silent> <Leader>b <cmd>Telescope buffers<cr><ESC>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

" vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {'build_dir': 'out'}
" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = " "


" vimux
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>


" vim-tmux-navigator
" free <C-l> in Netrw
nmap <leader><leader><leader><leader><leader><leader>l <Plug>NetrwRefresh


" VIMSLIME
let g:slime_target = "tmux"

luafile $HOME/.config/nvim/sub/luasnip.lua

" VIM-PENCIL
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,tex call pencil#init({'wrap': 'soft'})
augroup END
let g:pencil#conceallevel=0


" Luadev
map <leader><leader>ll <Plug>(Luadev-RunLine)
map <leader><leader>lr  <Plug>(Luadev-Run)
