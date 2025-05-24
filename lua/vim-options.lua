vim.wo.number = true;
vim.wo.relativenumber = true;
vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.o.scrollopt = 'ver,jump,hor'
vim.o.sidescrolloff = 5

local modes = {'n', 'v'}

vim.keymap.set(modes, '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set(modes, '<leader>p', '"+p', { noremap = true, silent = true })
vim.keymap.set(modes, '<Tab>', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set(modes, '<S-Tab>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.keymap.set(modes, '<leader>t', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set(modes, '<leader>x', ':q!<CR>', { noremap = true, silent = true })
