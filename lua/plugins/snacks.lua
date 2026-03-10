return 
{
    {
        "folke/snacks.nvim",
        opts = {
            picker = { enable },
        },
        keys = {
            -- file picker 
            { "<C-p>", function() Snacks.picker.files({ layout = { preset = "select" } }) end, desc = "Find Files" },
            { "<leader>f", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<leader>b", function() Snacks.picker.buffers({ layout = { preset = "select" }}) end, desc = "Find Buffers" },

            -- git 
            { "<leader>br", function() Snacks.picker.git_branches({ layout = { preset = "select" }}) end, desc = "Git Branches" },

            -- lsp
            { "<leader>ea", function() Snacks.picker.diagnostics( { severity = vim.diagnostic.severity.ERROR, layout = { preset = "select" } }) end, desc = "Diagnostics" },
            { "gs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
            { "gm", function() Snacks.picker.lsp_symbols({ filter = { default = { "Method" }}}) end, desc = "Get Methods list" },
        },
    }
} 
