Since I am in the process of learning vim/nvim, I thought it would be better to collect a little material for quick reference in future, if nedeed.

<!-- `table = {}` --lua uses tables in place of list 
`local var_name = 34 or "johny_dew"` or etc. -- variable declaration -->

# Vim Motions
g -> go
    H – Move to the top of the screen. Note that it doesn’t always mean moving to the first line in the file. It’s just for moving to the top of the visible screen.
    L – Move to the bottom of the screen. Note that it doesn’t always mean moving to the last line in the file. It’s just for moving to the bottom of the visible screen.
    M – Move to the middle of the screen.
    [[ – Move to the first line of the file. You can also ue gg here.
    ]] – Move to the last line of the file. You can also use G here.
    nG – Move to line number n. Note that you won’t see anything on the screen while typing the line numbers.
    10g - go to line 10

# pg up & pg down
<C-f> pg down
<C-b> pg up

# Yanking 
    yiw - yank the current word
    yw - yank from the current cursor location to start of next word
    yb - yank from current cursor location to the end of the previous word
    yy - yank the whole line (along with the newline character)
    4yy - yank 4 lines (along with the newline character)
    y$ - yank from the current cursor location to the end of the line
    y_ - - yank from the current cursor location to the start of the line


# Deleting
Delete lines that match a certain pattern
Apart from all these Vim wizardry, did you know that you could delete lines that matched a particular pattern?

Well, you can, and here is the syntax.

    :g/PATTERN/d
To do the opposite of this, deleting the lines that do not match the specified pattern, you can use the syntax specified down below.

    :g!/PATTERN/d
Breaking this down, we get the following elements:

    g - search globally (i.e. the entire file)
    ! - reverse match
    PATTERN - the pattern to match
    d - delete command
If you run the following command in Vim, it will remove all the lines that have "extern crate" pattern in the line.

    :g/extern\ crate/d

### Delete all empty lines
    :g/^$/d

# Substitution
    :[range]s/{pattern}/{string}/[flags] [count]
    
    range : This part of the syntax can be used if you want the substitution between said lines. If you do not mention a range, it will only substitute text on the current line.
    pattern : Here is where you specify the text that you want to replace.
    string : This is the string which will replace the pattern.
    flags :     To replace all occurrences of the search pattern, use the g flag.
                You can specify if you want the match to ignore case, use i flag.
                To manually confirm each search and replace operation, use the c flag.
    count : Number of lines to replace text in.

    Range	Description
    .	    Current line
    $	    Last line
    %	    All lines
    x	    Line number x
    .,+x	From current line until additional x lines

    :45,78s/#/     -> it will remove # from line 45 to 78

## :%s/Hello/HI/gc   -> replace with confirmation 
    replace with HI (y/n/a/q/l/^E/^Y)?
    The options from the prompt have the following meaning:
        y: yes
        n: no
        a: all
        q: quit without substituting, but it does not undo once you have already substituted text
        l: substitute this and exit (think of 'last')
        ^E: Scroll up (does not work in vim-tiny)
        ^Y: Scroll down (does not work in vim-tiny)

## :%s/hello/HI/gi -> case insensitive substituition


# Cheat trick
while using vim/nvim press `Ctrl + z`. it will temporarily exit editor and go back to terminal to do whatever you want. 
To go back to editor type `fg`













My personal cofigurations:

    - vim:
        I use ~/.vimrc 
    
    - nvim:
        I use ~/.config/nvim/... 

Manual installation of plugins/themes.

1. **Single .vim File:**
   - For a single `.vim` plugin, place it in the `~/.vim/plugin` directory.
   - Example: If you have a plugin called `myplugin.vim`, put it in `~/.vim/plugin/myplugin.vim`.

2. **Vimball File:**
   - Vimball files (with the `.vba` extension) are Vim-based archives.
   - Open the Vimball file in Neovim and source it using the `:so` command.
   - The sourced file will be moved to the appropriate `~/.vim` directory.
   - Example: `$ vim datetime.vba` (inside Vim, use `:so %` to source the file).

3. **Set of Plugin Files (Vim 8+):**  *the one that I use* 
   - Neovim follows the Vim 8 way of package management.
   - Organize your plugins in the following directory structure:
     ```
     .config/nvim/pack/...

     -- pack
        |-- vendor
            |-- opt
                |-- baz
                    |-- plugin
                    |-- syntax
            |-- start
                |-- bar
                    |-- autoload
                        |-- bar.vim
                    |-- plugin
                    |-- syntax
                |-- foo
                    |-- doc
                        |-- foo.txt
                    |-- plugin
                        |-- main.vim
                    |-- syntax
     ```
   - Plugins inside the `start` directory load automatically when you run Neovim.
   - For manual loading of extension, add the following to init.lua file:
    `require('moonlight').set() -- add moonlight theme`

<!-- 
4. **Using a Plugin Manager (Recommended):**
   - Most users prefer using plugin managers for easier management.
   - One popular choice is `vim-plug`.
   - Specify your required plugins in your `~/.vimrc` using the following syntax:
     ```vim
     call plug#begin('~/.vim/plugged')
     Plug 'vim-airline/vim-airline'
     Plug 'morhetz/gruvbox'
     Plug 'tpop/fugitive'
     call plug#end()
     ```
   - Afterward, run `:PlugInstall` to install the defined plugins³. -->

