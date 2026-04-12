return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local ts = require("nvim-treesitter")

        -- Install parsers
        ts.install({ "lua", "c_sharp", "sql", "angular", "html", "cpp" })

        -- Highlight & Indent via native APIs
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                local bufnr = vim.api.nvim_get_current_buf()
                pcall(vim.treesitter.start, bufnr)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })

        -- Neovim 0.12+ Core Incremental Selection
        -- Map <Enter> to start and expand selection
        -- vim.keymap.set("n", "<Enter>", "van", { remap = true, desc = "Init/Expand selection" })
        -- vim.keymap.set("x", "<Enter>", "an", { remap = true, desc = "Expand selection" })

        -- Map <Backspace> to shrink selection
        -- vim.keymap.set("x", "<BS>", "in", { remap = true, desc = "Shrink selection" })
    end
}
