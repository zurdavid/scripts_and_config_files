nmap <Leader>so F-la~~<ESC>A~~<ESC>
nmap <Leader><Leader>c lbi`jkea`jk " enclose word in ``

lua << EOF
local function build_notes()
  if vim.fn.getcwd() == '/home/david/Documents/notes' then
    buf_name = vim.api.nvim_buf_get_name(0)
    vim.api.nvim_command('VimuxRunCommand "./compile.sh ' .. buf_name .. '"')
  end
end
vim.api.nvim_create_autocmd({ "BufWritePost" }, { callback = build_notes })

-- AutoSave
local autosave = require("autosave")

autosave.setup(
    {
        events = {"InsertLeave", "TextChanged"}, -- "TextChangedI"},
)
EOF
