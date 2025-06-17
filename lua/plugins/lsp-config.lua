return {
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
                ensure_installed = { "omnisharp" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.offsetEncoding = "utf-16"
            local telescope = require("telescope.builtin")

            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            lspconfig.omnisharp.setup({
                cmd = {
                    "dotnet",
                    vim.fn.stdpath("data") .. "/mason/packages/omnisharp/OmniSharp.dll",
                },
                root_dir = function(fname)
                    return require("lspconfig.util").root_pattern("*.sln", "*.csproj", ".git")(fname)
                    or vim.fn.getcwd()
                end,
                capabilities = capabilities,
                enable_roslyn_analyzers = true,
                organize_imports_on_format = true,
                enable_import_completion = true,
                on_init = function(client)
                    client.offset_encoding = "utf-16"
                    return true
                end,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            --vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            --vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})


            vim.keymap.set("n", "gi", telescope.lsp_implementations, {})
            vim.keymap.set("n", "gd", telescope.lsp_definitions, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set({ "n", "v" }, "gr", telescope.lsp_references, {})
        end,
    },
}

