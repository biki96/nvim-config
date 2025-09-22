# 🚀 Neovim Learning Guide & Commands

## 📚 Table of Contents
- [Basic Navigation](#basic-navigation)
- [Text Editing](#text-editing)
- [File Operations](#file-operations)
- [Search & Replace](#search--replace)
- [Visual Mode](#visual-mode)
- [Window Management](#window-management)
- [Plugin Commands](#plugin-commands)
- [LSP Commands](#lsp-commands)
- [Claude Code Integration](#claude-code-integration)
- [Advanced Workflows](#advanced-workflows)

---

## 🧭 Basic Navigation

### Movement Commands
```vim
h, j, k, l          " Basic movement (left, down, up, right)
w                   " Move forward by word
b                   " Move backward by word
e                   " Move to end of word
0                   " Move to beginning of line
^                   " Move to first non-blank character
$                   " Move to end of line
gg                  " Go to top of file
G                   " Go to bottom of file
:42                 " Go to line 42
Ctrl-f              " Page down
Ctrl-b              " Page up
Ctrl-d              " Half page down
Ctrl-u              " Half page up
```

### Quick Jumps
```vim
%                   " Jump to matching bracket/parenthesis
*                   " Search for word under cursor (forward)
#                   " Search for word under cursor (backward)
gd                  " Go to definition (LSP)
Ctrl-o              " Jump back to previous location
Ctrl-i              " Jump forward to next location
```

---

## ✏️ Text Editing

### Insert Mode
```vim
i                   " Insert before cursor
a                   " Insert after cursor
I                   " Insert at beginning of line
A                   " Insert at end of line
o                   " Open new line below
O                   " Open new line above
s                   " Delete character and insert
S                   " Delete line and insert
```

### Delete & Change
```vim
x                   " Delete character under cursor
dd                  " Delete entire line
dw                  " Delete word
d$                  " Delete to end of line
d0                  " Delete to beginning of line
cc                  " Change entire line
cw                  " Change word
c$                  " Change to end of line
r                   " Replace single character
R                   " Replace mode
```

### Copy & Paste
```vim
yy                  " Copy (yank) entire line
yw                  " Copy word
y$                  " Copy to end of line
p                   " Paste after cursor
P                   " Paste before cursor
"+y                 " Copy to system clipboard
"+p                 " Paste from system clipboard
Ctrl-c              " Copy to clipboard (custom mapping)
Ctrl-v              " Paste from clipboard (custom mapping)
```

### Undo & Redo
```vim
u                   " Undo
Ctrl-r              " Redo
.                   " Repeat last command
```

---

## 📁 File Operations

### Basic File Commands
```vim
:w                  " Save file
:w filename         " Save as filename
:q                  " Quit
:q!                 " Quit without saving
:wq                 " Save and quit
:x                  " Save and quit (only if modified)
ZZ                  " Save and quit
ZQ                  " Quit without saving
```

### File Explorer (Oil.nvim)
```vim
<leader>e           " Focus file explorer
-                   " Open oil.nvim (edit filesystem as buffer)
Enter               " Enter directory/open file
g?                  " Show help
```

### Fuzzy Finding (fzf-lua)
```vim
<leader>ff          " Find files
<leader>fg          " Live grep (search in files)
<leader>fb          " Find buffers
<leader>fh          " Find help tags
<leader>fo          " Find old files
<leader>fa          " Find all files (including hidden)
```

---

## 🔍 Search & Replace

### Search
```vim
/pattern            " Search forward
?pattern            " Search backward
n                   " Next search result
N                   " Previous search result
:noh                " Clear search highlights
Esc                 " Clear highlights (custom mapping)
```

### Replace
```vim
:s/old/new/         " Replace first occurrence in line
:s/old/new/g        " Replace all occurrences in line
:%s/old/new/g       " Replace all occurrences in file
:%s/old/new/gc      " Replace with confirmation
:10,20s/old/new/g   " Replace in lines 10-20
```

---

## 👁️ Visual Mode

### Visual Selection
```vim
v                   " Character-wise visual mode
V                   " Line-wise visual mode
Ctrl-v              " Block-wise visual mode
gv                  " Reselect last visual selection
```

### Visual Operations
```vim
d                   " Delete selection
y                   " Copy selection
c                   " Change selection
>                   " Indent selection
<                   " Unindent selection
=                   " Auto-indent selection
```

---

## 🪟 Window Management

### Window Operations
```vim
Ctrl-w s            " Split horizontally
Ctrl-w v            " Split vertically
Ctrl-w q            " Close window
Ctrl-w o            " Close all other windows
```

### Window Navigation
```vim
Ctrl-h              " Move to left window
Ctrl-j              " Move to down window
Ctrl-k              " Move to up window
Ctrl-l              " Move to right window
```

### Tmux Integration
```vim
" Seamless navigation between tmux panes and vim windows
Alt-Left            " Select pane left
Alt-Right           " Select pane right
Alt-Up              " Select pane up
Alt-Down            " Select pane down
```

---

## 🔌 Plugin Commands

### Lazy.nvim (Plugin Manager)
```vim
:Lazy               " Open Lazy interface
:Lazy sync          " Update plugins
:Lazy install       " Install plugins
:Lazy clean         " Remove unused plugins
:Lazy health        " Check plugin health
```

### Mason (LSP/Tool Manager)
```vim
:Mason              " Open Mason interface
:MasonInstall ruff  " Install specific tool
:MasonUninstall     " Uninstall tool
:MasonUpdate        " Update all tools
```

### Treesitter
```vim
:TSUpdate           " Update parsers
:TSInstall python   " Install specific parser
:TSPlayground       " Open treesitter playground
```

---

## 🧠 LSP Commands

### Code Navigation
```vim
gd                  " Go to definition
gD                  " Go to declaration
gi                  " Go to implementation
gr                  " Show references
K                   " Show hover documentation
Ctrl-k              " Show signature help
```

### Code Actions
```vim
<leader>ca          " Code actions
<leader>rn          " Rename symbol
<leader>f           " Format document
```

### Diagnostics
```vim
[d                  " Previous diagnostic
]d                  " Next diagnostic
<leader>q           " Open diagnostic list
```

---

## 🤖 Claude Code Integration

### Claude Commands
```vim
<leader>cc          " Open Claude Code
<leader>ct          " Toggle Claude Code terminal
```

### Terminal Usage
```vim
:terminal           " Open terminal
<leader>h           " New horizontal terminal
<leader>v           " New vertical terminal
Alt-h               " Toggle horizontal terminal
Alt-v               " Toggle vertical terminal
Alt-i               " Toggle floating terminal
Ctrl-x              " Exit terminal mode
```

---

## 🚀 Advanced Workflows

### Multi-cursor Editing
```vim
Ctrl-n              " Select next occurrence
Ctrl-p              " Select previous occurrence
Ctrl-x              " Skip current occurrence
```

### Macros
```vim
qa                  " Start recording macro 'a'
q                   " Stop recording
@a                  " Play macro 'a'
@@                  " Repeat last macro
```

### Marks
```vim
ma                  " Set mark 'a'
'a                  " Jump to mark 'a'
:marks              " Show all marks
```

### Registers
```vim
"ay                 " Yank to register 'a'
"ap                 " Paste from register 'a'
:registers          " Show all registers
```

---

## 📝 Practice Exercises

### Beginner Level
1. **Navigation Practice**: Open a file and practice moving with `h,j,k,l`, `w,b,e`, `0,$`
2. **Edit Practice**: Insert text, delete words/lines, copy/paste
3. **File Practice**: Open multiple files, switch between buffers

### Intermediate Level
1. **Search & Replace**: Find all instances of a word and replace
2. **Window Management**: Split windows, navigate between them
3. **Visual Mode**: Select text blocks, indent/unindent code

### Advanced Level
1. **LSP Workflow**: Navigate code with `gd`, `gr`, use code actions
2. **Plugin Mastery**: Use fuzzy finder efficiently, explore with oil.nvim
3. **Claude Integration**: Use Claude for code assistance while editing

---

## 🎯 Daily Workflow Tips

### Morning Setup
```bash
# Start tmux session
tmux new-session -d -s dev

# Create panes
tmux split-window -h        # Split horizontally
tmux select-pane -t 0       # Select left pane
nvim                        # Start Neovim

# In right pane: claude, logs, tests
```

### Efficient Editing
1. **Use relative line numbers**: `:set rnu` for quick jumps
2. **Master dot command**: `.` repeats last change
3. **Use text objects**: `ciw` (change inner word), `di"` (delete in quotes)
4. **Combine commands**: `d3w` (delete 3 words), `y2j` (yank 2 lines down)

### Code Development Cycle
1. **Navigate**: `<leader>ff` → find file
2. **Edit**: Use LSP commands (`gd`, `K`, `<leader>ca`)
3. **Test**: `<leader>h` → horizontal terminal → run tests
4. **Commit**: Use Claude Code for commit messages

---

## 🆘 Emergency Commands

```vim
:q!                 " Force quit without saving
:e!                 " Reload file (discard changes)
:set paste          " Enable paste mode
:set nopaste        " Disable paste mode
:checkhealth        " Check Neovim health
:verbose map <key>  " See what <key> is mapped to
```

---

## 📖 Learning Resources

1. **Built-in Help**: `:help <topic>` (e.g., `:help motion`)
2. **Vim Tutor**: Run `vimtutor` in terminal
3. **Practice**: Try [Vim Adventures](https://vim-adventures.com/)
4. **Cheat Sheet**: Keep this file handy!

---

*💡 Pro Tip: Start with basic navigation and editing. Add one new command to your workflow each day. Muscle memory takes time to develop!*