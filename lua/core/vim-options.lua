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
vim.opt.splitright = true;

local modes = {'n', 'v'};
local options = { noremap = true, silent = true };

vim.keymap.set(modes, '<leader>y', '"+y', options)
vim.keymap.set(modes, '<leader>p', '"+p', options)
-- below is only for VSCode like setup I'll be shifting to harpoon or snipe in future
-- as remapping tab will break <C-i>
vim.keymap.set(modes, '<leader>l', ':tabnext<CR>', options)
vim.keymap.set(modes, '<leader>h', ':tabprevious<CR>', options)
vim.keymap.set(modes, '<leader>t', ':tabnew<CR>', options)
vim.keymap.set(modes, '<leader>x', ':q!<CR>', options)
vim.keymap.set('n', '<Esc>', "<cmd>nohlsearch<CR>", options)
vim.keymap.set("x", "<leader>r", function()
  -- Yank the visual selection
  vim.cmd('normal! "vy')

  -- Escape the yanked text for literal search (\V for very nomagic)
  local escaped = vim.fn.escape(vim.fn.getreg("v"), [[\/]])
  local cmd = string.format([[%%s/\V%s/]], escaped)

  -- Open the command-line with the substitution pre-filled
  vim.api.nvim_feedkeys(":" .. cmd, "n", false)
end, { desc = "Search and replace visual selection with confirmation" })
-- Exit terminal mode with Esc
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
