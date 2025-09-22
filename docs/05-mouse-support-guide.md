# 🖱️ Complete Mouse Support Guide

## Overview
Your setup has comprehensive mouse support enabled in both tmux and Neovim, making the transition from GUI editors much smoother.

## ✅ What Works with Mouse

### **In Tmux**
- **Click panes** - Switch focus instantly
- **Drag borders** - Resize panes visually
- **Scroll content** - Natural wheel scrolling
- **Select text** - Click and drag to select
- **Copy automatically** - Selected text goes to clipboard

### **In Neovim**
- **Click to position cursor** - Exactly where you click
- **Scroll through files** - Mouse wheel works
- **Select text** - Click and drag selection
- **Window navigation** - Click between vim windows
- **Plugin interactions** - Click in file trees, completion menus

## 🔧 Configuration Details

### Tmux Configuration (`.tmux.conf`)
```tmux
set -g mouse on                    # Enable mouse support
set -g set-clipboard on            # Clipboard integration

# Alt key navigation (works with mouse)
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
```

### Neovim Configuration (`options.lua`)
```lua
o.mouse = "a"                      # Enable mouse in all modes
```

## 🖱️ Mouse Actions Reference

### **Tmux Mouse Actions**
```
Left Click Pane          → Focus/switch to pane
Left Click Window Tab    → Switch to window
Drag Pane Border         → Resize pane
Scroll Wheel            → Scroll content up/down
Right Click             → Context menu (terminal dependent)
Double Click            → Select word
Triple Click            → Select line
Click + Drag            → Select text (copies to clipboard)
```

### **Neovim Mouse Actions**
```
Left Click              → Position cursor
Double Click            → Select word
Triple Click            → Select line
Click + Drag            → Visual selection
Scroll Wheel            → Scroll file up/down
Click Window Border     → Switch between vim windows
Click Plugin Areas      → Interact with file explorers, etc.
```

## 🎯 Practical Mouse Workflows

### **Development Workflow**
1. **Click tmux pane** with Neovim to focus
2. **Click in file** to position cursor
3. **Scroll with wheel** to navigate code
4. **Drag-select text** for copying
5. **Click bottom pane** to switch to terminal
6. **Click Claude pane** for AI assistance

### **Code Review Workflow**
1. **Click and drag** to select code blocks
2. **Mouse wheel** to scroll through changes
3. **Click different files** in file explorer
4. **Resize panes** by dragging borders for better view

### **Learning Workflow**
1. **Click tutorial text** to follow along
2. **Mouse select commands** to copy and try
3. **Scroll documentation** naturally
4. **Click between reference and practice areas**

## 🔄 Mouse + Keyboard Hybrid

### **Best of Both Worlds**
- **Mouse for navigation** - Quick positioning and selection
- **Keyboard for editing** - Efficient text manipulation
- **Mouse for window management** - Visual pane switching
- **Keyboard for commands** - Vim motions and shortcuts

### **When to Use Mouse vs Keyboard**

**Use Mouse For:**
- Initial cursor positioning
- Selecting large text blocks
- Switching between distant panes
- Resizing windows visually
- Scrolling through long files

**Use Keyboard For:**
- Precise text editing
- Vim motions (w, b, e, etc.)
- Command execution
- Fast navigation within files
- Repeated actions

## 🛠️ Troubleshooting Mouse Issues

### **Mouse Not Working in Tmux?**
```bash
# Check tmux version (needs 2.1+)
tmux -V

# Reload config
tmux source-file ~/.tmux.conf

# Check if mouse is enabled
tmux show-options -g mouse
```

### **Mouse Not Working in Neovim?**
```vim
" Check mouse setting
:set mouse?

" Should show: mouse=a

" Check if terminal supports mouse
:checkhealth
```

### **Selection Not Copying?**
```bash
# Install clipboard utilities
sudo pacman -S xclip

# Or alternative
sudo pacman -S xsel

# Test clipboard
echo "test" | xclip -selection clipboard
xclip -o -selection clipboard
```

### **Terminal-Specific Issues**

**In Alacritty:**
```yaml
# ~/.config/alacritty/alacritty.yml
mouse:
  hide_when_typing: false
```

**In Kitty:**
```ini
# ~/.config/kitty/kitty.conf
mouse_hide_wait 0
```

**In iTerm2 (macOS):**
- Preferences → Profiles → Terminal
- Enable "Mouse Reporting"

## 🎨 Customizing Mouse Behavior

### **Enhanced Tmux Mouse Config**
Add to `.tmux.conf`:
```tmux
# Better mouse wheel scrolling
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
bind -n WheelDownPane select-pane -t= \; send-keys -M

# Mouse drag to resize panes
bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -i -f -selection primary | xclip -i -selection clipboard"

# Double-click to select word
bind -T copy-mode-vi DoubleClick1Pane select-pane \; send-keys -X select-word
```

### **Enhanced Neovim Mouse Config**
Add to your Neovim config:
```lua
-- Better mouse wheel scrolling
vim.opt.mousescroll = "ver:3,hor:6"

-- Mouse shape in different modes
vim.opt.mouseshape = "i:beam,r:beam,s:updown,sd:cross,m:no,ml:up-arrow,v:rightup-arrow"
```

## 🚀 Advanced Mouse Features

### **Smart Pane Switching**
Your setup automatically detects whether you're at a window edge and switches between tmux panes and vim windows intelligently.

### **Clipboard Integration**
- **Auto-copy on selection** - Selected text automatically goes to clipboard
- **Cross-application paste** - Copy in tmux, paste in neovim (and vice versa)
- **System clipboard** - Works with external applications

### **Context-Aware Scrolling**
- **In code files** - Scrolls line by line
- **In terminal output** - Scrolls naturally
- **In plugin windows** - Appropriate scrolling behavior

## 🎯 Mouse Efficiency Tips

### **Quick Actions**
```
Double-click word       → Select word quickly
Triple-click           → Select entire line
Ctrl+click            → Multiple cursors (some plugins)
Shift+click           → Extend selection
Middle-click          → Paste (in some terminals)
```

### **Window Management**
```
Drag pane border      → Visual resize
Click tab bar         → Switch windows
Click status line     → Focus pane
Alt+click            → Additional actions (plugin dependent)
```

## 📊 Mouse vs Keyboard Speed Comparison

| Action | Mouse Time | Keyboard Time | Best Choice |
|--------|------------|---------------|-------------|
| Position cursor far away | 0.5s | 2-3s | Mouse |
| Edit current word | 2s | 0.5s | Keyboard |
| Select large block | 1s | 3-4s | Mouse |
| Navigate within file | 1s | 0.3s | Keyboard |
| Switch distant panes | 0.5s | 1-2s | Mouse |
| Repeat last action | N/A | 0.1s | Keyboard |

## 🎉 Embracing the Hybrid Approach

**The goal isn't to use only keyboard or only mouse**, but to use the best tool for each task:

- **Mouse** - Visual, spatial, selection-heavy tasks
- **Keyboard** - Text editing, repetitive actions, precise movements
- **Both** - A fluid combination based on the current need

Your setup makes this transition seamless - no mode switching or mental overhead required!

---

*💡 Pro Tip: Start mouse-heavy and gradually incorporate more keyboard shortcuts as you become comfortable. The mouse support removes the learning barrier while you build muscle memory for keyboard efficiency!*