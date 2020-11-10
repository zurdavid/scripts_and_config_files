"if empty(glob('~/.locl/share/nvim/site/autoload/plug.vim'))
"  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
":endif

call plug#begin('~/.config/nvim/plugged')

" Plug 'kien/rainbow_parentheses.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'

" git wrapper
Plug 'tpope/vim-fugitive'  
Plug 'airblade/vim-gitgutter' 

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jackguo380/vim-lsp-cxx-highlight'

" markdown
Plug 'plasticboy/vim-markdown'

call plug#end()

syntax on

set expandtab
set shiftwidth=2
set number
set signcolumn=yes

set noswapfile
set undodir=~/.nvim/undodir
set undofile

set spell spelllang=en_us
set spellcapcheck=""

set path=$PWD/**

let g:ycm_confirm_extra_conf = 0

let g:airline_powerline_fonts=1
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0


set background=dark
"let g:gruvbox_contrast_light="hard"
"let g:gruvbox_italic=1
"let g:gruvbox_invert_signs=0
"let g:gruvbox_improved_strings=0
"let g:gruvbox_improved_warnings=1
"let g:gruvbox_undercurl=1
let g:gruvbox_transpararent_bg=1
let g:gruvbox_contrast_dark="medium"


colorscheme gruvbox
set termguicolors
" transparent background
" hi Normal guibg=NONE ctermbg=NONE

let g:vim_markdown_folding_disabled = 1

"coc.nvim
set updatetime=300

" always show signcolumns
set signcolumn=yes

" python
let g:python3_host_prog = '~/miniconda3/bin/python'

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

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

imap <F6> <Esc>:w<CR>:!python3 %<CR>
nmap <F6> :w<CR>:!python3 %<CR>
