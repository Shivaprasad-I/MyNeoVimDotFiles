return 
{
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {"csharp_ls"}
				-- new lsps here
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local telescope = require('telescope.builtin') -- to map few outputs to show in telescope UI
			--this is for the code completion 

			require("lspconfig.health").check()
			--lspconfig.lua_ls.setup({})
			--lspconfig.angularls.setup({})
			lspconfig.csharp_ls.setup({
				cmd = { "csharp-ls" },
				root_dir = lspconfig.util.root_pattern('*.sln','*.csproj', '.git'), 
				capabilities = capabilities,
				settings =  {
					omniSharp = {
						engine = {
							projectGuid = {
								enable = true,
							},
							useWorkspaceFolder = {
								enable = true,
							},
						}
					}
				},
			})
			 --Set up csharp-ls
			 --init.lua

			
			-- add other language setups here
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
			vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action,{})
            vim.keymap.set({'n', 'v'}, 'gr', telescope.lsp_references, {})
		end
	}
}
