# 💾 Tmux Session Persistence Guide

Complete guide to saving and restoring tmux sessions across reboots using tmux-resurrect and tmux-continuum.

## 🚀 Quick Setup

### 1. Install Session Persistence
```bash
# Run the setup script (from config root directory)
./setup-tmux-plugins.sh
```

### 2. Start Using Sessions
```bash
# Create a named session
tmux new-session -s development

# Your work automatically saves every 15 minutes
# Sessions restore automatically when tmux starts
```

## 🎮 Session Management Commands

### Manual Control
```bash
# Manual save session
Prefix + Ctrl-s

# Manual restore session
Prefix + Ctrl-r

# Reload tmux config
Prefix + R

# Install/update plugins
Prefix + I
```

> **Default Prefix**: `Ctrl-b` (press Ctrl+b, release, then press the command key)

### Session Operations
```bash
# Create named session
tmux new-session -s project-name

# List all sessions
tmux list-sessions
# or
tmux ls

# Attach to session
tmux attach-session -t project-name
# or
tmux a -t project-name

# Kill specific session
tmux kill-session -t project-name

# Detach from current session
Prefix + d
```

## ⚙️ Configuration Details

### What Gets Saved
- ✅ **Pane layouts** - Split configurations and sizes
- ✅ **Window arrangements** - Multiple windows and their names
- ✅ **Working directories** - Current directory in each pane
- ✅ **Pane contents** - Terminal history and output
- ✅ **Neovim sessions** - Open files and cursor positions
- ✅ **Bash history** - Command history in each pane
- ✅ **Environment variables** - Shell environment state

### Auto-Save Settings
```bash
# Save interval (15 minutes)
set -g @continuum-save-interval '15'

# Auto-restore on tmux start
set -g @continuum-restore 'on'
```

### Neovim Integration
```bash
# Saves Neovim sessions with buffers and layout
set -g @resurrect-strategy-nvim 'session'
```

## 🔧 Advanced Usage

### Working with Multiple Projects
```bash
# Create project-specific sessions
tmux new-session -s frontend
tmux new-session -s backend
tmux new-session -s database

# Switch between sessions
Prefix + s  # Choose from list
# or
tmux switch-client -t frontend
```

### Session Templates
```bash
# Create development template session
tmux new-session -d -s template
tmux new-window -t template -n editor
tmux new-window -t template -n terminal
tmux new-window -t template -n git
tmux send-keys -t template:editor 'nvim .' Enter
tmux send-keys -t template:git 'git status' Enter
```

### Backup and Restore Files
Session data stored in:
```bash
~/.tmux/resurrect/  # Session save files
├── last            # Symlink to most recent save
├── tmux_resurrect_*.txt  # Individual save files
└── resurrect_session_fingerprint  # Session tracking
```

## 🚨 Troubleshooting

### Plugins Not Working?
```bash
# Check if TPM is installed
ls ~/.tmux/plugins/tpm

# Manually install plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh

# Reload tmux config
tmux source-file ~/.tmux.conf
```

### Sessions Not Saving?
```bash
# Check plugin status
ls ~/.tmux/plugins/

# Verify configuration
tmux show-options -g | grep resurrect

# Manual save to test
Prefix + Ctrl-s
```

### Restore Issues?
```bash
# Check saved sessions
ls ~/.tmux/resurrect/

# Force manual restore
Prefix + Ctrl-r

# Check for conflicts
tmux list-sessions
```

### Neovim Not Restoring?
```bash
# Ensure Session.vim plugin is available
nvim +checkhealth

# Manual session save in Neovim
:mksession! ~/.config/nvim/session.vim

# Restore session in Neovim
:source ~/.config/nvim/session.vim
```

## 💡 Tips & Best Practices

### Naming Conventions
```bash
# Use descriptive session names
tmux new-session -s project-frontend
tmux new-session -s client-backend
tmux new-session -s learning-python
```

### Organized Workflows
```bash
# Window naming for clarity
Prefix + ,  # Rename current window

# Typical development layout:
# Window 1: editor (nvim)
# Window 2: terminal (commands)
# Window 3: git (version control)
# Window 4: logs (monitoring)
```

### Performance Optimization
```bash
# Limit save frequency for better performance
set -g @continuum-save-interval '30'  # 30 minutes

# Disable pane contents if not needed
set -g @resurrect-capture-pane-contents 'off'
```

### Multi-Monitor Setup
```bash
# Session per monitor/project
tmux new-session -s monitor1-project
tmux new-session -s monitor2-tools

# Quick session switching
Prefix + s  # Session menu
Alt + (     # Previous session
Alt + )     # Next session
```

## 🎯 Common Workflows

### Daily Development Routine
```bash
# Morning: Start tmux (sessions auto-restore)
tmux

# During work: Sessions auto-save every 15 minutes
# (Work normally, no manual intervention needed)

# Evening: Detach session (keeps running)
Prefix + d

# Shutdown: Sessions persist through reboot
sudo reboot

# Next day: Start tmux (everything restored)
tmux attach-session -t development
```

### Project Switching
```bash
# Switch to different project
tmux switch-client -t other-project

# Or create new project session
tmux new-session -s new-project
```

### Collaboration
```bash
# Share session with team member
tmux new-session -s shared-session

# Both users attach to same session
tmux attach-session -t shared-session
```

---

## 📋 Quick Reference Card

| Action | Command |
|--------|---------|
| **Auto-save interval** | 15 minutes |
| **Auto-restore** | On tmux start |
| **Manual save** | `Prefix + Ctrl-s` |
| **Manual restore** | `Prefix + Ctrl-r` |
| **Reload config** | `Prefix + R` |
| **Install plugins** | `Prefix + I` |
| **Create session** | `tmux new-session -s name` |
| **List sessions** | `tmux ls` |
| **Attach session** | `tmux a -t name` |
| **Detach session** | `Prefix + d` |
| **Session menu** | `Prefix + s` |

🎉 **Your tmux sessions now survive reboots automatically!** Work with confidence knowing your development environment persists.