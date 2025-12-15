vim.lsp.enable({
    "omnisharp",
    "clangd"
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
local ui = require("fzf-lua")
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gi", ui.lsp_implementations, {})
vim.keymap.set("n", "gd", ui.lsp_definitions, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set({ "n", "v" }, "gr", ui.lsp_references, {})
vim.keymap.set('n', '<leader>en', "<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ep', "<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>d', function()
    vim.diagnostic.open_float(nil, { border = "rounded" })
end, { desc = "Show diagnostic" })

-- below will change with change in the UI provider
vim.keymap.set('n', "gm", function()
    ui.lsp_document_symbols({
        regex_filter = function(item)
            return item.kind == "Method"
        end
    })
end, { desc = "Get Methods list" })
