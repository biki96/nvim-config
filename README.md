# 🚀 Modern Neovim + Tmux Configuration (2025)

A complete, mouse-friendly, AI-enhanced development environment with seamless tmux integration.

## ✨ Features

- 🖱️ **Full mouse support** in both tmux and Neovim
- 🤖 **Claude Code integration** for AI-assisted development
- ⚡ **Modern plugins** - blink.cmp, oil.nvim, fzf-lua, avante.nvim
- 🧭 **Seamless navigation** between tmux panes and vim windows
- 🎨 **NvChad UI** with 2025 optimizations
- 📦 **Smart LSP setup** with Mason and modern vim.lsp.config
- 🔧 **Git integration** - 7 plugins for complete Git workflow
- 🔧 **Modular configuration** - easy to customize and extend

## 🎯 Quick Start

1. **Prerequisites completed** ✅ (pnpm, Claude CLI installed)
2. **Configuration installed** ✅ (symlinked to ~/.config/nvim)
3. **Start development environment:**

```bash
# Start tmux session
tmux new-session -s dev

# Open Neovim (plugins install automatically)
nvim

# Navigate with mouse clicks or Ctrl-h/j/k/l
# Find files: <space>ff
# Get AI help: <space>cc
```

## 📚 Documentation

Complete learning resources in the `docs/` directory:

- **[📖 Documentation Index](docs/00-documentation-index.md)** - Start here!
- **[🚀 Tmux + Neovim Tutorial](docs/01-tmux-nvim-tutorial.md)** - Mouse support & workflows
- **[📘 Complete Neovim Guide](docs/02-neovim-complete-guide.md)** - All commands reference
- **[⚡ Quick Reference](docs/03-quick-reference.md)** - Essential daily commands
- **[🏋️ Practice Exercises](docs/04-practice-exercises.md)** - Structured learning path
- **[🖱️ Mouse Support Guide](docs/05-mouse-support-guide.md)** - Complete mouse integration
- **[🔧 Git Integration Guide](docs/06-git-integration-guide.md)** - Professional Git workflow
- **[💻 Full-Stack Development Workflow](docs/08-fullstack-development-workflow.md)** - Complete project example

## 🎮 Key Bindings

### Essential Commands
```
<space>         Leader key
<space>ff       Find files
<space>fg       Find in files (grep)
<space>cc       Claude Code (horizontal)
<space>cv       Claude Code (vertical)
<space>ct       Claude Code (new tab)
```

### Navigation
```
Ctrl-h/j/k/l    Navigate panes/windows (tmux + nvim)
Alt-arrows      Alternative tmux navigation
Mouse click     Switch panes/position cursor
Mouse drag      Select text, resize panes
```

### LSP & Development
```
gd              Go to definition
K               Hover documentation
<leader>ca      Code actions
<leader>rn      Rename symbol
<leader>f       Format code
```

### Git Operations
```
<leader>gg      Neogit (visual Git interface)
<leader>gs      Git status
<leader>gc      Git commit
<leader>gp      Git push
]c              Next git hunk
<leader>hs      Stage hunk
<leader>gb      Toggle git blame
```

## 🛠️ Configuration Structure

```
├── init.lua                    # Main configuration entry
├── lua/
│   ├── configs/
│   │   ├── lazy.lua           # Plugin manager config
│   │   ├── clipboard.lua      # Copy/paste setup
│   │   ├── claude.lua         # AI integration
│   │   └── lsp.lua           # Language servers
│   └── plugins/
│       ├── init.lua          # Plugin loader
│       ├── ai.lua            # Claude + Avante
│       ├── completion.lua    # blink.cmp
│       ├── formatting.lua    # Conform (Ruff/Biome)
│       ├── lsp.lua           # Mason + LSP
│       ├── treesitter.lua    # Syntax highlighting
│       └── ui.lua           # Modern UI plugins
├── docs/                     # Complete documentation
└── .tmux.conf               # Tmux configuration
```

## 🎨 What Makes This Special

### **Beginner-Friendly**
- Mouse support eliminates the learning curve
- Comprehensive documentation with practice exercises
- Progressive learning path from basics to mastery

### **Modern & Fast**
- Latest Neovim 0.11+ features with vim.lsp.config
- Optimized plugins for 2025
- Fast fuzzy finding and completion

### **AI-Enhanced**
- Claude Code integration with multiple access methods
- Avante.nvim for Cursor-like AI assistance
- Seamless workflow between coding and AI consultation

### **Production-Ready**
- Complete LSP setup with Mason
- Formatting with Ruff (Python) and Biome (JS/TS)
- Modern completion with blink.cmp
- Robust error handling and fallbacks

## 🔧 Customization

The configuration is modular and easy to customize:

1. **Add plugins** - Edit files in `lua/plugins/`
2. **Modify keybindings** - Update `lua/mappings.lua`
3. **Adjust LSP** - Configure `lua/configs/lsp.lua`
4. **Customize tmux** - Edit `.tmux.conf`

All changes are version-controlled with git for easy rollback.

## 🆘 Troubleshooting

### Common Issues
- **Mouse not working?** Check [Mouse Support Guide](docs/05-mouse-support-guide.md)
- **LSP errors?** Run `:checkhealth` in Neovim
- **Claude Code issues?** Verify `claude` command works in terminal
- **Plugin errors?** Run `:Lazy sync` to update plugins

### Getting Help
- **In Neovim:** `:help <topic>` or `K` for hover docs
- **Documentation:** Comprehensive guides in `docs/`
- **AI assistance:** `<space>cc` for Claude Code

## 🎉 Learning Path

1. **Week 1:** Mouse navigation + basic editing ([Quick Reference](docs/03-quick-reference.md))
2. **Week 2:** Tmux integration + file management ([Tmux Tutorial](docs/01-tmux-nvim-tutorial.md))
3. **Week 3:** LSP features + AI assistance ([Complete Guide](docs/02-neovim-complete-guide.md))
4. **Week 4:** Advanced workflows + customization ([Practice Exercises](docs/04-practice-exercises.md))

## 🤝 Contributing

This configuration is designed to be shared and improved:

1. Make improvements to your local config
2. Document changes in the appropriate guide
3. Share useful workflows and tips
4. Help others learn this powerful setup

---

**Happy coding! 🚀** Your modern, mouse-friendly, AI-enhanced development environment is ready to use.

*Start with the [Documentation Index](docs/00-documentation-index.md) for a guided learning experience.*