-- Git plugin configurations and key mappings

-- Gitsigns key mappings
local function setup_gitsigns_keymaps()
  local gs = require('gitsigns')

  -- Navigation
  vim.keymap.set('n', ']c', function()
    if vim.wo.diff then return ']c' end
    vim.schedule(function() gs.next_hunk() end)
    return '<Ignore>'
  end, { expr = true, desc = "Next git hunk" })

  vim.keymap.set('n', '[c', function()
    if vim.wo.diff then return '[c' end
    vim.schedule(function() gs.prev_hunk() end)
    return '<Ignore>'
  end, { expr = true, desc = "Previous git hunk" })

  -- Actions
  vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { desc = "Stage hunk" })
  vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { desc = "Reset hunk" })
  vim.keymap.set('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage selected hunk" })
  vim.keymap.set('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset selected hunk" })
  vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { desc = "Stage buffer" })
  vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Undo stage hunk" })
  vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { desc = "Reset buffer" })
  vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { desc = "Preview hunk" })
  vim.keymap.set('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "Blame line" })
  vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "Toggle line blame" })
  vim.keymap.set('n', '<leader>hd', gs.diffthis, { desc = "Diff this" })
  vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "Diff this (cached)" })
  vim.keymap.set('n', '<leader>td', gs.toggle_deleted, { desc = "Toggle deleted" })

  -- Text object
  vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Select hunk" })
end

-- Git general key mappings
local function setup_git_keymaps()
  -- Fugitive mappings
  vim.keymap.set('n', '<leader>gs', '<cmd>Git<CR>', { desc = "Git status" })
  vim.keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<CR>', { desc = "Git diff split" })
  vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<CR>', { desc = "Git commit" })
  vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>', { desc = "Git push" })
  vim.keymap.set('n', '<leader>gl', '<cmd>Git pull<CR>', { desc = "Git pull" })
  vim.keymap.set('n', '<leader>gL', '<cmd>Git log<CR>', { desc = "Git log" })
  vim.keymap.set('n', '<leader>gf', '<cmd>Git fetch<CR>', { desc = "Git fetch" })
  vim.keymap.set('n', '<leader>gm', '<cmd>Git merge<CR>', { desc = "Git merge" })
  vim.keymap.set('n', '<leader>gr', '<cmd>Git rebase<CR>', { desc = "Git rebase" })
  vim.keymap.set('n', '<leader>gw', '<cmd>Gwrite<CR>', { desc = "Git write (add current file)" })
  vim.keymap.set('n', '<leader>gR', '<cmd>Gread<CR>', { desc = "Git read (checkout current file)" })

  -- Neogit
  vim.keymap.set('n', '<leader>gg', '<cmd>Neogit<CR>', { desc = "Neogit interface" })
  vim.keymap.set('n', '<leader>gC', '<cmd>Neogit commit<CR>', { desc = "Neogit commit" })

  -- Diffview
  vim.keymap.set('n', '<leader>gv', '<cmd>DiffviewOpen<CR>', { desc = "Open diffview" })
  vim.keymap.set('n', '<leader>gV', '<cmd>DiffviewClose<CR>', { desc = "Close diffview" })
  vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory<CR>', { desc = "File history" })
  vim.keymap.set('n', '<leader>gH', '<cmd>DiffviewFileHistory %<CR>', { desc = "Current file history" })

  -- Git Blame
  vim.keymap.set('n', '<leader>gb', '<cmd>GitBlameToggle<CR>', { desc = "Toggle git blame" })

  -- Git Conflict
  vim.keymap.set('n', '<leader>co', '<cmd>GitConflictChooseOurs<CR>', { desc = "Choose ours (current)" })
  vim.keymap.set('n', '<leader>ct', '<cmd>GitConflictChooseTheirs<CR>', { desc = "Choose theirs (incoming)" })
  vim.keymap.set('n', '<leader>cb', '<cmd>GitConflictChooseBoth<CR>', { desc = "Choose both" })
  vim.keymap.set('n', '<leader>c0', '<cmd>GitConflictChooseNone<CR>', { desc = "Choose none" })
  vim.keymap.set('n', ']x', '<cmd>GitConflictNextConflict<CR>', { desc = "Next conflict" })
  vim.keymap.set('n', '[x', '<cmd>GitConflictPrevConflict<CR>', { desc = "Previous conflict" })

  -- Gitlinker (with error handling)
  vim.keymap.set('n', '<leader>gy', function()
    local ok, gitlinker = pcall(require, "gitlinker")
    if ok then
      gitlinker.get_buf_range_url("n")
    else
      vim.notify("Gitlinker not available", vim.log.levels.WARN)
    end
  end, { desc = "Copy git link" })

  vim.keymap.set('v', '<leader>gy', function()
    local ok, gitlinker = pcall(require, "gitlinker")
    if ok then
      gitlinker.get_buf_range_url("v")
    else
      vim.notify("Gitlinker not available", vim.log.levels.WARN)
    end
  end, { desc = "Copy git link (selection)" })

  -- Telescope git integrations (if telescope is available)
  pcall(function()
    vim.keymap.set('n', '<leader>gB', '<cmd>Telescope git_branches<CR>', { desc = "Git branches" })
    vim.keymap.set('n', '<leader>gS', '<cmd>Telescope git_status<CR>', { desc = "Git status (telescope)" })
    vim.keymap.set('n', '<leader>gT', '<cmd>Telescope git_stash<CR>', { desc = "Git stash" })
  end)
end

-- Setup function to be called after plugins are loaded
local function setup_git_config()
  -- Setup gitsigns keymaps when gitsigns is loaded
  vim.api.nvim_create_autocmd("User", {
    pattern = "GitSignsUpdate",
    callback = setup_gitsigns_keymaps,
    once = true,
  })

  -- Setup general git keymaps immediately
  setup_git_keymaps()
end

-- Auto-setup when this file is loaded
setup_git_config()

return {
  setup_gitsigns_keymaps = setup_gitsigns_keymaps,
  setup_git_keymaps = setup_git_keymaps,
  setup_git_config = setup_git_config,
}