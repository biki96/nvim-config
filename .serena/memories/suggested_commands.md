# Essential Commands for Development

## Setup Commands
```bash
# Setup tmux session persistence
./setup-tmux-plugins.sh

# Start development environment
tmux new-session -s dev
nvim

# Check Neovim health
nvim +checkhealth
```

## Daily Development Commands
```bash
# Tmux Session Management
tmux new-session -s project-name    # Create named session
tmux ls                              # List sessions
tmux a -t project-name              # Attach to session
tmux kill-session -t project-name  # Kill specific session

# Navigation (works in both tmux and nvim)
Ctrl-h/j/k/l                        # Navigate panes/windows
Alt-arrows                          # Alternative navigation

# Neovim Essential
<space>ff                           # Find files
<space>fg                           # Find in files (grep)
<space>cc                           # Claude Code horizontal
<space>cv                           # Claude Code vertical
```

## Session Persistence
```bash
# Manual controls (auto-save every 15 min)
Prefix + Ctrl-s                     # Manual save
Prefix + Ctrl-r                     # Manual restore
Prefix + R                          # Reload config
Prefix + I                          # Install plugins
```

## Git Integration
```bash
# In Neovim
<leader>gg                          # Neogit interface
<leader>gs                          # Git status
<leader>gc                          # Git commit
<leader>gp                          # Git push
```

## Plugin Management
```bash
# In Neovim
:Lazy                               # Plugin manager
:Lazy sync                          # Update plugins
:Mason                              # LSP manager
```

## Troubleshooting
```bash
# System checks
nvim +checkhealth                  # Check Neovim config
tmux info                          # Check tmux status
git status                         # Check repository state

# Emergency
:q!                                # Force quit Neovim
Ctrl-b d                           # Detach tmux
tmux kill-server                   # Kill all tmux sessions
```

## File Operations
```bash
# Project navigation
:Oil                               # File explorer
<space>ff                          # Fuzzy file finder
<space>fg                          # Live grep search

# Quick access
gd                                 # Go to definition
K                                  # Hover documentation
<leader>ca                         # Code actions
<leader>f                          # Format code
```