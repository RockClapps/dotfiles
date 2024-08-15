vim.opt.langmap="hjklHJKLneioNEIO;neioNEIOhjklHJKL"
vim.keymap.set("n", ";", ":")
vim.keymap.set({"t", "i"}, "<A-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set({"t", "i"}, "<A-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set({"t", "i"}, "<A-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set({"t", "i"}, "<A-l>", "<C-\\><C-N><C-w>l")
vim.keymap.set({"t", "i"}, "<A-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set({"t", "i"}, "<A-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set({"t", "i"}, "<A-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set({"t", "i"}, "<A-l>", "<C-\\><C-N><C-w>l")
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")
vim.keymap.set("n", "<A-H>", "<C-w>H")
vim.keymap.set("n", "<A-J>", "<C-w>J")
vim.keymap.set("n", "<A-K>", "<C-w>K")
vim.keymap.set("n", "<A-L>", "<C-w>L")
vim.opt.startofline=true
vim.opt.cdhome=true
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.breakindent=true
vim.opt.autoread=true
vim.opt.scrolloff=2
vim.opt.sidescroll=16
vim.opt.sidescrolloff=2
vim.opt.number=true
vim.opt.clipboard="unnamedplus"
vim.opt.undofile=true
vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab=true
vim.opt.smartindent=true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      'nvim-treesitter/nvim-treesitter',
      version = "*",
      config = function()
        require('nvim-treesitter.configs').setup{
          highlight = {
            enabled=true
          }
        }
      end,
    },
    {
      'neovim/nvim-lspconfig',
      version = "*",
      config = function()
        local lsp = require('lspconfig')
        local servers = {'clangd', 'gopls', 'lua_ls', 'pylsp'}
        for _, server in ipairs(servers) do
          lsp[server].setup{}
        end
      end,
    },
    {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      version = "*",
      config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      end
    },
    {
      'catppuccin/nvim',
    },
    {
      'kylechui/nvim-surround',
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
    },
    {
      "ggandor/leap.nvim",
      lazy = false,
      version = "*",
      config = function()
        require('leap').create_default_mappings()
      end
    },
    {
      'nvim-orgmode/orgmode',
      event = 'VeryLazy',
      ft = { 'org' },
      config = function()
        -- Setup orgmode
        require('orgmode').setup({
          org_agenda_files = '~/orgfiles/**/*',
          org_default_notes_file = '~/orgfiles/refile.org',
        })
      end,
    },
    {
      "nvim-neorg/neorg",
      lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
      version = "*", -- Pin Neorg to the latest stable release
      config = true,
    },
    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
      },
      config = true
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})

vim.cmd("colorscheme catppuccin-macchiato")
vim.keymap.set("n", "<leader>t", ":tabnew<CR>")
vim.keymap.set("n", "<leader>d", ":bdelete<CR>")
vim.keymap.set("n", "<leader>l", ":vsp<CR><C-w>l")
vim.keymap.set("n", "<leader>j", ":sp<CR><C-w>j")
vim.keymap.set("n", "<leader>c", ":term<CR>")
