
local M = {}

function M.toggle_checkbox_checkmark()
    local row = vim.api.nvim_win_get_cursor(0)[1] - 1
    local line = vim.api.nvim_get_current_line()

    if line:find("☐") then
        -- Turn unchecked into checked (✔)
        line = line:gsub("☐", "✔", 1)
    elseif line:find("✔") then
        -- Turn checked into unchecked (☐)
        line = line:gsub("✔", "☐", 1)
    else
        -- If no checkbox, insert a new one
        line = "☐ " .. line
    end

    vim.api.nvim_buf_set_lines(0, row, row + 1, false, { line })
end

-- Keybinding (normal mode)
vim.keymap.set('n', '<leader>c', M.toggle_checkbox_checkmark, { noremap = true, silent = true })

return M
