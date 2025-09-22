# 🔧 Git Repository Setup Guide

Learn how to create and manage Git repositories directly from within Neovim using the built-in Git integration.

## 🚀 Creating a New Git Repository

### **Method 1: Initialize from Neovim Terminal**

1. **Open Neovim in your project directory:**
```bash
# Navigate to your project
cd /path/to/your/project

# Start Neovim
nvim
```

2. **Open a terminal in Neovim:**
```vim
<leader>h          # Horizontal terminal
# or
<leader>v          # Vertical terminal
# or
:terminal          # Manual terminal
```

3. **Initialize Git repository:**
```bash
git init
git add .
git commit -m "Initial commit"
```

4. **Exit terminal mode and test Git features:**
```vim
Ctrl-x             # Exit terminal mode
<leader>gg         # Open Neogit (should now work!)
```

### **Method 2: Using Fugitive Commands**

1. **Open Neovim in any directory:**
```bash
nvim
```

2. **Initialize repository with Fugitive:**
```vim
:!git init                    # Initialize repository
:!git add .                   # Add all files
:Git commit -m "Initial commit"   # Create first commit
```

3. **Now Git features are active:**
```vim
<leader>gs         # Git status
<leader>gg         # Neogit interface
```

### **Method 3: Complete Setup from Neovim**

1. **Create project structure:**
```vim
:!mkdir my-new-project
:cd my-new-project
:edit README.md
```

2. **Add initial content:**
```markdown
# My New Project

This is a new project created with Neovim!

## Getting Started

- Edit files with Neovim
- Use Git integration for version control
- Enjoy the workflow!
```

3. **Save and initialize Git:**
```vim
:w                                    # Save README.md
:!git init                           # Initialize repository
:!git add README.md                  # Add README
:Git commit -m "Initial commit"      # First commit
```

4. **Test Git integration:**
```vim
<leader>gg         # Open Neogit
<leader>gs         # Git status
```

---

## 📁 Setting Up Your nvim-config as Git Repository

Since you want to version-control your Neovim configuration:

### **Initialize nvim-config Repository:**

1. **Navigate to config directory:**
```bash
cd /home/biki/projects/shared/configs/nvim-config
```

2. **Open Neovim:**
```bash
nvim README.md
```

3. **Initialize Git from Neovim terminal:**
```vim
<leader>h          # Open horizontal terminal

# In terminal:
git init
git add .
git commit -m "Initial Neovim configuration

- Complete 2025 setup with NvChad
- Mouse support enabled
- Git integration added
- Claude Code integration
- Comprehensive documentation"
```

4. **Exit terminal and test:**
```vim
Ctrl-x             # Exit terminal
<leader>gg         # Open Neogit - should show your config files!
```

### **Add Remote Repository (Optional):**

1. **Create repository on GitHub/GitLab**

2. **Add remote from Neovim:**
```vim
<leader>h          # Terminal

# Add remote
git remote add origin https://github.com/yourusername/nvim-config.git
git branch -M main
git push -u origin main
```

---

## 🎯 Working with Git in Neovim

### **Daily Git Workflow from Neovim:**

**1. Check Status:**
```vim
<leader>gg         # Visual Neogit interface
# or
<leader>gs         # Fugitive status
```

**2. Review Changes:**
```vim
]c                 # Next hunk
[c                 # Previous hunk
<leader>hp         # Preview hunk
<leader>gd         # Diff view
```

**3. Stage Changes:**
```vim
<leader>hs         # Stage current hunk
# or in Neogit:
<leader>gg         # Open Neogit
s                  # Stage file/hunk (in Neogit)
```

**4. Commit:**
```vim
<leader>gc         # Git commit
# or
<leader>gC         # Neogit commit (better interface)
```

**5. Push/Pull:**
```vim
<leader>gp         # Git push
<leader>gl         # Git pull
```

### **Advanced Repository Management:**

**Create and Switch Branches:**
```vim
:Git checkout -b feature/new-feature
:Git switch main
<leader>gB         # Browse branches (Telescope)
```

