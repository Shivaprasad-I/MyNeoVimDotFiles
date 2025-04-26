return 
{
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = vim.fn.executable("make") == 1,
            },
        },
		config = function()
			local builtIn = require("telescope.builtin")
			vim.keymap.set('n', '<leader>p', builtIn.find_files, {})
			vim.keymap.set('n', '<leader>f', builtIn.live_grep, {})
		end
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local telescope = require("telescope")
            telescope.setup({
				extensions = {
					["ui-select"] = require("telescope.themes").get_dropdown(),
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
				},
				defaults = {
					file_ignore_patterns = {
						".*%.nuget/.*",  
						".*%obj/.*",
						".*%bin/.*",
                        ".git/*",
						----
						"%.dll$",       
						"%.exe$",        
						"%.pdb$",       
						"%.obj$",      
						"%.bin$",
						--"^.*DatabaseConnection/.*"
					},
				},
			})
			telescope.load_extension("ui-select")
            telescope.load_extension("fzf") --toload fuzzy finder

		end
	}
} 
