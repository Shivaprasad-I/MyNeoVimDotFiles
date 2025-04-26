return {
	"catppuccin/nvim",
	name="catppuccin",
	priority = 1000 ,
	config = function()
        contrast = "hard",
		vim.cmd.colorscheme "catppuccin"
	end
}
