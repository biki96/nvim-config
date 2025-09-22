# 🚀 Tmux + Neovim Ultimate Workflow Tutorial

## 📋 Table of Contents
1. [Tmux Mouse Support Setup](#tmux-mouse-support-setup)
2. [Basic Tmux Commands](#basic-tmux-commands)
3. [Tmux + Neovim Navigation](#tmux--neovim-navigation)
4. [Window & Pane Management](#window--pane-management)
5. [Development Workflow](#development-workflow)
6. [Advanced Tips](#advanced-tips)

---

## 🖱️ Tmux Mouse Support Setup

Your `.tmux.conf` already enables mouse support:
```tmux
set -g mouse on
set -g set-clipboard on
```

This enables:
- ✅ **Click to switch panes**
- ✅ **Scroll with mouse wheel**
- ✅ **Resize panes by dragging borders**
- ✅ **Select text with mouse**
- ✅ **Copy/paste integration**

---

## 🎛️ Basic Tmux Commands

### Session Management
```bash
# Start new session
tmux new-session -s dev

# List sessions
tmux list-sessions
tmux ls

# Attach to session
tmux attach -t dev
tmux a -t dev

# Detach (from inside tmux)
Ctrl-b d

# Kill session
tmux kill-session -t dev
```

### Essential Key Bindings
```
Prefix Key: Ctrl-b (press and release, then the command)

Ctrl-b d        Detach from session
Ctrl-b c        Create new window
Ctrl-b n        Next window
Ctrl-b p        Previous window
Ctrl-b 0-9      Switch to window by number
Ctrl-b ,        Rename current window
Ctrl-b &        Kill current window
```

---

## 🧭 Tmux + Neovim Navigation

### Seamless Pane Navigation
Your config includes smart navigation that works from within Neovim:

**Smart Navigation (Auto-detects context):**
```
Ctrl-h          Navigate left (vim windows OR tmux panes)
Ctrl-j          Navigate down (vim windows OR tmux panes)
Ctrl-k          Navigate up (vim windows OR tmux panes)
Ctrl-l          Navigate right (vim windows OR tmux panes)
```

**Force Tmux Navigation (Bypass vim windows):**
```
<space>Ctrl-h   Force tmux pane left
<space>Ctrl-j   Force tmux pane down
<space>Ctrl-k   Force tmux pane up
<space>Ctrl-l   Force tmux pane right
```

**Alternative Navigation (Always available):**
```
Alt-Left        Select pane left
Alt-Right       Select pane right
Alt-Up          Select pane up
Alt-Down        Select pane down
```

### How It Works
1. **In Neovim**: `Ctrl-h/j/k/l` moves between vim windows
2. **At window edge**: Automatically switches to tmux pane
3. **In tmux**: `Ctrl-h/j/k/l` moves between tmux panes
4. **Seamless**: No mental overhead switching between tools

---

## 🪟 Window & Pane Management

### Splitting Panes
```
Ctrl-b %        Split vertically (left/right)
Ctrl-b "        Split horizontally (top/bottom)
Ctrl-b x        Kill current pane
Ctrl-b z        Zoom/unzoom current pane
```

### Resizing Panes
**With Mouse:** Drag the pane borders

**With Keyboard:**
```
Ctrl-b Ctrl-Left    Resize left
Ctrl-b Ctrl-Right   Resize right
Ctrl-b Ctrl-Up      Resize up
Ctrl-b Ctrl-Down    Resize down
```

### Pane Layouts
```
Ctrl-b Space    Cycle through preset layouts
Ctrl-b !        Break pane to new window
Ctrl-b {        Move pane left
Ctrl-b }        Move pane right
```

---

## 💻 Development Workflow

### Recommended 3-Pane Setup

**Layout 1: Horizontal Split**
```
┌─────────────────────────────────┐
│                                 │
│         Neovim (Main)           │
│                                 │
├─────────────────┬───────────────┤
│  Terminal/Tests │  Claude Code  │
│                 │               │
└─────────────────┴───────────────┘
```

**Setup Commands:**
```bash
# Start tmux
tmux new-session -s dev

# Split horizontally (create bottom pane)
Ctrl-b "

# Split bottom pane vertically
Ctrl-b %

# Navigate to top pane and start nvim
Ctrl-h
nvim

# Navigate to bottom-left for terminal
Ctrl-j
# Run tests, git commands, etc.

# Navigate to bottom-right for Claude
Ctrl-l
claude
```

**Layout 2: Vertical Split**
```
┌─────────────────┬───────────────┐
│                 │               │
│  Neovim (Main)  │  Claude Code  │
│                 │               │
├─────────────────┤               │
│  Terminal/Tests │               │
│                 │               │
└─────────────────┴───────────────┘
```

### Quick Setup Script
Create this in your shell:
```bash
#!/bin/bash
# dev-setup.sh

# Create new session
tmux new-session -d -s dev

# Create panes
tmux split-window -h -t dev    # Split vertically
tmux select-pane -t 0          # Select left pane
tmux split-window -v -t dev    # Split horizontally

# Start applications
tmux send-keys -t dev:0.0 'nvim' Enter
tmux send-keys -t dev:0.2 'claude' Enter

# Focus on nvim
tmux select-pane -t 0

# Attach to session
tmux attach -t dev
```

---

## 🎯 Neovim Integration Features

### Terminal in Neovim
Your Neovim config provides terminal integration:

```
<leader>h       Horizontal terminal in nvim
<leader>v       Vertical terminal in nvim
Alt-h           Toggle horizontal terminal
Alt-v           Toggle vertical terminal
Alt-i           Toggle floating terminal
Ctrl-x          Exit terminal mode
```

### When to Use Each
- **Tmux panes**: Long-running processes (servers, logs)
- **Nvim terminals**: Quick commands, git operations
- **External terminal**: Heavy CLI work, system admin

---

## 🔧 Advanced Tips

### Copy/Paste Between Tmux & Neovim
Your configuration enables seamless clipboard integration:

**In Neovim:**
```
Ctrl-c          Copy to system clipboard
Ctrl-v          Paste from system clipboard
```

**In Tmux:**
```
# Select text with mouse, then:
y               Copy to system clipboard
Ctrl-b ]       Paste from tmux buffer
```

### Session Persistence
```bash
# Save tmux session state (install tmux-resurrect)
Ctrl-b Ctrl-s

# Restore tmux session state
Ctrl-b Ctrl-r
```

### Multiple Projects
```bash
# Create project-specific sessions
tmux new-session -s frontend
tmux new-session -s backend
tmux new-session -s docs

# Quick switch between projects
tmux switch-client -t frontend
tmux switch-client -t backend
```

### Window Naming Strategy
```bash
# Rename windows by project area
Ctrl-b ,
# Then type names like:
# - nvim
# - tests
# - server
# - logs
# - claude
```

---

## 🚀 Power User Workflows

### Workflow 1: Full-Stack Development
```bash
# Session: fullstack
tmux new-session -s fullstack

# Window 1: Frontend (nvim + dev server)
Ctrl-b c
Ctrl-b , # Rename to "frontend"
# Split: nvim | dev server

# Window 2: Backend (nvim + api server)
Ctrl-b c
Ctrl-b , # Rename to "backend"
# Split: nvim | api server

# Window 3: Database & Tools
Ctrl-b c
Ctrl-b , # Rename to "tools"
# Split: db client | logs | claude
```

### Workflow 2: Code Review & Testing
```bash
# Session: review
tmux new-session -s review

# Pane setup:
# - Main: nvim with code
# - Bottom-left: test runner
# - Bottom-right: claude for explanations
# - Use mouse to resize based on current focus
```

### Workflow 3: Learning & Documentation
```bash
# Session: learning
tmux new-session -s learning

# Pane setup:
# - Large left: nvim with tutorial/code
# - Top-right: claude for questions
# - Bottom-right: terminal for practice
```

---

## 🎨 Customization Tips

### Enhanced .tmux.conf
Add these to your `.tmux.conf` for better experience:

```tmux
# Better colors
set -g default-terminal "screen-256color"

# Start windows at 1 instead of 0
set -g base-index 1
set -g pane-base-index 1

# Renumber windows when one is closed
set -g renumber-windows on

# Increase history limit
set -g history-limit 10000

# Faster command sequences
set -s escape-time 10

# Activity monitoring
setw -g monitor-activity on
set -g visual-activity on

# Mouse wheel scrolling
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
```

### Status Bar Customization
```tmux
# Status bar
set -g status-interval 60
set -g status-left-length 30
set -g status-left '#[fg=green](#S) #(whoami)'
set -g status-right '#[fg=yellow]#(cut -d " " -f 1-3 /proc/loadavg)#[default] #[fg=white]%H:%M#[default]'
```

---

## 🆘 Troubleshooting

### Mouse Not Working?
1. Check tmux version: `tmux -V` (needs 2.1+)
2. Ensure config is loaded: `tmux source-file ~/.tmux.conf`
3. Restart tmux session

### Navigation Not Working?
1. Check if `vim-tmux-navigator` is installed in nvim
2. Verify tmux config has navigation bindings
3. Restart both tmux and nvim

### Clipboard Issues?
1. Install `xclip` or `xsel`: `sudo pacman -S xclip`
2. Check tmux clipboard setting: `set -g set-clipboard on`
3. Verify nvim clipboard: `:checkhealth` in nvim

---

## 🎯 Quick Reference

### Essential Combos
```
tmux new -s work        Start work session
Ctrl-b "                Split horizontal
Ctrl-b %                Split vertical
Ctrl-h/j/k/l           Navigate (nvim + tmux)
Alt-Left/Right/Up/Down  Alternative navigation
Ctrl-b d               Detach session
tmux a -t work         Reattach to work
```

### Mouse Actions
```
Click pane             Focus pane
Drag border           Resize pane
Scroll wheel          Scroll content
Select text           Copy to clipboard (with mouse selection)
Right-click           Context menu (terminal dependent)
```

---

*💡 Pro Tip: Start with basic tmux + nvim workflow, then gradually add panes and windows as you get comfortable. The mouse support makes learning much easier!*