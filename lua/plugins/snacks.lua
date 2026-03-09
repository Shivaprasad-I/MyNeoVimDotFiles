return 
{
    {
        "folke/snacks.nvim",
        opts = {
            picker = { enable },
        },
        keys = {
            -- file picker 
            { "<C-p>", function() Snacks.picker.smart({ layout = { preset = "select" } }) end, desc = "Find Files" },
            { "<leader>f", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<leader>b", function() Snacks.picker.buffers({ layout = { preset = "select" }}) end, desc = "Find Buffers" },

            -- git 
            { "<leader>br", function() Snacks.picker.git_branches({ layout = { preset = "select" }}) end, desc = "Git Branches" },

            -- lsp
            { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
            { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
            { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
            { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
            { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
            { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
            { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
            { "<leader>ea", function() Snacks.picker.diagnostics( { severity = vim.diagnostic.severity.ERROR, layout = { preset = "select" } }) end, desc = "Diagnostics" },
            { "gs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
            { "gm", function() Snacks.picker.lsp_symbols({ filter = { default = { "Method" }}}) end, desc = "Get Methods list" },
        },
    }
} 