**Merge Branches:**
```vim
:Git merge feature/new-feature
<leader>gm         # Git merge
```

**Resolve Conflicts:**
```vim
<leader>gv         # Open Diffview for conflicts
<leader>co         # Choose ours
<leader>ct         # Choose theirs
<leader>cb         # Choose both
```

**View History:**
```vim
<leader>gh         # File history
<leader>gH         # Current file history
<leader>gL         # Git log
```

---

## 🔄 Converting Existing Project to Git

### **If You Have an Existing Project:**

1. **Open project in Neovim:**
```bash
cd /path/to/existing/project
nvim
```

2. **Check if Git exists:**
```vim
:!git status       # Check if already a repository
```

3. **If not a repository, initialize:**
```vim
<leader>h          # Open terminal

git init
git add .
git commit -m "Convert existing project to Git

- Add version control to existing project
- Ready for collaboration and backup"
```

4. **Add .gitignore if needed:**
```vim
:edit .gitignore
```

Add appropriate ignores:
```gitignore
# Dependencies
node_modules/
__pycache__/
*.pyc

# IDE
.vscode/
.idea/

# OS
.DS_Store
Thumbs.db

# Logs
*.log
```

5. **Update repository:**
```vim
:w                 # Save .gitignore
<leader>hs         # Stage .gitignore
<leader>gc         # Commit changes
```

---

## 🎨 Repository Templates

### **Project Structure Templates:**

**Python Project:**
```
my-python-project/
├── README.md
├── requirements.txt
├── .gitignore
├── src/
│   └── main.py
└── tests/
    └── test_main.py
```

**Setup in Neovim:**
```vim
:!mkdir -p my-python-project/{src,tests}
:cd my-python-project
:edit README.md
# Add content, then:
:edit requirements.txt
:edit .gitignore
:edit src/main.py
:edit tests/test_main.py

# Initialize Git
<leader>h
git init
git add .
git commit -m "Initial Python project setup"
```

**Web Project:**
```
my-web-project/
├── README.md
├── package.json
├── .gitignore
├── src/
│   ├── index.html
│   ├── style.css
│   └── script.js
└── docs/
```

---

## 🚀 Quick Start Scripts

### **Create New Repository Script:**

Create this workflow in Neovim:

```vim
" Function to setup new Git project
function! SetupNewProject(name)
  execute '!mkdir ' . a:name
  execute 'cd ' . a:name
  edit README.md
  " Add template content
  put ='# ' . a:name
  put =''
  put ='## Description'
  put =''
  put ='## Getting Started'
  write

  " Initialize Git
  !git init
  execute '!git add README.md'
  execute '!git commit -m "Initial commit"'

  " Open Neogit
  Neogit
endfunction

" Command to use the function
command! -nargs=1 NewProject call SetupNewProject(<q-args>)
```

**Usage:**
```vim
:NewProject my-awesome-project
```

---

## 🔧 Troubleshooting

### **Common Issues:**

**"Not a git repository" error:**
```vim
# Check current directory
:pwd

# Initialize if needed
:!git init
```

**No changes showing in Gitsigns:**
```vim
# Refresh Gitsigns
:Gitsigns refresh

# Check if file is tracked
:!git status %
```

**Fugitive commands not working:**
```vim
# Ensure you're in a Git repository
:!git status

# Check Fugitive installation
:checkhealth fugitive
```

**Neogit not opening:**
```vim
# Check if in Git repository
:!git status

# Manual Neogit load
:lua require('neogit').open()
```

---

## 📚 Next Steps

1. **Practice** initializing repositories in Neovim
2. **Explore** the visual Git interfaces (Neogit, Diffview)
3. **Learn** advanced Git workflows
4. **Customize** Git settings for your needs

**Pro Tip:** Start by making your nvim-config a Git repository - it's perfect for practicing Git workflows since you'll be making changes to it regularly! 🚀

---

*💡 Remember: Git integration only works inside Git repositories. Always initialize (`git init`) or navigate to an existing repository before using Git features in Neovim.*