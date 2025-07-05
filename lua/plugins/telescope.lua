return 
{
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            files = {
                -- Ignore similar to Telescope's file_ignore_patterns
                fd_opts = [[--color=never --type f --hidden --exclude .git --exclude obj --exclude bin --exclude *.dll --exclude *.exe --exclude *.pdb --exclude *.obj --exclude *.bin --exclude *.nuget]],
            },
            grep = {
                -- This applies to `live_grep`
                rg_opts = [[--hidden --column --line-number --no-heading --color=always --smart-case --ignore-file ~/.rgignore]],
            },
        },
        config = function()
            local fzf = require("fzf-lua")
            fzf.setup(opts)
            vim.keymap.set('n', '<C-p>', fzf.files, {})
            vim.keymap.set('n', '<leader>f', fzf.live_grep, {})
        end
    },
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
            -- vim.keymap.set('n', '<C-p>', builtIn.find_files, {})
            -- vim.keymap.set('n', '<leader>f', builtIn.live_grep, {})
            local telescope = require("telescope")
            telescope.setup({
                extensions = {
                    ["ui-select"] = require("telescope.themes").get_dropdown(),
                },
                defaults = {
                    previewer = true,
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
            telescope.load_extension("fzf")
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
    }
} 