Remember that Neovim's configuration file is named `init.vim`/`init.lua`, and its location varies depending on your system:
- Unix/macOS: `$HOME/.config/nvim/init.vim`  
<!-- - Windows: `~/AppData/Local/nvim/init.vim` -->


Resources used to install plugin manually.

- https://stackoverflow.com/questions/48700563/how-do-i-install-plugins-in-neovim-correctly.
- https://www.baeldung.com/linux/vim-install-neovim-plugins.
- https://linuxopsys.com/install-plugins-in-neovim.
- https://vi.stackexchange.com/questions/36509/how-do-i-install-a-package-in-neovim-without-a-package-manager.
- https://dev.to/zt4ff_1/effective-neovim-setup-a-beginners-guide-1i81.
- https://devcodef1.com/news/1118702/installing-neovim-plugins-on-windows.
- https://linuxhandbook.com/install-vim-plugins/.
- https://www.linode.com/docs/guides/how-to-install-neovim-and-plugins-with-vim-plug/.
- https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim.


# open file 
    vim +5 foo.rs -> it will open file with cursor at line 5


# Tabs:




# Buffers 
files loaded by vim in ram are called as buffers 

## To view Buffers
    :ls
    :files
    :buffers

### patterns:
- % : Buffer which is in the current window
- \# : Alternate buffer (the last file which was most recently edited in the current window)
- a : Active buffer (the file which is being edited in the current window)
- h : Hidden buffer (buffer with unsaved modifications but is not being displayed in any window)
- u : Unlisted buffer (files that are not open in Vim but are present in the current working directory; use :ls! to view this)
- \- : Buffer with 'modifiable' set to off
- = : A read-only buffer
- \+ : A modified buffer (buffer with changes that are not written to disk)
- x : A buffer that has read errors


## To Open Buffers
    :ball -> Make n horizontal splits and open all files in windows (where n is the number of files in buffer)
    :vertical ball -> Make n vertical splits and open all of them in windows (again, n is the number of files in buffer)

## Delete Buffers
    :bdelete <file_name>
    :bd <file_name>
### delete buffer 1 to 4
    :1,4bd

### switching Buffers
    :buffer <filename>
    :bufferN  here N is the buffer number you want to go to.
    :bn or :bnext
    :bp or :bprevious
    :bf or :bfirst
    :bl or blast

## Hidden Buffers 
Hiding buffers
When you try to switch between buffers when you have modified the active buffer, Vim will ask if you want to discard changes or save them, before switching to another buffer.

That can be quite annoying. To disable that message (per buffer, per session), use the :set hidden command
    
    :set hidden

# Hidden Characters 
Hidden characters in Vim
Hidden characters in Vim can be thought of as "whitespaces". Below are the characters that Vim considers hidden for better readability.

    eol (end of line)
    tab
    trail (space character before a newline character)
    extends (character in the last column to show that next line is continuation of line wrap)
    precedes (character in the first column to show that this line is continuation of previous line as a line wrap)
    conceal
    nbsp (non breakable space character)
    Enable visibility of hidden characters
To temporarily enable the visibility of hidden characters, you can use the following command.
    :set list
To reverse this change, you can hide the hidden characters again by using the command given below.

    :set nolist

# vim 8.2+ basic autocomplete
<C-n>

Switching Between Split Windows in Vim
1
Vim allows you to split your workspace into multiple windows, either horizontally or vertically, to enhance productivity. Once you have multiple split windows, you need to know how to navigate between them efficiently.

Navigating Between Split Windows

To switch between split windows in Vim, you can use the following key combinations:

Move to the left window: Press Ctrl + w followed by h

Move to the window below: Press Ctrl + w followed by j

Move to the window above: Press Ctrl + w followed by k

Move to the right window: Press Ctrl + w followed by l

These commands allow you to move your cursor to the desired window, making it the active window.

Creating Split Windows

If you need to create split windows, here are the commands:

Vertical split: Enter Normal mode and run :vsplit [file_path] or use the shortcut Ctrl + w followed by v. This will split the window vertically and optionally open a specified file.

Horizontal split: Enter Normal mode and run :split [file_path] or use the shortcut Ctrl + w followed by s. This will split the window horizontally and optionally open a specified file.

Resizing Split Windows

You can also resize the split windows to better suit your needs:

Increase height: Press Ctrl + w followed by +

Decrease height: Press Ctrl + w followed by -

Increase width: Press Ctrl + w followed by >

Decrease width: Press Ctrl + w followed by <

To expand a window as much as possible, use:

Expand vertically: Press Ctrl + w followed by |

Expand horizontally: Press Ctrl + w followed by _

To reset the size of all split windows to be equal, press Ctrl + w followed by =.


# To comment out blocks in vim:

press Esc (to leave editing or other mode)
hit ctrl+v (visual block mode)
use the ↑/↓ arrow keys to select lines you want (it won't highlight everything - it's OK!)
Shift+i (capital I)
insert the text you want, e.g. %
press EscEsc

# To uncomment blocks in vim:
press Esc (to leave editing or other mode)
hit ctrl+v (visual block mode)
use the ↑/↓ arrow keys to select the lines to uncomment.

If you want to select multiple characters, use one or combine these methods:
        use the left/right arrow keys to select more text
        to select chunks of text use shift + ←/→ arrow key
        you can repeatedly push the delete keys below, like a regular delete button

press d or x to delete characters, repeatedly if necessary

