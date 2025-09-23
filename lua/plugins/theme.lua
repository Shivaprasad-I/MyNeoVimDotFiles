return {
    "morhetz/gruvbox",
    name = "gruvbox",
    priority = 1000,
    config = function()
        -- Enable transparency for Catppuccin theme (buffers)
        vim.g.catppuccin_transparent_background = 1
        -- Apply the colorscheme
        vim.cmd.colorscheme("gruvbox")
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#D1D1D1" })       -- Light gray for normal line numbers
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffa13d"})  -- Bold, bright color for current line number
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })  
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })  
    end
}
