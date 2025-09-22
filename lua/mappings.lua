pcall(function()
  require "nvchad.mappings"
end)

-- Add your custom mappings here
local map = vim.keymap.set

-- General
map("i", "<C-b>", "<ESC>^i", { desc = "Move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move end of line" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

-- Smart navigation: vim windows or tmux panes
local function navigate_left()
  local win_count = vim.fn.winnr('$')
  if win_count > 1 then
    vim.cmd('wincmd h')
  else
    vim.fn.system('tmux select-pane -L')
  end
end

local function navigate_down()
  local win_count = vim.fn.winnr('$')
  if win_count > 1 then
    vim.cmd('wincmd j')
  else
    vim.fn.system('tmux select-pane -D')
  end
end

local function navigate_up()
  local win_count = vim.fn.winnr('$')
  if win_count > 1 then
    vim.cmd('wincmd k')
  else
    vim.fn.system('tmux select-pane -U')
  end
end

local function navigate_right()
  local win_count = vim.fn.winnr('$')
  if win_count > 1 then
    vim.cmd('wincmd l')
  else
    vim.fn.system('tmux select-pane -R')
  end
end

map("n", "<C-h>", navigate_left, { desc = "Navigate left (vim/tmux)" })
map("n", "<C-l>", navigate_right, { desc = "Navigate right (vim/tmux)" })
map("n", "<C-j>", navigate_down, { desc = "Navigate down (vim/tmux)" })
map("n", "<C-k>", navigate_up, { desc = "Navigate up (vim/tmux)" })

-- Force tmux navigation (bypass vim windows)
map("n", "<leader><C-h>", function() vim.fn.system('tmux select-pane -L') end, { desc = "Force tmux left" })
map("n", "<leader><C-l>", function() vim.fn.system('tmux select-pane -R') end, { desc = "Force tmux right" })
map("n", "<leader><C-j>", function() vim.fn.system('tmux select-pane -D') end, { desc = "Force tmux down" })
map("n", "<leader><C-k>", function() vim.fn.system('tmux select-pane -U') end, { desc = "Force tmux up" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "File save" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "File copy whole" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Comment toggle", remap = true })
map("v", "<leader>/", "gc", { desc = "Comment toggle", remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope/fzf-lua (both available)
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "telescope find in files (grep)" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })

-- fzf-lua alternative mappings (faster)
map("n", "<leader>Ff", "<cmd>lua require('fzf-lua').files()<cr>", { desc = "fzf-lua find files" })
map("n", "<leader>Fg", "<cmd>lua require('fzf-lua').live_grep()<cr>", { desc = "fzf-lua live grep" })
map("n", "<leader>Fb", "<cmd>lua require('fzf-lua').buffers()<cr>", { desc = "fzf-lua buffers" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical window" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal new horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- blankline
map("n", "<leader>cb", function()
  local config = { scope = {} }
  config.scope.exclude = { language = {}, node_type = {} }
  config.scope.include = { node_type = {} }
  local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

  if node then
    local start_row, _, end_row, _ = node:range()
    if start_row ~= end_row then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
      vim.api.nvim_feedkeys("_", "n", true)
    end
  end
end, { desc = "blankline jump to current context" })