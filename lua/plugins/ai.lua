return {
  {
    "greggh/claude-code.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("claude-code").setup()
    end
  },
  {
    "yetone/avante.nvim", -- Cursor-like AI assistant
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    opts = {
      provider = "claude", -- can also use openai/gemini/ollama
      auto_apply = false,
    },
  },
}