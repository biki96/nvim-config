# 🔧 Complete Git Integration Guide

Your Neovim setup now includes comprehensive Git support with multiple powerful plugins working together seamlessly.

## 🚀 Git Plugins Included

### **1. Gitsigns** - Buffer Git Integration
- **Visual indicators** in the sign column
- **Hunk navigation** and management
- **Inline blame** and diff preview
- **Stage/unstage** individual hunks

### **2. Fugitive** - Complete Git Wrapper
- **Full Git interface** within Neovim
- **All Git commands** available as `:Git <command>`
- **Diff splitting** and merge resolution
- **Git log** and history browsing

### **3. Neogit** - Magit-like Interface
- **Visual Git interface** similar to Emacs Magit
- **Interactive staging** and committing
- **Branch management** with visual indicators
- **Integrated with Telescope** and Diffview

### **4. Diffview** - Advanced Diff Viewer
- **Side-by-side diffs** with file tree
- **Merge conflict resolution** interface
- **File history** with commit navigation
- **Beautiful diff highlighting**

### **5. Git Blame** - Advanced Blame Annotations
- **Virtual text blame** with author/date
- **Toggle on/off** as needed
- **Customizable format** and display

### **6. Git Conflict** - Merge Conflict Helper
- **Conflict markers** highlighting
- **Quick resolution** commands
- **Navigation** between conflicts
- **Choose sides** easily

### **7. Gitlinker** - Generate Git URLs
- **Copy links** to current line/selection
- **GitHub, GitLab, Bitbucket** support
- **Share code** easily with others

---

## 🎯 Essential Git Commands

### **Quick Git Operations**
```
<leader>gs      Git status (Fugitive)
<leader>gg      Neogit interface (visual Git)
<leader>gc      Git commit
<leader>gp      Git push
<leader>gl      Git pull
<leader>gf      Git fetch
```

### **Diff and Review**
```
<leader>gd      Git diff split
<leader>gv      Open diffview
<leader>gV      Close diffview
<leader>gh      File history
<leader>gH      Current file history
```

### **Hunk Management (Gitsigns)**
```
]c              Next git hunk
[c              Previous git hunk
<leader>hs      Stage hunk
<leader>hr      Reset hunk
<leader>hp      Preview hunk
<leader>hb      Blame line
<leader>hu      Undo stage hunk
```

### **Advanced Operations**
```
<leader>gb      Toggle git blame
<leader>gy      Copy git link (current line)
<leader>gB      Git branches (Telescope)
<leader>gS      Git status (Telescope)
<leader>gT      Git stash (Telescope)
```

---

## 🔍 Visual Git Indicators

### **Sign Column Indicators**
```
│    Added lines
│    Modified lines
_    Deleted lines
‾    Top deleted
~    Changed/deleted
┆    Untracked files
```

### **Conflict Markers**
```
<<<<<<< HEAD        Current changes (ours)
=======             Separator
>>>>>>> branch      Incoming changes (theirs)
```

---

## 🛠️ Workflows

### **Daily Development Workflow**

**1. Check Status**
```bash
# In Neovim
<leader>gs          # Quick fugitive status
# or
<leader>gg          # Visual Neogit interface
```

**2. Review Changes**
```bash
<leader>gd          # Split diff view
# or
<leader>gv          # Full diffview interface
```

**3. Stage Changes**
```bash
# Hunk by hunk
]c                  # Navigate to next hunk
<leader>hp          # Preview hunk
<leader>hs          # Stage hunk

# Or use Neogit visual interface
<leader>gg          # Open Neogit
# Use 's' to stage, 'u' to unstage
```

**4. Commit**
```bash
<leader>gc          # Git commit
# or
<leader>gC          # Neogit commit (with better interface)
```

**5. Push/Pull**
```bash
<leader>gp          # Git push
<leader>gl          # Git pull
```

### **Code Review Workflow**

**1. View File History**
```bash
<leader>gh          # All file history
<leader>gH          # Current file history
```

**2. Blame Investigation**
```bash
<leader>gb          # Toggle blame view
<leader>hb          # Blame current line (detailed)
```

**3. Compare Branches**
```bash
:DiffviewOpen main..feature-branch
# or
<leader>gB          # Browse branches with Telescope
```

**4. Share Code**
```bash
# Select code in visual mode
<leader>gy          # Copy GitHub/GitLab link
```

### **Merge Conflict Resolution**

**1. Open Files with Conflicts**
```bash
<leader>gg          # Neogit shows conflicts clearly
# or
<leader>gv          # Diffview for visual resolution
```

**2. Navigate Conflicts**
```bash
]x                  # Next conflict
[x                  # Previous conflict
```

