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
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
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
