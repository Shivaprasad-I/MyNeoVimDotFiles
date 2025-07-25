-- Disable netrw early to prevent it from opening
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not(vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
	if vim.v.shell_error ~= 0 then 
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim :\n", "ErrorMsg"},
			{ out, "WarningMsg" }, 
			{ "\nPress Any key to Continue...."},
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)


local opts = {}
require("vim-options")
require("lazy").setup("plugins")
require('checkbox')