**3. Resolve Conflicts**
```bash
<leader>co          # Choose ours (current branch)
<leader>ct          # Choose theirs (incoming branch)
<leader>cb          # Choose both
<leader>c0          # Choose none (manual edit)
```

**4. Complete Merge**
```bash
<leader>gc          # Commit the merge
```

---

## 🎨 Advanced Features

### **Interactive Staging with Neogit**
1. Open Neogit: `<leader>gg`
2. Navigate with `j/k`
3. Stage files/hunks with `s`
4. Unstage with `u`
5. Commit with `c`
6. Push with `P`

### **Advanced Diffview Usage**
```bash
# Compare specific commits
:DiffviewOpen HEAD~2

# Compare branches
:DiffviewOpen main..develop

# View file history with commits
:DiffviewFileHistory

# Close all diffview tabs
:DiffviewClose
```

### **Fugitive Power Commands**
```bash
:Git log --oneline          # Compact log
:Git log --graph            # Visual branch graph
:Git checkout -b feature    # Create new branch
:Git rebase -i HEAD~3       # Interactive rebase
:Gwrite                     # Stage current file
:Gread                      # Discard changes (checkout HEAD)
```

### **Blame Customization**
```lua
-- Toggle blame format
:GitBlameToggle

-- Blame shows:
-- • Summary • Date • Author • SHA
```

---

## 🔧 Customization Examples

### **Custom Git Aliases in Neovim**
Add to your git config or create custom commands:

```lua
-- In your config
vim.api.nvim_create_user_command('Gco', 'Git checkout', {})
vim.api.nvim_create_user_command('Gb', 'Git branch', {})
vim.api.nvim_create_user_command('Gst', 'Git status', {})
```

### **Enhanced Gitsigns Configuration**
```lua
-- Enable current line blame by default
require('gitsigns').setup({
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 500,
  },
})
```

---

## 🚀 Pro Tips

### **Efficiency Tips**
1. **Use Neogit** for complex operations (merging, rebasing)
2. **Use Fugitive** for quick Git commands
3. **Use Gitsigns** for hunk-level operations
4. **Use Diffview** for reviewing large changes
5. **Use Gitlinker** for sharing code snippets

### **Navigation Tips**
```bash
# In Fugitive status window
<Enter>             # Edit file under cursor
o                   # Open in split
O                   # Open in tab
-                   # Stage/unstage file
cc                  # Create commit
ca                  # Amend last commit
```

### **Conflict Resolution Tips**
1. **Use Diffview** for visual merge conflicts
2. **Use 3-way merge** with `:Git mergetool`
3. **Stage resolved** files with `<leader>hs`
4. **Verify resolution** with `<leader>gd`

---

## 🔍 Troubleshooting

### **Common Issues**

**Gitsigns not showing?**
```bash
:Gitsigns refresh
# or
:checkhealth gitsigns
```

**Fugitive commands not working?**
```bash
# Make sure you're in a git repository
:Git status
# Should show repository status
```

**Diffview not opening?**
```bash
# Check if in git repository
:pwd
:!git status
```

**Blame not working?**
```bash
:GitBlameToggle
# or check if file is tracked
:!git log -- %
```

### **Performance Issues**
```bash
# For large repositories, disable some features
:lua require('gitsigns').setup({max_file_length = 10000})
```

---

## 📚 Learning Path

### **Week 1: Basics**
- [ ] Learn `<leader>gs` for status
- [ ] Use `]c` and `[c` for hunk navigation
- [ ] Practice `<leader>hs` and `<leader>hr` for staging
- [ ] Try `<leader>gc` for commits

### **Week 2: Visual Interfaces**
- [ ] Explore Neogit with `<leader>gg`
- [ ] Use Diffview with `<leader>gv`
- [ ] Practice conflict resolution
- [ ] Learn blame features with `<leader>gb`

### **Week 3: Advanced Features**
- [ ] Master file history with `<leader>gh`
- [ ] Use Gitlinker for sharing code
- [ ] Explore Fugitive's advanced commands
- [ ] Customize your Git workflow

---

## 🎯 Quick Reference Card

### **Daily Commands**
```
<leader>gg    Neogit (visual Git interface)
<leader>gs    Git status
<leader>gd    Git diff
<leader>gc    Git commit
<leader>gp    Git push
<leader>gl    Git pull
```

### **Hunk Operations**
```
]c            Next hunk
[c            Previous hunk
<leader>hs    Stage hunk
<leader>hr    Reset hunk
<leader>hp    Preview hunk
```

### **Advanced**
```
<leader>gb    Toggle blame
<leader>gv    Open diffview
<leader>gy    Copy git link
<leader>co    Choose ours (conflict)
<leader>ct    Choose theirs (conflict)
```

---

*🎉 Your Git integration is now complete! You have professional-grade Git tools built right into your Neovim workflow. Start with the basic commands and gradually explore the advanced features.*