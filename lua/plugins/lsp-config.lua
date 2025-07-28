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
                -- ensure_installed = { "csharp_ls" },
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
                virtual_text = false,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })
            vim.keymap.set('n', '<leader>d', function()
                vim.diagnostic.open_float(nil, { border = "rounded" })
            end, { desc = "Show diagnostic" })
 
                     
            -- requires dotnet 8 which is not out of 
             -- lspconfig.csharp_ls.setup({
			-- 	cmd = { "csharp-ls" },
			-- 	root_dir = lspconfig.util.root_pattern('*.sln','*.csproj', '.git'), 
			-- 	capabilities = capabilities,
			-- 	settings =  {
			-- 		omniSharp = {
			-- 			engine = {
			-- 				projectGuid = {
			-- 					enable = true,
			-- 				},
			-- 				useWorkspaceFolder = {
			-- 					enable = true,
			-- 				},
			-- 			}
			-- 		}
			-- 	},
			-- })

            -- omnisharp working but require dotnet 6 which is not supported in many distros
            local omnisharp_path = vim.fn.expand("~/.omnisharp/OmniSharp")
            lspconfig.omnisharp.setup({
                cmd = {
                    omnisharp_path,
                    "--languageserver", "--hostPID", tostring(vim.fn.getpid())
                },
                root_dir = function(fname)
                    return require("lspconfig.util").root_pattern(".sln", ".csproj", ".git")(fname)
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

