local function prequire(...)
local status, lib = pcall(require, ...)
if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')
local cmp = prequire("cmp")

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
    if luasnip and luasnip.jumpable(1) then
        return t("<Plug>luasnip-expand-or-jump")
    else
        cmp.complete()
    end
    return ""
end

_G.s_tab_complete = function()
    if luasnip and luasnip.jumpable(-1) then
        return t("<Plug>luasnip-jump-prev")
    end
    return ""
end

local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node

luasnip.add_snippets("haskell", {
  -- trigger is fn.
  s("deq", {
    t("deriving(Eq, Show)"),
  }),
})

luasnip.add_snippets("cpp", {
  -- trigger is fn.
  s("fp", {
    t("fmt::print("),
  }),
})


vim.api.nvim_set_keymap("i", "<C-j>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-j>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-k>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-k>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
