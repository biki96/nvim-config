vim.opt.clipboard = "unnamedplus"

vim.keymap.set({ "n", "v" }, "<C-c>", '"+y', { noremap = true, silent = true, desc = "Copy → clipboard" })
vim.keymap.set("n", "<C-v>", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })
vim.keymap.set("i", "<C-v>", '<Esc>"+pa', { noremap = true, silent = true, desc = "Paste in insert mode" })