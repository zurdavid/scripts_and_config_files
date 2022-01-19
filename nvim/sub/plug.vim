call plug#begin('~/.config/nvim/plugged')
" color schemes
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
" status / tabline
Plug 'vim-airline/vim-airline'
" Plug 'nvim-lualine/lualine.nvim'
Plug 'wfxr/minimap.vim'

" helpers
Plug 'ggandor/lightspeed.nvim'
" Plug 'LunarWatcher/auto-pairs'
Plug 'preservim/vim-pencil'
Plug 'preservim/nerdcommenter'

" tmux
Plug 'preservim/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Language server
Plug 'neovim/nvim-lspconfig'
" LSP auto completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Asynchronous Lint Engine
Plug 'dense-analysis/ale' ", { 'on':  'ALEToggle' }

" Highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" fuzzy search
" telescope live_grep requires ripgrep
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" other (tpope vim-plug artist)
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-commentary'
" Plug 'preservim/nerdtree'

" Plug 'jackguo380/vim-lsp-cxx-highlight'
" markdown
Plug 'plasticboy/vim-markdown'
" Julia
Plug 'JuliaEditorSupport/julia-vim'
" Rust
Plug 'rust-lang/rust.vim'
" Latex
Plug 'lervag/vimtex'
" Python
Plug 'hanschen/vim-ipython-cell'

" unused plugins
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'ervandew/supertab'
" Plug 'tjdevries/vlog.nvim'
" Plug 'ThePrimeagen/vim-be-good'
call plug#end()

