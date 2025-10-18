vim.lsp.enable({
    "omnisharp",
    "clangd"
})
vim.diagnostic.config({
    virtual_lines = true,
    underline = true,
    update_in_insert = false,
    severiaty_sort = true,
    float = {
        border = "rounded",
        source = true
    }
})
local telescope = require("telescope.builtin")
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gi", telescope.lsp_implementations, {})
vim.keymap.set("n", "gd", telescope.lsp_definitions, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set({ "n", "v" }, "gr", telescope.lsp_references, {})
vim.keymap.set('n', '<leader>en', "<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ep', "<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>", { noremap = true, silent = true })
