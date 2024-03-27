vim.opt.langmap = 'hjklHJKLneioNEIO;neioNEIOhjklHJKL'
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

if vim.g.neovide then
  vim.o.guifont = 'Fira Code:h12'
  vim.g.neovide_transparency = 0.8
  vim.g.transparency = 0.0
end
