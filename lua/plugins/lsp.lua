return {
  { "williamboman/mason.nvim", build = ":MasonUpdate", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = { ensure_installed = { "lua_ls", "pyright", "tsserver", "ruff_lsp" } },
  },
  { "neovim/nvim-lspconfig", config = function() require("configs.lsp") end },
}