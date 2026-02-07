return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()
      vim.g.rustaceanvim = {
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            -- You can add specific mappings here
            -- e.g., vim.keymap.set("n", "<leader>ca", function() vim.cmd.RustLsp('codeAction') end, { desc = "Rust Code Action", buffer = bufnr })
          end,
          default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = {
                  enable = true,
                },
              },
              -- Add clippy on save
              checkOnSave = true,
              procMacro = {
                enable = true,
              },
            },
          },
        },
      }
    end
  },

  -- Optional: Adds extra completion capabilities
  {
    'hrsh7th/nvim-cmp',
    opts = function(_, opts)
      opts.sources = vim.list_extend(opts.sources or {}, {
        { name = 'crates' },
      })
    end,
  },

  -- Managing crates.io dependencies directly in Cargo.toml
  {
    'saecki/crates.nvim',
    tag = 'stable',
    event = { "BufRead Cargo.toml" },
    config = function()
      require('crates').setup()
    end,
  },
}
