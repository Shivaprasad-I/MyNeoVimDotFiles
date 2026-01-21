return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    config = function()
      local lib = require("diffview.lib")

      -- local function toggle_diffview()
      --   if lib.get_current_view() then
      --     vim.cmd("DiffviewClose")
      --   else
      --     vim.cmd("DiffviewOpen")
      --   end
      -- end
      --
      -- vim.keymap.set('n', '<C-g>', toggle_diffview, { noremap = true, silent = true, desc = 'Toggle Diffview' })

    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local gitsigns = require("gitsigns");
      gitsigns.setup({
          on_attach = function(bufnr)
              local opts = { noremap = true, silent = true, buffer = bufnr }

              local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
              if filetype ~= 'diffview' and filetype ~= 'DiffviewFiles' and filetype ~= 'DiffviewFilePanel' then
                  vim.keymap.set({'n', 'v'}, ']c', gitsigns.next_hunk, opts)
                  vim.keymap.set({'n', 'v'}, '[c', gitsigns.prev_hunk, opts)
              end
          end,
      })
      -- vim.keymap.set({ 'n', 'v' }, ']c', gitsigns.next_hunk, { noremap = true, silent = true })
      -- vim.keymap.set({ 'n', 'v' }, '[c', gitsigns.prev_hunk, { noremap = true, silent = true })
      vim.keymap.set({ 'n', 'v' }, '<leader>gs', gitsigns.stage_hunk, { noremap = true, silent = true })
      vim.keymap.set({ 'n', 'v' }, '<leader>gr', gitsigns.reset_hunk, { noremap = true, silent = true })
      vim.keymap.set({ 'n', 'v' }, '<leader>gb', gitsigns.blame, { noremap = true, silent = true })
    end
  },
  {
      "TimUntersberger/neogit",
      dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
      config = function()
          local neogit = require("neogit"); 
          neogit.setup({
              -- your options here, or leave empty for defaults
              integrations = {
                  diffview = true -- if you want diffview integration
              }
          })
          vim.keymap.set('n', '<C-g>', function() neogit.open() end, { noremap = true, silent = true, desc = 'Toggle Diffview' });
      end,
  }
}

