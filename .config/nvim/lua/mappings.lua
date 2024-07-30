require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.opt.langmap = 'hjklHJKLneioNEIO;neioNEIOhjklHJKL'

map("n", "<M-h>", "<C-w>h")
map("n", "<M-j>", "<C-w>j")
map("n", "<M-k>", "<C-w>k")
map("n", "<M-l>", "<C-w>l")
-- local modes = {"n", "v", "s"}
--
-- local prefixes = {
-- "",
-- "<C-w>"
-- }
--
-- local swaps = {
-- n = "h",
-- e = "j",
-- i = "k",
-- o = "l",
-- N = "H",
-- E = "J",
-- I = "K",
-- O = "L",
-- }
--
-- for first, second in pairs(swaps) do
--     for _, pref in pairs(prefixes) do
--         local suf = ""
--         if pref[1] == "<" and not pref[-1] == ">" then suf = ">" end
--         map(modes, pref .. first .. suf, pref .. second .. suf)
--         map(modes, pref .. second .. suf, pref .. first .. suf)
--     end
-- end
--
-- map(modes, "<M-n>", "<C-w>h")
-- map(modes, "<M-e>", "<C-w>j")
-- map(modes, "<M-i>", "<C-w>k")
-- map(modes, "<M-o>", "<C-w>l")
