return {
    "shivaprasad-i/custom-functions.nvim",
    -- Use 'dir' for local development. 
    -- When you host it on GitHub, you can comment this out to use the remote version.
    -- dir = "~/custom-tool.nvim",
    config = function()
        require("custom-tools").setup()
    end,
}
