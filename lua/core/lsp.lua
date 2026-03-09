vim.lsp.enable({
    "clangd",
    "ts_ls"
})
vim.diagnostic.config({
    virtual_text = {spacing = 4},
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true
    }
})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {silent = true})
vim.keymap.set('n', '<leader>en', "<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ep', "<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ci", vim.lsp.buf.incoming_calls, { desc = "Incoming Calls" })
vim.keymap.set("n", "<leader>co", vim.lsp.buf.outgoing_calls, { desc = "Outgoing Calls" })
vim.keymap.set("i", "<C-m>", vim.lsp.buf.signature_help, { desc = "Signature Help" })

vim.keymap.set('n', '<leader>d', function()
    vim.diagnostic.open_float(nil, { border = "rounded" })
end, { desc = "Show diagnostic" })
