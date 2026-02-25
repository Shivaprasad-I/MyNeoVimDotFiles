-- return {}
return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
        local oil = require("oil");
        oil.setup({
            keymaps = {
                ["<C-p>"] = false,       -- Disable the default
                ["<C-h>"] = "actions.preview", -- Assign preview to a new key
            },
            skip_confirm_for_simple_edits = true,
        });
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in Oil" })
    end
}
