return {}
-- old file
--[[ return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                -- ensure_installed = { "omnisharp" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.offsetEncoding = {"utf-16"}
            local telescope = require("telescope.builtin")

            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always"
                }
            })
            vim.keymap.set('n', '<leader>d', function()
                vim.diagnostic.open_float(nil, { border = "rounded" })
            end, { desc = "Show diagnostic" })


            lspconfig.omnisharp.setup({
                cmd = {
                    "dotnet",
                    vim.fn.stdpath("data") .. "/mason/packages/omnisharp/OmniSharp.dll",
                    "-z",
                    "--languageserver",
                    "--hostPID", tostring(vim.fn.getpid())
                },
                root_dir = function(fname)
                    return require("lspconfig.util").root_pattern(".sln", ".csproj", ".git")(fname)
                    or vim.fn.getcwd()
                end,
                filetypes = { "cs", "vb" },
                capabilities = capabilities,
                on_init = function(client)
                    client.offset_encoding = "utf-16"
                    return true
                end,
                settings = {
                    omnisharp = {
                        enableRoslynAnalyzers = true,
                        organizeImportsOnFormat = true,
                        enableImportCompletion = true,
                    },
                },
            })


            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            --vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            --vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})


            vim.keymap.set("n", "gi", telescope.lsp_implementations, {})
            vim.keymap.set("n", "gd", telescope.lsp_definitions, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set({ "n", "v" }, "gr", telescope.lsp_references, {})
            vim.keymap.set('n', '<leader>en', "<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>", { noremap = true, silent = true })
            vim.keymap.set('n', '<leader>ep', "<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>", { noremap = true, silent = true })
        end,
    },
}
]]--
