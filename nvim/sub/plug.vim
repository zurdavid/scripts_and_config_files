call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
" status / tabline
Plug 'vim-airline/vim-airline'

" tmux
Plug 'preservim/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" git wrapper
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jackguo380/vim-lsp-cxx-highlight'
" markdown
Plug 'plasticboy/vim-markdown'
" Julia
Plug 'JuliaEditorSupport/julia-vim'
" Rust
Plug 'rust-lang/rust.vim'
" Latex
Plug 'lervag/vimtex'

" unused plugins
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'ervandew/supertab'
call plug#end()


