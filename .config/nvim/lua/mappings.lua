require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.opt.langmap = 'hjklHJKLneioNEIO;neioNEIOhjklHJKL'

map({"t", "i"}, "<M-h>", "<C-\\><C-n><C-w>h")
map({"t", "i"}, "<M-j>", "<C-\\><C-n><C-w>j")
map({"t", "i"}, "<M-k>", "<C-\\><C-n><C-w>k")
map({"t", "i"}, "<M-l>", "<C-\\><C-n><C-w>l")
map({"t", "i"}, "<M-H>", "<C-\\><C-n><C-w>H")
map({"t", "i"}, "<M-J>", "<C-\\><C-n><C-w>J")
map({"t", "i"}, "<M-K>", "<C-\\><C-n><C-w>K")
map({"t", "i"}, "<M-L>", "<C-\\><C-n><C-w>L")
map("n", "<M-h>", "<C-w>h")
map("n", "<M-j>", "<C-w>j")
map("n", "<M-k>", "<C-w>k")
map("n", "<M-l>", "<C-w>l")
map("n", "<M-H>", "<C-w>H")
map("n", "<M-J>", "<C-w>J")
map("n", "<M-K>", "<C-w>K")
map("n", "<M-L>", "<C-w>L")
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
