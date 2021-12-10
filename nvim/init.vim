"if empty(glob('~/.locl/share/nvim/site/autoload/plug.vim'))
"  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
":endif

" map leader to SPACE - needs to come first in order to work properly 
nnoremap <SPACE> <Nop>
let mapleader = " "

if exists('g:vscode')
  " finish
else
  source $HOME/.config/nvim/sub/plug.vim          " plugin loader
  source $HOME/.config/nvim/sub/theme.vim         " theme 
  source $HOME/.config/nvim/sub/functions.vim     " custom functions 
  source $HOME/.config/nvim/sub/plugins.vim       " plugin settings 

  " FILE BROWSER
  let g:netrw_banner=0                             " disable banner
  let g:netrw_browse_split=0
  let g:netrw_preview=1
  let g:netrw_altv=1                               " open splits to the right
  let g:netrw_winsize=85                           " size of new window in percent
  let g:netrw_liststyle=3                          " tree view
  "let g:netrw_list_hide=                          " hide stuff
endif

syntax on
filetype plugin indent on

set expandtab
set shiftwidth=2
set number
set signcolumn=yes                              "column with signs for git / errors
set scrolloff=7

set noswapfile
set undodir=~/.nvim/undodir
set undofile

set ignorecase                                  " needed by j
set smartcase                                   " ignore lower case when searching

set clipboard=unnamedplus                       " copy/past to/from clipboard
" set wildmenu

" spell checking
set nospell spelllang=de_de
nnoremap <silent> <F6> :set invspell<cr>
inoremap <silent> <F6> <C-O>:set invspell<cr>
"set spell spelllang=de_de,en_us
"set spellcapcheck=""

" fuzzy finding
set path=$PWD/**

let g:ycm_confirm_extra_conf = 0

let g:vim_markdown_folding_disabled = 1

"coc.nvim
set updatetime=300

" key mappings
nnoremap q :echo "recording unmapped"<cr> 
inoremap jk <Esc>
tnoremap jk <C-\><C-n>
" leave vmode
vnoremap <Leader><Leader> <Esc>
" indent
nnoremap <Tab> >>
vmap <Tab> >gv
nnoremap <S-Tab> <<
vmap <S-Tab> <gv
" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" next buffer
nnoremap bn :bNext<CR>
nnoremap bp :bprevious<CR>
nnoremap <Leader>pu :tabnext<CR>
nnoremap <Leader>pd :tabprevious<CR>
" source init.vim
nnoremap <leader>si :source $MYVIMRC<CR>
" remove highlight
map <leader>h :noh<CR>
" Resize buffer
nnoremap <silent> <C-Down> :resize +1<CR>
nnoremap <silent> <C-Up> :resize -1<CR>
nnoremap <silent> <C-Right> :vertical resize +1<CR>
nnoremap <silent> <C-Left> :vertical resize -1<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
" invoke formatter
nnoremap <Leader><C-I> ggvG3gq<C-o>
nnoremap <Leader><C-a> ggvG

" actions when saving
" remove trailing whitespace
autocmd FileType c,cpp,java,tex,julia,python,haskell autocmd BufWritePre <buffer> %s/\s\+$//e


nnoremap <Leader>vv :lua require"julia-run".select()<CR>y:lua require"julia-run".send()<CR>
nnoremap <Leader>vf :lua require"julia-run".try()<CR>
onoremap iu :<c-u>lua require"julia-run".select()<CR>
lua << EOF


-- vim.lsp.set_log_level("debug")

EOF

