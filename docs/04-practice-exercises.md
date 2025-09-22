# 🏋️ Neovim Practice Exercises

## 🎯 Daily Practice Routine (15 minutes)

### Day 1-3: Basic Movement
```
Exercise 1: h j k l Navigation
- Open any text file
- Move around without using arrow keys for 5 minutes
- Goal: Stop thinking about which key to press

Exercise 2: Word Movement
- Use w (next word) and b (previous word)
- Practice e (end of word)
- Navigate through a paragraph using only w and b

Exercise 3: Line Navigation
- Use 0 (start) and $ (end) to move within lines
- Practice ^ (first non-blank character)
- Combine with word movement: w w w $ 0 b b
```

### Day 4-7: Basic Editing
```
Exercise 4: Insert Modes
- Practice i (insert), a (append), o (new line)
- Type a sentence using each mode
- Use I (insert at start) and A (append at end)

Exercise 5: Delete and Copy
- Delete words with dw
- Delete lines with dd
- Copy lines with yy and paste with p
- Practice x (delete character)

Exercise 6: Undo/Redo
- Make changes, use u to undo
- Use Ctrl-r to redo
- Practice the . (dot) command to repeat actions
```

---

## 🔥 Challenge Exercises

### Challenge 1: Text Navigation Race
**Setup**: Open NEOVIM_LEARNING_GUIDE.md
**Goal**: Navigate to specific sections as fast as possible

```
Tasks:
1. Go to line 50 (:50)
2. Find "Visual Mode" section (/Visual Mode)
3. Jump to end of file (G)
4. Go back to top (gg)
5. Find the word "plugin" (*/plugin)

Time yourself! Goal: Under 30 seconds
```

### Challenge 2: Edit Like a Pro
**Setup**: Create a new file with some code
**Goal**: Make these edits efficiently

```
Starting text:
function getUserData() {
    let user = "john"
    let age = 25
    return user
}

Tasks:
1. Change "getUserData" to "getUser" (use cw on the word)
2. Add "Name" after "user" in the variable name
3. Delete the age line entirely (dd)
4. Add a new line with: let email = "john@example.com"
5. Change the return to: return {user, email}

Practice until you can do this in under 1 minute!
```

### Challenge 3: Search and Replace Master
**Setup**: Create a file with repeated text
**Goal**: Master find and replace

```
Starting text:
console.log("debug message 1")
console.log("debug message 2")
console.log("debug message 3")
let debug = true
if (debug) console.log("more debug")

Tasks:
1. Replace all "console.log" with "logger.info"
2. Replace all "debug" with "verbose"
3. Find all instances of "message" (use *)
4. Replace only the first "logger.info" with "console.warn"

Commands to practice:
:%s/console.log/logger.info/g
:%s/debug/verbose/g
/message
:s/logger.info/console.warn/
```

---

## 🧪 Real-World Scenarios

### Scenario 1: Code Review
**Setup**: Open a Python/JavaScript file
**Goal**: Navigate and understand code structure

```
Tasks:
1. Find all function definitions (/def or /function)
2. For each function:
   - Use gd to go to definition
   - Use K to see documentation
   - Use gr to find references
3. Navigate between functions using Ctrl-o and Ctrl-i
4. Use <leader>ca to see available code actions
```

### Scenario 2: Refactoring
**Setup**: Code with repeated variable names
**Goal**: Rename consistently

```
Example code:
let userData = fetchUser()
processUserData(userData)
saveUserData(userData)

Tasks:
1. Use gd on "userData" to see all instances
2. Use <leader>rn to rename "userData" to "user"
3. Verify all instances were changed
4. Use LSP to check for any errors
```

### Scenario 3: File Management
**Setup**: Project with multiple files
**Goal**: Efficient file navigation

```
Tasks:
1. Use <leader>ff to find a specific file
2. Open multiple files in buffers
3. Use <leader>fb to switch between buffers
4. Use oil.nvim (-) to browse filesystem
5. Create a new file from within oil.nvim
```

---

## 🎮 Fun Mini-Games

### Game 1: Motion Race
Set a timer for 2 minutes. In a text file:
- Count how many times you can go to start of line (0) and end ($ )
- Goal: 50+ times

### Game 2: Edit Olympics
Time yourself doing these edits in sequence:
1. Insert "Hello" at start of line (I)
2. Append "World" at end (A)
3. Create new line below (o)
4. Delete the new line (dd)
5. Undo everything (u u u)

### Game 3: Search Speedrun
In a large file:
1. Find 5 different words using /
2. Use n and N to navigate results
3. Clear highlights with Esc
4. Repeat with new words

---

## 📊 Progress Tracking

### Week 1 Goals
- [ ] Navigate without arrow keys
- [ ] Basic editing (insert, delete, copy/paste)
- [ ] Save and quit files confidently
- [ ] Use <leader>ff to find files

### Week 2 Goals
- [ ] Efficient word movement (w, b, e)
- [ ] Search with / and replace with :s
- [ ] Use LSP commands (gd, K)
- [ ] Basic window management

### Week 3 Goals
- [ ] Visual mode selections
- [ ] Advanced search and replace
- [ ] Plugin commands (Mason, Lazy)
- [ ] Terminal integration

### Week 4 Goals
- [ ] Custom workflows with tmux
- [ ] Efficient Claude Code integration
- [ ] Macros and advanced editing
- [ ] Help others with Vim! 🎉

---

## 💪 Muscle Memory Builders

### 5-Minute Drills
**Do these every day for muscle memory:**

```
Drill 1: hjkl (2 minutes)
- Navigate a text file using only hjkl
- No arrow keys allowed!

Drill 2: Word Dance (1 minute)
- w w w b b e w b (repeat pattern)

Drill 3: Line Jumps (1 minute)
- 0 $ 0 $ ^ $ (repeat)

Drill 4: Edit Cycle (1 minute)
- i [type] Esc dd yy p u (repeat)
```

---

## 🏆 Graduation Test

**You've mastered Neovim when you can:**

1. **Navigation**: Move to any part of a file in under 5 seconds
2. **Editing**: Make complex edits without thinking about commands
3. **Files**: Open, edit, and save files smoothly
4. **LSP**: Use code intelligence naturally
5. **Workflow**: Integrate Neovim into your daily development

**Final Challenge**: Edit a real project file and make a meaningful contribution using only Neovim. Time limit: No limit - it should feel natural!

---

*🎯 Remember: Consistency beats intensity. 15 minutes of daily practice is better than 2 hours once a week!*