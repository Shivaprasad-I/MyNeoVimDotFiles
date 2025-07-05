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
                mappings = {
                    ["<C-v>"] = "open_vsplit",
                }
            },
        };
        filetree.setup(options);
        vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>', {silent = true})
        vim.keymap.set('n', '<C-h>', ':Neotree close<CR>',{silent = true})
        vim.keymap.set('n', '<leader>gs', ':Neotree float git_status<CR>', {silent = true})
    end 
}
