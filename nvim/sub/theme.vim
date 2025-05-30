" activate VS code color scheme
" colorscheme codedark
" let g:airline_theme = 'codedark'
" let g:airline_powerline_fonts=1

" let g:lightline = { 'colorscheme': 'deus', }

set background=dark

" let g:gruvbox_contrast_light="hard"
" let g:gruvbox_italic=1
" let g:gruvbox_invert_signs=0
" let g:gruvbox_improved_strings=0
" let g:gruvbox_improved_warnings=1
" let g:gruvbox_undercurl=1
" let g:gruvbox_transpararent_bg=1
" let g:gruvbox_contrast_dark="medium"
" colorscheme gruvbox
" colorscheme gruvbox-baby
" colorscheme gruvbox-material

" Important!!
if has('termguicolors')
  set termguicolors
endif
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
" For better performance
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_transparent_background = 2
colorscheme gruvbox-material

" transparent background
" set termguicolors
" highlight Normal guibg=NONE ctermbg=NONE
" highlight nonText guibg=NONE ctermbg=NONE
" highlight EndOfBuffer guibg=NONE ctermbg=NONE
" highlight LineNr guibg=NONE ctermbg=NONE
" highlight SignColumn guibg=NONE ctermbg=NONE

