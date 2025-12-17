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

        -- only for diff view to add more contrast to the lines
        vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#1d2b21", fg = "#a9b665" })
        vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#2b1d1d", fg = "#ea6962" })
        vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1d1d2b", fg = "#d8a657" })
        vim.api.nvim_set_hl(0, "DiffText", { bg = "#44475a", fg = "#ffffff" })
    end
}
