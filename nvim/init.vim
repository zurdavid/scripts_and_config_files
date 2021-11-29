"if empty(glob('~/.locl/share/nvim/site/autoload/plug.vim'))
"  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
":endif

source $HOME/.config/nvim/sub/plug.vim      " plugin loader
source $HOME/.config/nvim/sub/theme.vim     " theme 
source $HOME/.config/nvim/sub/functions.vim  " custom functions 

syntax on
filetype plugin indent on

set expandtab
set shiftwidth=2
set number
set signcolumn=yes "column with signs for git / errors

set noswapfile
set undodir=~/.nvim/undodir
set undofile

" copy/past to/from clipboard
set clipboard=unnamedplus

" spell checking
set nospell spelllang=de_de
nnoremap <silent> <F6> :set invspell<cr>
inoremap <silent> <F6> <C-O>:set invspell<cr>
"set spell spelllang=de_de,en_us
"set spellcapcheck=""

set path=$PWD/**

let g:ycm_confirm_extra_conf = 0

let g:vim_markdown_folding_disabled = 1

"coc.nvim
set updatetime=300

" key mappings
let mapleader = "," " map leader to comma
inoremap jk <Esc>
tnoremap jk <C-\><C-n>
" vimux
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>


" actions when saving
" remove trailing whitespace
autocmd FileType c,cpp,java,tex,jl,hs autocmd BufWritePre <buffer> %s/\s\+$//e

" vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {'build_dir': 'out'}

" python
let g:python3_host_prog = '~/miniconda3/bin/python'

inoremap <expr> <Tiab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> üc <Plug>(coc-diagnostic-prev)
nmap <silent> ¨c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" imap <F6> <Esc>:w<CR>:!python3 %<CR>
" nmap <F6> :w<CR>:!python3 %<CR>
