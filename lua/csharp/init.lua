-- C# specific configuration (lua/csharp/init.lua)
local M = {}

function M.setup()
  local lspconfig = require('lspconfig')

  -- Configure OmniSharp for C#
  lspconfig.omnisharp.setup({
    cmd = { "omnisharp","--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj"),
    on_attach = function(client, bufnr)
      -- Custom keybindings for LSP features
      local opts = { noremap = true, silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    end,
    settings = {
      omnisharp = {
        enableRoslynAnalyzers = true,  -- Enable Roslyn analyzers (optional)
      }
    }
  })

  -- Custom Telescope configuration for C# (to ignore certain files)
  require('telescope').setup({
    defaults = {
      file_ignore_patterns = {
        -- Add C#-specific files to ignore when using Telescope (e.g., ignore build artifacts)
        ".*%.nuget/.*",  -- Exclude from these folders ex: .nuget/
        ".*%obj/.*",
        ".*%bin/.*",
 
        "%.dll$",        -- Exclude these file extensions ex: .dll
        "%.exe$",        
        "%.pdb$",       
        "%.obj$",      
        "%.bin$"     
      },
    },
  })
 end

return M

