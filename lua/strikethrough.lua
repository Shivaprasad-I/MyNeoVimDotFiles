
local M = {}

function M.toggle_strikethrough_persistent()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local line_start, col_start = start_pos[2], start_pos[3]
    local line_end, col_end = end_pos[2], end_pos[3]

    if line_start > line_end or (line_start == line_end and col_start > col_end) then
        line_start, line_end = line_end, line_start
        col_start, col_end = col_end, col_start
    end

    local lines = vim.api.nvim_buf_get_lines(0, line_start - 1, line_end, false)
    local new_lines = {}
    local has_strike = false

    for i, line in ipairs(lines) do
        local s_col = (i == 1) and col_start or 1
        local e_col = (i == #lines) and col_end or #line
        if s_col > #line then goto continue end
        e_col = math.min(e_col, #line)
        local segment = line:sub(s_col, e_col)
        if segment:find('\u{0336}') then
            has_strike = true
            break
        end
        ::continue::
    end

    for i, line in ipairs(lines) do
        local s_col = (i == 1) and col_start or 1
        local e_col = (i == #lines) and col_end or #line
        if s_col > #line then
            new_lines[i] = line
        else
            e_col = math.min(e_col, #line)
            local before = line:sub(1, s_col - 1)
            local target = line:sub(s_col, e_col)
            local after = line:sub(e_col + 1)

            if has_strike then
                target = target:gsub('\u{0336}', '')
            else
                target = target:gsub('.', function(c)
                    return c .. '\u{0336}'
                end)
            end

            new_lines[i] = before .. target .. after
        end
    end

    vim.api.nvim_buf_set_lines(0, line_start - 1, line_end, false, new_lines)
end

-- Set keybinding for visual mode
vim.keymap.set('v', '<leader>s', M.toggle_strikethrough_persistent, { noremap = true, silent = true })

return M
