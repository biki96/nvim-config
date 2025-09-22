# 🧙 Neovim + Claude Code + Modern Setup (Garuda Linux, Fish, pnpm, Ruff, tmux, 2025 upgrades)

Complete step-by-step guide for setting up a **modern + cutting-edge Neovim environment** with:
- **pnpm** as package manager  
- **Claude Code CLI** integration  
- **lazy.nvim** as plugin manager  
- **modular config** (plugins/ + configs/)  
- **Treesitter** for syntax highlighting  
- **LSP (Mason + lspconfig)** for code intelligence  
- **Conform** for formatting (with Ruff for Python, Biome for JS/TS)  
- **Clipboard integration** (VSCode-like copy/paste)  
- **tmux integration** for ultimate terminal workflow  
- **2025 upgrades**: blink.cmp, avante.nvim, oil.nvim, fzf-lua, noice.nvim  

---

## ⚙️ Step 1 — System, pnpm and PATH

```bash
sudo pacman -Syu --needed   neovim git ripgrep fd fzf unzip   nodejs python-pip pnpm
```

Add `pnpm` global bin to your PATH:

```fish
fish_add_path -Ua ~/.local/share/pnpm
```

Verify:

```bash
pnpm -v
node -v
nvim --version | head -n1
which pnpm
```

---

## 🤖 Step 2 — Install Claude CLI

```bash
pnpm add -g @anthropic-ai/claude-code
```

Check:

```bash
which claude
claude --help
```

Run once to log in:

```bash
claude
```

---

## 📦 Step 3 — Lazy.nvim bootstrap + minimal `init.lua`

```bash
mkdir -p ~/.config/nvim/lua/{plugins,configs}
```

### `~/.config/nvim/init.lua`
```lua
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
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Clipboard config
pcall(function() require("configs.clipboard") end)
```

---

## 📋 Step 4 — Clipboard config

### `~/.config/nvim/lua/configs/clipboard.lua`
```lua
vim.opt.clipboard = "unnamedplus"

vim.keymap.set({ "n", "v" }, "<C-c>", '"+y', { noremap = true, silent = true, desc = "Copy → clipboard" })
vim.keymap.set("n", "<C-v>", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })
vim.keymap.set("i", "<C-v>", '<Esc>"+pa', { noremap = true, silent = true, desc = "Paste in insert mode" })
```

---

## 🔌 Step 5 — Modular plugins

### `~/.config/nvim/lua/plugins/init.lua`
```lua
return {
  { import = "plugins.ai" },
  { import = "plugins.treesitter" },
  { import = "plugins.lsp" },
  { import = "plugins.formatting" },
  { import = "plugins.completion" },   -- blink.cmp
  { import = "plugins.ui" },           -- oil.nvim, fzf-lua, noice.nvim, tmux navigator
}
```

---

## 🤖 AI (Claude + Avante)

### `~/.config/nvim/lua/plugins/ai.lua`
```lua
return {
  {
    "greggh/claude-code.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.claude")
    end,
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
```

---

## 🌳 Treesitter

*(unchanged, still core)*

---

## 🧩 LSP (Mason + Ruff + Biome)

Add Biome for JS/TS formatting/linting.

### `~/.config/nvim/lua/plugins/lsp.lua`
```lua
return {
  { "williamboman/mason.nvim", build = ":MasonUpdate", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = { ensure_installed = { "lua_ls", "pyright", "tsserver", "ruff_lsp" } },
  },
  { "neovim/nvim-lspconfig", config = function() require("configs.lsp") end },
}
```

---

## 🎨 Formatting (Conform with Ruff + Biome)

### `~/.config/nvim/lua/configs/conform.lua`
```lua
local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    javascript = { "biome" },
    typescript = { "biome" },
    json = { "biome" },
    yaml = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
  },
})
```

---

## ⚡ Completion (blink.cmp)

### `~/.config/nvim/lua/plugins/completion.lua`
```lua
return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = { preset = "default" },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
    },
  },
}
```

---

## 🎨 UI/UX Modernization

### `~/.config/nvim/lua/plugins/ui.lua`
```lua
return {
  { "stevearc/oil.nvim", opts = {} },  -- edit filesystem as a buffer
  { "ibhagwan/fzf-lua", opts = {} },   -- faster finder
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },
  { "christoomey/vim-tmux-navigator" }, -- seamless tmux + nvim navigation
}
```

---

## 🖥️ Step 6 — tmux Integration

### Install tmux
```bash
sudo pacman -S tmux
```

### Configure tmux
`~/.tmux.conf`:
```tmux
set -g mouse on
set -g set-clipboard on

bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
```

Reload:
```bash
tmux source-file ~/.tmux.conf
```

### Recommended workflow
- Pane 1 → Neovim  
- Pane 2 → Tests / server logs  
- Pane 3 → Claude CLI (`claude`)  

Detach: `Ctrl-b d`  
Reattach: `tmux attach -t dev`

---

# 🎉 Final Result

You now have a **2025-ready Neovim stack**:
- **lazy.nvim** + `vim.loader.enable()`  
- **blink.cmp** → instant completions  
- **Claude Code + avante.nvim** → AI-native workflow  
- **Ruff + Biome** → Python + JS/TS formatting  
- **oil.nvim + fzf-lua + noice.nvim** → modern UI/UX  
- **tmux integration** → persistence + multiplexed workflow  
- Modular configs → easy to maintain & extend
