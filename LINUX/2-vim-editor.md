# $$\color{blue}\textbf{Vi / Vim Editor}$$

## $$\color{green}\textbf {Modes of vi/vim editor:}$$
1. **$$\color{red}\textbf{Command Mode(default)}$$**
2. **$$\color{orange}\textbf{Insert Mode}$$**
3. **$$\color{purple}\textbf{Execution Mode}$$**
4. **$$\color{brown}\textbf{Visual Mode}$$**

### $$\color{blue}\textbf{Note:}$$
Press `Esc` to exit from any mode.

---

## $$\color{red}\textbf{1. Command Mode}$$ (Default Mode)
In **Command Mode**, you can perform operations like deleting, copying, and pasting text, as well as navigating and editing the file. 

### Common Commands:
- dd  Delete current line
- dw  Delete current word
- <n>dd  Delete `n` number of lines from the current line
- yy  Copy current line
- yw  Copy current word
- <n>yy  Copy `n` number of lines from the current line
- cc  Cut current line and enter insert mode
- cw  Cut current word and enter insert mode
- <n>cc  Cut `n` number of lines and enter insert mode
- P  Paste copied or cut content
- u  Undo last action
- Ctrl+r  Redo last undone action

### Navigation:
- G or L  Move cursor to the end of the file
- gg or H  Move cursor to the beginning of the file
- <n>gg  Move cursor to the `n`th line
  

---

## $$\color{orange}\textbf{2. Insert Mode}$$

To enter **Insert Mode**, use the following commands:

- i  Insert text at the current cursor position
- I  Insert text at the start of the current line
- a  Insert text just after the current character
- A  Insert text at the end of the current line
- o  Insert a new line below the current line
- O  Insert a new line above the current line

---

## $$\color{purple}\textbf{3. Execution Mode}$$

In **Execution Mode**, you can issue commands to save, quit, and modify settings of the file.

### Common Commands:
- :q  Quit without saving
- :q!  Quit without saving, forcefully
- :w  Save and stay in the file
- :wq  Save and quit
- :x  Save and quit
- :wq!  Save and quit, forcefully
- :set nu  Enable line numbers
- :<n>  Jump to the `n`th line
- :set nonu  Disable line numbers
- /<word>  Highlight a specific word
- :nohl  Remove highlight
- :%s/old word /new word      Find and replace old word with new word
- :!<command>  Execute a terminal command without leaving the editor

---

## $$\color{brown}\textbf{4. Visual Mode}$$

In **Visual Mode**, you can select text to copy, cut, or paste.

### Selection Commands:
- v: Select text character by character
- V: Select text line by line
- Ctrl+v: Select a block of text

### Operations on Selected Text:
- y: Copy selected text
- d: Delete selected text
- c: Cut selected text
- P: Paste the selected text

---
