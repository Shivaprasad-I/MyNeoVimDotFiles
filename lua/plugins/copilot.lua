return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    build = false,--"make tiktoken",

    opts = {
      -- Disable all completion-related features → chat only
      auto_insert = false,
      show_help = true,
      mappings = {
        complete = false,
      },
    },

    keys = {
      -- Open Chat window
      { "<leader>cc", ":CopilotChatToggle<CR>", desc = "Copilot Chat" },

      -- Chat with selected code
      { "<leader>ce", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain code" },
      { "<leader>cf", ":CopilotChatFix<CR>",     mode = "v", desc = "Fix code" },
      { "<leader>cR", ":CopilotChatReview<CR>",  mode = "v", desc = "Review code" },

      -- Invite Copilot into the buffer
      { "<leader>tc", ":CopilotChatAgent<CR>", desc = "Copilot Agent" },
    }
  },
}
