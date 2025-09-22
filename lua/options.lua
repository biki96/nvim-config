pcall(function()
  require "nvchad.options"
end)

-- Add custom options here
local o = vim.o
local opt = vim.opt

-- Basic options
o.cursorlineopt = "both" -- to enable cursorline!
o.laststatus = 3 -- global statusline
o.showmode = false
o.mouse = "a" -- enable mouse support

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- Disable nvim intro
opt.shortmess:append "sI"

-- Go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- Interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- Disable some default providers
vim.g["loaded_node_provider"] = 0
vim.g["loaded_python3_provider"] = 0
vim.g["loaded_perl_provider"] = 0
vim.g["loaded_ruby_provider"] = 0