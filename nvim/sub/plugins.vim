" ALE - linter
nnoremap <silent> <Leader>ad :ALEDetail<cr>
let g:ale_sign_error = ''
let g:ale_sign_warning = ''


" Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "julia",
    "rust",
    "toml",
    "json",
    "yaml",
    "html",
  },
}
EOF


" fuzzy search
nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
lua << EOF
local actions = require('telescope.actions')require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF


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


