return{
	"nvim-neo-tree/neo-tree.nvim", branch = "v3.x", 
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
    config = function()
        local filetree = require("neo-tree");
        local options = {
            window = {
                position = "float",
                popup = {
                    size = {
                        width = "60%",
                        height = "80%",
                    },
                    border = "rounded",
                },
            },
        };
        filetree.setup(options);
        vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal float<CR>', {silent = true})
        -- vim.keymap.set('n', '<C-h>', ':Neotree close<CR>',{silent = true})
        vim.keymap.set('n', '<leader>gs', ':Neotree float git_status<CR>', {silent = true})
    end 
}
