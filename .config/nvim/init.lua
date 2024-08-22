vim.opt.langmap='hjklHJKLneioNEIO;neioNEIOhjklHJKL'
vim.keymap.set({'n', 'v'}, ';', ':')
vim.keymap.set({'t', 'i'}, '<A-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set({'t', 'i'}, '<A-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set({'t', 'i'}, '<A-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set({'t', 'i'}, '<A-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set({'t', 'i'}, '<A-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set({'t', 'i'}, '<A-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set({'t', 'i'}, '<A-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set({'t', 'i'}, '<A-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set('n', '<A-H>', '<C-w>H')
vim.keymap.set('n', '<A-J>', '<C-w>J')
vim.keymap.set('n', '<A-K>', '<C-w>K')
vim.keymap.set('n', '<A-L>', '<C-w>L')
vim.keymap.set('i', '{', '{}<Left>')
vim.keymap.set('i', '[', '[]<Left>')
vim.keymap.set('i', '(', '()<Left>')
vim.keymap.set('i', "'", "''<Left>")
vim.keymap.set('i', '"', '""<Left>')
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
vim.opt.relativenumber=true
vim.opt.clipboard='unnamedplus'
vim.opt.undofile=true
vim.opt.tabstop=2
vim.opt.expandtab=true
vim.opt.shiftwidth=2
vim.opt.smartindent=true

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ' '

local servers = {'clangd', 'gopls', 'lua_ls', 'pylsp'}
-- Setup lazy.nvim
require('lazy').setup({
  spec = {
    {
      'nvim-treesitter/nvim-treesitter',
      version = '*',
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
      version = '*',
      config = function()
        local lsp = require('lspconfig')
        for _, server in ipairs(servers) do
          lsp[server].setup{}
        end
      end,
    },
    {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      version = '*',
      config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fp', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>fc', builtin.commands, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      end
    },
    {
      'hrsh7th/cmp-nvim-lsp',
    },
    {
      'hrsh7th/cmp-cmdline',
    },
    {
      'hrsh7th/nvim-cmp',
      config = function()
        local cmp = require('cmp')
        cmp.setup({
            snippet = {
              -- REQUIRED - you must specify a snippet engine
              expand = function(args)
                vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
              end,
            },
            window = {
              completion = cmp.config.window.bordered(),
              documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
            })
          })

          -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = 'buffer' }
            }
          })

          -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = 'path' }
            }, {
              { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
          })

          -- Set up lspconfig.
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          for _, server in ipairs(servers) do
            require('lspconfig')[server].setup {
              capabilities = capabilities
            }
          end
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
      'nvim-neorg/neorg',
      lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
      version = '*', -- Pin Neorg to the latest stable release
      config = true,
    },
    {
      'NeogitOrg/neogit',
      dependencies = {
        'nvim-lua/plenary.nvim',         -- required
      },
      config = true
    },
    {
      'catppuccin/nvim',
      config = function()
        require('catppuccin').setup({
          transparent_background = true,
        })
      end,
    },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require('lualine').setup()
      end
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- automatically check for plugin updates
  checker = { enabled = false },
})

vim.cmd('colorscheme catppuccin-macchiato')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>Q', ':q!<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.keymap.set('n', '<leader>W', ':wq<CR>')
vim.keymap.set('n', '<leader>e', ':e ')
vim.keymap.set('n', '<leader>t', ':tabnew<CR>')
vim.keymap.set('n', '<leader>b', ':buffers<CR>')
vim.keymap.set('n', '<leader>x', ':bdelete ')
vim.keymap.set('n', '<leader>l', ':vsp<CR><C-w>l')
vim.keymap.set('n', '<leader>j', ':sp<CR><C-w>j')
vim.keymap.set('n', '<leader>c', ':term<CR>')
vim.keymap.set('n', '<leader>g', ':Neogit<CR>')
vim.keymap.set('n', '<leader>n', ':bn<CR>')
vim.keymap.set('n', '<leader>p', ':bp<CR>')
vim.keymap.set('n', '<leader>m', ':marks<CR>')
vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.references)
