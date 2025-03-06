local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out,                            'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ' '

local servers = { 'clangd', 'gopls', 'jdtls', 'lua_ls', 'pylsp', 'html', 'gdscript', 'rust_analyzer', 'csharp_ls' }
-- Setup lazy.nvim
require('lazy').setup({
  spec = {
    {
      'nvim-treesitter/nvim-treesitter',
      version = '*',
      config = function()
        require('nvim-treesitter.configs').setup {
          highlight = {
            enabled = true
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
          lsp[server].setup {}
          vim.o.updatetime = 128
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
            callback = function()
              vim.diagnostic.open_float(nil, { focus = false })
            end
          })
        end
      end,
    },
    {
      'williamboman/mason.nvim',
      config = function()
        require("mason").setup()
      end
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
        vim.keymap.set('n', '<leader>b', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
        vim.keymap.set('n', '<leader>fm', builtin.marks, {})
        vim.keymap.set('n', '<leader>m', builtin.marks, {})
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
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      opts = {}
    },
    {
      'kylechui/nvim-surround',
      version = "*",
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({})
      end
    },
    {
      'ggandor/leap.nvim',
      config = function()
        vim.keymap.set({ 'n', 'x', 'o' }, '<leader>s', '<Plug>(leap)')
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
      lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
      version = '*', -- Pin Neorg to the latest stable release
      config = true,
    },
    {
      'iamcco/markdown-preview.nvim',
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function()
        vim.fn["mkdp#util#install()"]()
      end,
    },
    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    },
    {
      'NeogitOrg/neogit',
      dependencies = {
        'nvim-lua/plenary.nvim', -- required
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

vim.opt.cdhome = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true
vim.opt.autoread = true
vim.opt.scrolloff = 2
vim.opt.sidescroll = 16
vim.opt.sidescrolloff = 2
vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.undofile = true
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.timeout = false
vim.g.markdown_recommended_style = 0
vim.cmd('colorscheme catppuccin-macchiato')
-- vim.cmd('autocmd BufWrite * lua vim.lsp.buf.format()')

vim.keymap.set({ 'n', 'v' }, 'n', 'h')
vim.keymap.set({ 'n', 'v' }, 'e', 'j')
vim.keymap.set({ 'n', 'v' }, 'i', 'k')
vim.keymap.set({ 'n', 'v' }, 'o', 'l')
vim.keymap.set({ 'n', 'v' }, 'N', 'H')
vim.keymap.set({ 'n', 'v' }, 'E', 'J')
vim.keymap.set({ 'n', 'v' }, 'I', 'K')
vim.keymap.set({ 'n', 'v' }, 'O', 'L')
vim.keymap.set({ 'n', 'v' }, 'h', 'n')
vim.keymap.set({ 'n', 'v' }, 'j', 'e')
vim.keymap.set({ 'n', 'v' }, 'k', 'i')
vim.keymap.set({ 'n', 'v' }, 'l', 'o')
vim.keymap.set({ 'n', 'v' }, 'H', 'N')
vim.keymap.set({ 'n', 'v' }, 'J', 'E')
vim.keymap.set({ 'n', 'v' }, 'K', 'I')
vim.keymap.set({ 'n', 'v' }, 'L', 'O')
vim.keymap.set({ 'n', 'v' }, 'gn', 'gh')
vim.keymap.set({ 'n', 'v' }, 'ge', 'gj')
vim.keymap.set({ 'n', 'v' }, 'gi', 'gk')
vim.keymap.set({ 'n', 'v' }, 'go', 'gl')
vim.keymap.set({ 'n', 'v' }, 'gN', 'gH')
vim.keymap.set({ 'n', 'v' }, 'gE', 'gJ')
vim.keymap.set({ 'n', 'v' }, 'gI', 'gK')
vim.keymap.set({ 'n', 'v' }, 'gO', 'gL')
vim.keymap.set({ 'n', 'v' }, 'gh', 'gn')
vim.keymap.set({ 'n', 'v' }, 'gj', 'ge')
vim.keymap.set({ 'n', 'v' }, 'gk', 'gi')
vim.keymap.set({ 'n', 'v' }, 'gl', 'go')
vim.keymap.set({ 'n', 'v' }, 'gH', 'gN')
vim.keymap.set({ 'n', 'v' }, 'gJ', 'gE')
vim.keymap.set({ 'n', 'v' }, 'gK', 'gI')
vim.keymap.set({ 'n', 'v' }, 'gL', 'gO')
vim.keymap.set({ 'n', 'v' }, ';', ':')
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-N><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-N><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-N><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-N><C-w>l')
vim.keymap.set('n', '<A-n>', '<C-w>h')
vim.keymap.set('n', '<A-e>', '<C-w>j')
vim.keymap.set('n', '<A-i>', '<C-w>k')
vim.keymap.set('n', '<A-o>', '<C-w>l')
vim.keymap.set('n', '<A-N>', '<C-w>H')
vim.keymap.set('n', '<A-E>', '<C-w>J')
vim.keymap.set('n', '<A-I>', '<C-w>K')
vim.keymap.set('n', '<A-O>', '<C-w>L')
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>Q', ':q!<CR>')
vim.keymap.set('n', '<leader>w', ':lua vim.lsp.buf.format()<CR>:w<CR>')
vim.keymap.set('n', '<leader>W', ':lua vim.lsp.buf.format()<CR>::w!<CR>')
vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>o', ':vsp<CR><C-w>l')
vim.keymap.set('n', '<leader>e', ':sp<CR><C-w>j')
vim.keymap.set('n', '<leader>c', ':term<CR>')
vim.keymap.set('n', '<leader>g', ':Neogit<CR>')
vim.keymap.set('n', '<leader>h', ':bn<CR>')
vim.keymap.set('n', '<leader>p', ':bp<CR>')
vim.keymap.set('n', '<leader>x', ':bp<CR>:bd#<CR>')
vim.keymap.set('n', '<leader>t', ':tabnew<CR>')
vim.keymap.set('n', '<leader>H', ':tabnext<CR>')
vim.keymap.set('n', '<leader>P', ':tabprevious<CR>')
vim.keymap.set('n', '<leader>X', ':tabclose<CR>')
vim.keymap.set('n', '<ESC>', '<ESC>:let @/=""<CR>')
vim.keymap.set('n', '<leader>F', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.references)
vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>k', vim.lsp.buf.implementation)
