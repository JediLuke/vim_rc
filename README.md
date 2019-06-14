My Neovim init.vim, which I call my vim_rc as that's the alias I have
set up which takes me right there.

" Documentation
" =============
"
" Many of the shortcuts in this vim_rc come from plugins, so their
" functionality isn't available just by reading this file. Others are
" just hard to figure out by reading the vim_rc alone. This documentation
" is here to help me remember how to use (some of) my own customizations :P
"
" === editor shortcuts ===
"
" <leader>c<leader>   - toggle comment of highlighted text
" :swp                - strip whitespace
" :Tabularize /x      - first highlight some lines, then this aligns
"                       the highlighted text based on character x
" <leader>a           - go to end of line, 1 space after last character, into mode
" <leader>yw          - copy word under cursor without moving it
" <leader>yl          - yank line (no newline char at end), without moving
"                       the cursor (uses z mark)
" <leader>yel         - yank to the End of the Line (no newline char at end),
"                       without moving the cursor
" <leader>pw          - replace word under cursor with last oving thing (0 register)
" >leader>pa          - paste onto the end of the line
" <leader>dw          - word under cursor, and the character after it word
" >leader>da          - delete every char on line after cursor
" <leader>ymn         - yank Elixir module name without moving cursor (uses z mark)
" <leader>yq          - yank quoted text (string) beneath cursor
" <option/alt>j (k)   - move whole line, or highlighted lines, up (or down)
"
" === editor navigating ===
"
" <leader>l           - find forwards. Then type letter to jump there
" <leader>f           - two letter find, same as normal vim f but 2 letter
" '{' and '}'         - skip up/down by paragraph (note: keys are <S-[> and <S-]>)
" &                   - GOTO mark command (`), works like address-of in C
"
" === programming specific ===
"
" <leader>i then <n>  - change fold level (i for indent). n is the level
"
" === window management & project navigation ===
"
" <backslash>e        - toggle file explorer (side tray, i.e. NERDTree)
" <backslash>p        - fuzzy find on git-tracked files
" <backslash><S-p>    - fuzzy find on git-tracked files
" <backslash>f        - fuzzy find on text in project, only git-tracked files
" <backslacs><S-f>    - fuzzy find on all files & folders, no exclusions
" <backslacs>4        - open nth tab, example here is 4 but \2 opens 2nd etc.
" <leader>jt          - jump to test file, or jump back if test is open (Elixir files only)
" <leader>=           - resize all windows to same size
"
" =============

