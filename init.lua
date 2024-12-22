-- Main configuration file (init.lua)
clipboard=unnamedplus
vim.opt.tabstop = 4        -- Number of spaces that a tab character represents
vim.opt.shiftwidth = 4     -- Number of spaces for each indentation level
vim.opt.softtabstop = 4    -- Number of spaces to use when hitting Tab or Backspace
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Automatically insert indentation for certain statements
vim.opt.autoindent = true
vim.wo.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
require('lazy').setup({
  -- Theme related
  {
    'morhetz/gruvbox',
    config = function()
    vim.o.background = 'dark'  -- Set the background to dark mode
    vim.cmd('colorscheme gruvbox')  -- Apply the theme
    end
  },
  --For Debugging

  {
      'hrsh7th/nvim-cmp', -- The completion plugin
     dependencies = {
       'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
       'hrsh7th/cmp-buffer', -- Buffer source for nvim-cmp
       'hrsh7th/cmp-path', -- Path source for nvim-cmp
       'saadparwaiz1/cmp_luasnip', -- Snippet source for nvim-cmp
       'L3MON4D3/LuaSnip', -- Snippet engine
     }
  },
  { 'kyazdani42/nvim-web-devicons' }, --for files/folders icons
  -- nvim-tree setup
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
    require'nvim-tree'.setup({
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      disable_netrw = true,
      hijack_netrw = true,
      view = { width = 40, side = 'left' },
      renderer = {
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            default = "",      -- Default file icon
            symlink = "",      -- Symlink icon
            git = {
              unstaged = "",   -- Unstaged changes icon
              staged = "S",     -- Staged changes icon
              untracked = "U",  -- Untracked files icon
              deleted = "",    -- Deleted files icon
              ignored = "◌",    -- Ignored files icon
            },
            folder = {
              default = "",    -- Default folder icon
              open = "",       -- Open folder icon
              empty = "",      -- Empty folder icon
              empty_open = "", -- Empty open folder icon
              symlink = "",    -- Folder symlink icon
            },
          }
        }
      }
    })
    end
  },

  -- Telescope setup
  {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
    require('telescope').setup({
      defaults = {
        prompt_prefix = "> ",
        mappings = {
          i = {
            ["<C-n>"] = require("telescope.actions").move_selection_next,
            ["<C-p>"] = require("telescope.actions").move_selection_previous,
          },
        },
      },
    })
    end
  },

  -- mason.nvim for managing external tools (LSP, formatters, etc.)
  { 'williamboman/mason.nvim', config = function() require('mason').setup() end },

  -- mason-lspconfig.nvim to integrate mason with nvim-lspconfig
  { 'williamboman/mason-lspconfig.nvim', config = function()
     require('mason-lspconfig').setup({
       ensure_installed = { 'omnisharp' },  -- Automatically install OmniSharp for C#
       automatic_installation = true,  -- Automatically install missing LSPs
     })
     end
  },

  -- nvim-lspconfig for LSP configuration
  { 'neovim/nvim-lspconfig', config = function()
                       -- Load C# specific configurations
     require('csharp').setup()  -- This will load the C# LSP setup from csharp/init.lua
     end
  },

  {'mfussenegger/nvim-dap'},
  {'rcarriga/nvim-dap-ui'},
  {'tpope/vim-abolish'},
                      -- nvim-treesitter for syntax highlighting (C# included)
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "c_sharp" },  -- Install C# parser
      highlight = { enable = true },     -- Enable Tree-sitter syntax highlighting
      additional_vim_regex_highlighting = false,  -- Disable Vim's regex-based highlighting
    })
    end
  },
})

-- Global keymaps
vim.keymap.set('n', '<Leader>f', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-f>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_create_autocmd("User",{
    pattern = "TelescopeFileSelected",
    callback = function()
        require 'nvim-tree'.find_file()
    end,
})
