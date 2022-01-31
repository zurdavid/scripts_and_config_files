" NERDComments
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" FUGITIVE
nnoremap <Leader>gs :G<CR>

" GITGUTTER
nnoremap <Leader>hl :GitGutterLineHighlightsToggle<CR>
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=4
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃⎯'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed = "┃"

" AUTO-PAIRS
let g:AutoPairsCompleteOnlyOnSpace=1
let g:AutoPairsShortcutToggleMultilineClose=''

" MINIMAP
" let g:minimap_auto_start=1
" let g:minimap_auto_start_win_enter=1
let g:minimap_git_colors=1
let g:minimap_width=10
let g:minimap_block_filetypes=['fugitive', 'nerdtree', 'tagbar', 'fzf', 'TelescopePrompt']
let g:minimap_close_filetypes=['startify', 'netrw', 'vim-plug', 'TelescopePrompt']
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

" TREESITTER
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {"haskell"},
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
    "python",
  },
}
EOF


" fuzzy search
nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>
nnoremap <silent> <Leader>ss <cmd>Telescope live_grep<cr>
nnoremap <silent> <Leader>sg <cmd> Telescope git_status<cr>
nnoremap <silent> <Leader>sf <cmd> Telescope file_browser hidden=true no_ignore=true<cr><ESC>
nnoremap <silent> <Leader>b <cmd>Telescope buffers<cr><ESC>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
lua << EOF
require("telescope").load_extension "file_browser"
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


" VIMSLIME
let g:slime_target = "tmux"

" " coc-nvim
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" " Use `[c` and `]c` to navigate diagnostics
" nmap <silent> üc <Plug>(coc-diagnostic-prev)
" nmap <silent> ¨c <Plug>(coc-diagnostic-next)
" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" function! s:show_documentation()
  " if (index(['vim','help'], &filetype) >= 0)
    " execute 'h '.expand('<cword>')
  " else
    " call CocAction('doHover')
  " endif
" endfunction


lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<Leader><C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'rust_analyzer', 'rls', 'julials', 'hls', 'clangd' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

require('lspconfig').texlab.setup{
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    texlab = {
      auxDirectory = './out'
    }
  }
}

------
-- cmp
------
local cmp = require('cmp')

cmp.setup({
  snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
	if not entry then
	  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
	end
	cmp.confirm()
      else
        fallback()
      end
    end, {"i","s","c",}),
  },

  -- specify *installed* sources, order mathers
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
})

cmp.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' }
  }
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

require("luasnip/loaders/from_vscode").load({
  paths = './plugged/friendly-snippets'
})
-- vim.lsp.set_log_level("debug")
EOF

luafile $HOME/.config/nvim/sub/luasnip.lua

" VIM-PENCIL
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,tex call pencil#init({'wrap': 'soft'})
augroup END
let g:pencil#conceallevel=0
