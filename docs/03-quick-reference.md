# ⚡ Neovim Quick Reference

## 🚀 Essential Commands (Learn These First!)

### Movement (Navigation)
```
h j k l     ← ↓ ↑ →
w           Next word
b           Previous word
0           Start of line
$           End of line
gg          Top of file
G           Bottom of file
```

### Editing
```
i           Insert mode
a           Append
o           New line below
Esc         Exit insert mode
dd          Delete line
yy          Copy line
p           Paste
u           Undo
Ctrl-r      Redo
```

### Files
```
:w          Save
:q          Quit
:wq         Save & quit
:q!         Quit without saving
```

---

## 🔧 Your Custom Setup Commands

### File Navigation
```
<leader>ff  Find files (telescope)
<leader>fg  Find in files (telescope - needs ripgrep)
<leader>fb  Find buffers (telescope)
<leader>Ff  Find files (fzf-lua - faster)
<leader>Fg  Find in files (fzf-lua)
<leader>Fb  Find buffers (fzf-lua)
<leader>e   Focus file explorer
-           Open oil.nvim (edit filesystem)
```

### Claude Code Integration
```
<C-,>       Toggle Claude Code (default)
<leader>cc  Toggle Claude Code (custom)
<leader>cv  Continue conversation
<leader>cC  Continue conversation (default)
<leader>cV  Verbose mode (default)
```

### Terminal
```
<leader>h   Horizontal terminal
<leader>v   Vertical terminal
Alt-h       Toggle horizontal terminal
Alt-i       Toggle floating terminal
Ctrl-x      Exit terminal mode
```

### LSP (Code Intelligence)
```
gd          Go to definition
K           Show documentation
<leader>ca  Code actions
<leader>rn  Rename symbol
<leader>f   Format code
```

### Git Integration
```
<leader>gg  Neogit (visual Git interface)
<leader>gs  Git status
<leader>gd  Git diff
<leader>gc  Git commit
<leader>gp  Git push
<leader>gl  Git pull
]c          Next git hunk
[c          Previous git hunk
<leader>hs  Stage hunk
<leader>hr  Reset hunk
<leader>gb  Toggle git blame
```

### Window Management
```
Ctrl-h      Move left window
Ctrl-j      Move down window
Ctrl-k      Move up window
Ctrl-l      Move right window
```

---

## 💡 Quick Start Workflow

**First time setup**: Install ripgrep for search: `sudo pacman -S ripgrep`

1. **Open Neovim**: `nvim` (plugins will install automatically)
2. **Initialize Git** (if needed): `<leader>h` then `git init`
3. **Find file**: `<space>ff` then type filename
4. **Edit code**: `i` to insert, `Esc` when done
5. **Save**: `:w`
6. **Git status**: `<space>gg` (Neogit interface)
7. **Get help**: `K` on any code symbol
8. **Open Claude**: `<space>cc` for AI assistance

**If ripgrep not installed**: Use capital letter alternatives (`<space>Ff`, `<space>Fg`)
**If Git not initialized**: Follow [Git Repository Setup](07-git-repository-setup.md)

---

## 🎯 Learning Path

### Week 1: Basics
- [ ] Master `h j k l` navigation
- [ ] Learn `i a o` for inserting
- [ ] Practice `dd yy p` for delete/copy/paste
- [ ] Use `:w :q` for file operations

### Week 2: Efficiency
- [ ] Use `w b 0 $` for word movement
- [ ] Learn `<leader>ff` for file finding
- [ ] Try `gd K` for code navigation
- [ ] Use `<leader>cc` for Claude help

### Week 3: Power User
- [ ] Master visual mode `v V`
- [ ] Learn search `/` and replace `:%s`
- [ ] Use LSP commands `<leader>ca <leader>rn`
- [ ] Practice terminal workflow

---

## 🆘 Emergency Help

```
:help       Open help
:q!         Force quit
Esc Esc     Get out of any mode
:checkhealth Check if everything works
```

---

*🎯 Focus on the "Essential Commands" first. Everything else can wait!*