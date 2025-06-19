return {
	"catppuccin/nvim",
	name="catppuccin",
	priority = 1000 ,
	config = function()
        contrast = "hard";
		vim.cmd.colorscheme "catppuccin";
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
	end
}
