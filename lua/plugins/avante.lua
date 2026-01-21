return {
    {
        "zbirenbaum/copilot.lua",
        config = function()
            require('copilot').setup({})
        end,
    },
    {
        "yetone/avante.nvim",
        -- lazy = true,
        version = false,
        opts = {
            -- Dummy change to test popup confirmation UI
            windows = { width = 40 },
            provider = "copilot",
            mode = "agentic",
            providers = {
                copilot = {
                    model = "gpt-4.1",
                    auto_select_model = false,
                },
            },
            selector = {
                provider = "native",
            },
            behaviour = {
                auto_suggestions = false,
                auto_set_highlight_group = true,
                auto_set_keymaps = true,
                auto_apply_diff_after_generation = false,
                support_paste_from_clipboard = false,
                enable_token_counting = false,
                auto_approve_tool_permissions = false,
                enable_fastapply = false,
                confirmation_ui_style = "popup",
            },
            selection = {
                hint_display = "none"
            }
        },
        build = vim.fn.has("win32") ~= 0
            and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "ibhagwan/fzf-lua",
            "stevearc/dressing.nvim",
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
            "zbirenbaum/copilot.lua",
            {
                'MeanderingProgrammer/render-markdown.nvim',
                ft = { "markdown", "Avante" },
                config = function()
                    require("render-markdown").setup({
                        checkbox = {
                            enabled = true,
                        },
})
                end,
            },
        },
    },
    
}
