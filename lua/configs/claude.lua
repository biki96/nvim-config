-- Claude Code plugin configuration
require("claude-code").setup({
  -- Optional configuration - plugin provides good defaults
  -- window = {
  --   position = "bottom",
  --   size = 20,
  -- },
  -- refresh = {
  --   on_save = true,
  --   on_focus = true,
  -- },
})

-- The plugin provides default keymaps:
-- <C-,> : Toggle Claude Code terminal
-- <leader>cC : Continue conversation
-- <leader>cV : Verbose mode

-- Additional custom mappings for convenience
vim.keymap.set("n", "<leader>cc", function()
  require("claude-code").toggle()
end, { desc = "Toggle Claude Code" })

vim.keymap.set("n", "<leader>cv", function()
  require("claude-code").continue()
end, { desc = "Continue Claude conversation" })