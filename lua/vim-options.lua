vim.wo.number = true;
vim.wo.relativenumber = true;
vim.g.mapleader = " ";
vim.o.tabstop = 4;
vim.o.shiftwidth = 4;
vim.o.expandtab = true;
vim.o.scrollopt = 'ver,jump,hor';
vim.o.sidescrolloff = 5;
vim.o.ignorecase = true;
vim.o.smartcase = true;

local modes = {'n', 'v'}

vim.keymap.set(modes, '<leader>y', '"+y', { noremap = true, silent = true })
vim.keymap.set(modes, '<leader>p', '"+p', { noremap = true, silent = true })
-- below is only for VSCode like setup I'll be shifting to harpoon or snipe in future
-- as remapping tab will break <C-i>
vim.keymap.set(modes, '<leader>l', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set(modes, '<leader>h', ':tabprevious<CR>', { noremap = true, silent = true })
vim.keymap.set(modes, '<leader>t', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set(modes, '<leader>x', ':q!<CR>', { noremap = true, silent = true })
