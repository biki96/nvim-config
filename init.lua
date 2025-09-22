-----------------------------------------------------------
-- Minimal modular init.lua (NvChad + lazy.nvim + 2025 optimizations)
-----------------------------------------------------------

-- Neovim 0.11 native Lua bytecode loader (faster startup)
vim.loader.enable()

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy with NvChad + your plugins
local lazy_config = require "configs.lazy"
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },      -- your modular plugins
}, lazy_config)

-- NvChad core
pcall(function()
  dofile(vim.g.base46_cache .. "defaults")
  dofile(vim.g.base46_cache .. "statusline")
end)

require "options"

pcall(function()
  require "nvchad.autocmds"
end)

vim.schedule(function()
  require "mappings"
end)

-- Clipboard config
pcall(function() require("configs.clipboard") end)

-- Claude Code terminal integration
pcall(function() require("configs.claude") end)

-- Git integration
pcall(function() require("configs.git") end)