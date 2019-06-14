" Neovim config file
" JediLuke - https://github.com/JediLuke


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


" ##TODO
" * document depencies e.g. ripgrep
" * make it so that if I copy something, it doesnt just get removed as soon as
" I paste it!!
" 2) Try out vim-lsp instead of ALE and remove deoplete see if it helps with
" lag issues
" 3) Change colour overrides to have jellybeans overrides, fix colours
" 4) Make elixir jump file work for umbrella projects
" * Finish off my shortcut to jump between an elixir file & its test
" * remove elixir ls from vim, strip it back
" * add snippets like inspx, basically what I have in VS code, to Vim
" * Map Q to replay last recorded macro
" * Make a better shortcut for tabularize its such a great plugin
" * Finish off the open terminal shortcut that seems fantastic!
" * Write a proper macro that allows me to resize tabs at will (Miss my 3
" space tabs! :(
" * work on my git tree compare clone for Vim
" * Check out the following macros
" * *
" vim clear everything macro (bufdo bwipeout??) Plug 'vim-erlang/vim-erlang-tags' Plug 'vim-erlang/vim-erlang-runtime' Plug 'vim-erlang/vim-erlang-omnicomplete' Plug 'scrooloose/nerdtree' Plug 'jistr/vim-nerdtree-tabs' Plug 'tpope/vim-commentary'
" 5) Get autocomplete of functions happening in Elixir
" * get preview for fzf file search
" * get directory blocking working for fzf file search, and also for text
" search
" * rebind acessing registers to a better key

"https://www.hillelwayne.com/post/vim-macro-trickz/
"https://www.brianstorti.com/vim-as-the-poor-mans-sed/
"https://vi.stackexchange.com/questions/457/does-ex-mode-have-any-practical-use


" Dependencies
" ============
" * FZF - https://github.com/junegunn/fzf
" * ripgrep - used by fzf. Install using brew


" vim/neovim global settings
" ==========================
" do not attempt backwards compatabilty with vi
set nocompatible
" <leader> is space bar
let mapleader = "\<Space>"


" plugins
" =======
" plug.vim - https://github.com/junegunn/vim-plug
"   :PlugInstall - must run this to install new plugins
"   :PlugUpdate - update plugins which are already installed
"   :PlugClean - remove plugins not being used
call plug#begin('~/.vim/plugged') "install plugins to this dir
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'sheerun/vim-polyglot'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'easymotion/vim-easymotion'
  Plug 'kana/vim-submode'
  Plug 'godlygeek/tabular'
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " language servers
  "Plug 'w0rp/ale'
  " elixir
  "Plug 'elixir-editors/vim-elixir'
  "Plug 'slashmili/alchemist.vim'
  " git plugins
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  "Plug 'jreybert/vimagit'
  " vim-airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " fzf - https://github.com/junegunn/fzf
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'pbogut/fzf-mru.vim'
  " colour schemes
  Plug 'nightsense/snow'
  Plug 'TroyFletcher/vim-colors-synthwave'
  Plug 'crusoexia/vim-monokai'
  Plug 'jnurmine/Zenburn'
  Plug 'AlessandroYorba/Sierra'
  Plug 'jdsimcoe/abstract.vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'AlessandroYorba/Arcadia'
  Plug 'nanotech/jellybeans.vim'
call plug#end()


" custom functions
" ================
"function! ResizeVerticalPaneLeft()
  "" Adjust pane size to the left by 50%
  "let pane_width = (winwidth(0) * 3/2)
  "echo "Pane width is: " pane_width
  "while pane_width > 0
    ""echo "count is " pane_width
    ":exe "normal \<C-w><"
    "let pane_width -= 1
  "endwhile
  "unlet pane_width
"endfunction

function! s:IsExUnitTestFile(file)
  return match(a:file, '^test/.*_test\.exs$') != -1
endfunction

function! s:IsElixirImplementationFile(file)
  return match(a:file, '^.*\.ex$') != -1
endfunction

function! s:AlternateFileForExUnitTestFile(exunit_test_file)
  " return implementation file for this exunit script
  let alternate_file = substitute(a:exunit_test_file, '_test\.exs$', '.ex', '')
  let alternate_file = substitute(alternate_file, '^test/', 'lib/', '')
  return alternate_file
endfunction

function! s:AlternateFileForElixirImplementationFile(elixir_implementation_file)
  " return test file for this elixir module
  let alternate_file = substitute(a:elixir_implementation_file, '\.ex$', '_test.exs', '')
  let alternate_file = substitute(alternate_file, '^lib/', 'test/', '')
  "let alternate_file = 'test/' . alternate_file
  return alternate_file
endfunction

function! JumpBetweenElixirModuleAndTestFile()
  " heavily inspired by `https://github.com/uptech/vim-open-alternate`
  let current_file = expand("%")
  if s:IsExUnitTestFile(current_file)
    let jump_file = s:AlternateFileForExUnitTestFile(current_file)
    execute "edit " . jump_file
    echo "Jumped to Elixir file: " . jump_file
  elseif s:IsElixirImplementationFile(current_file)
    let jump_file = s:AlternateFileForElixirImplementationFile(current_file)
    execute "edit " . jump_file
    echo "Jumped to test file: " . jump_file
  else
    echo "Error: filetype not recognised. Could not jump to test file."
  endif
endfunction


" Colour settings
" ===============
set termguicolors
syntax enable
colorscheme jellybeans
let g:airline_theme='jellybeans'
"set background=dark
"let g:arcadia_Sunset=1
"function! s:use_default_terminal_background()
  "" https://github.com/nanotech/jellybeans.vim
  "let g:jellybeans_overrides = {
  "\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
  "\}
  "if has('termguicolors') && &termguicolors
      "let g:jellybeans_overrides['background']['guibg'] = 'none'
  "endif
"endfunction
"call s:use_default_terminal_background()
"make folded sections less obvious (same colours as jellybeans scheme)
hi Folded guifg=#888888 guibg=#151515 guisp=#00FF00 gui=italic


" editor settings
" ===============
function! UseTabs()
  set tabstop=4     " Size of a hard tabstop (ts).
  set shiftwidth=4  " Size of an indentation (sw).
  set noexpandtab   " Always uses tabs instead of space characters (noet).
  set autoindent    " Copy indent from current line when starting a new line (ai).
endfunction
function! UseSpaces()
  set tabstop=2     " Size of a hard tabstop (ts).
  set shiftwidth=2  " Size of an indentation (sw).
  set expandtab     " Always uses spaces instead of tab characters (et).
  set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, feature is off (sts).
  set autoindent    " Copy indent from current line when starting a new line.
  set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).
endfunction
"call UseTabs()
call UseSpaces()
"set smartindent
set number
set cursorcolumn
set colorcolumn=72
set cursorline
set ruler           " show the cursor position all the time
set scrolloff=7     " start scrolling x lines from the top/bottom
set ignorecase smartcase " make searches case-sensitive only if they contain upper-case characters
" If a file is changed outside of vim, automatically reload it without asking
set autoread
set incsearch
set lazyredraw
set showmatch
set noerrorbells
set nowrap
" folding {{{
set foldlevel=1
set foldmethod=indent
"set foldclose=all          " Close folds if you leave them in any way
"set foldopen=all           " Open folds if you touch them in any way
function! s:SkipFold(direction) abort
  " do not open folds which contain blank lines when using { or } keys
  let l:currentLine = line('.')
  while foldclosed(l:currentLine) != -1
    let l:currentLine = search('^$', (a:direction ? 'Wn' : 'Wnb'))
    if l:currentLine == 0
      if a:direction
        call cursor(line('$'), strlen(getline(line('$'))))
      else
        call cursor(1, 1)
      endif
      break
    endif
    call cursor(l:currentLine, 0)
  endwhile
endfunction
nnoremap <silent>} }:call <SID>SkipFold(1)<cr>
nnoremap <silent>{ {:call <SID>SkipFold(0)<cr>
nnoremap <leader>i1 :set foldlevel=1<CR>
nnoremap <leader>i2 :set foldlevel=2<CR>
nnoremap <leader>i3 :set foldlevel=3<CR>
nnoremap <leader>i4 :set foldlevel=4<CR>
nnoremap <leader>i5 :set foldlevel=5<CR>
" }}}
" auto-close HTMl tags
let g:closetag_filenames = '*.html'
" enable mouse
if has('mouse')
  set mouse=a
endif
function! s:trigger_autoread_when_file_changes_on_disk()
  " https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
  " https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
  " Notification after file change
  " https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
  autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
endfunction
call s:trigger_autoread_when_file_changes_on_disk()


" keb - key bindings / key mappings
" ===========================
" remap Q, which by default enters Ex mode (useless)
map Q <Nop>
" clear search highlighting when you press escape
nnoremap <esc> :noh<return><esc>
" goto mark is &, just like address-of operator in C
nnoremap & `
nnoremap ` &
" toggle project tray / NERDTree with \e (for 'explore')
"nnoremap <leader>e :45 vsp .<cr>
nnoremap \e :NERDTreeToggle<CR>
function! s:rebind_movement_keys()
  " This function is no longer used, thus the call to it is commented out.
  " Although I think these bindings are better I got used to vim defaults
  " and it caused other issues, not working nicely with plugins...
  " h -> repeat previous f, t, F or T movement (think 'hop')
  " l -> move left
  " ; -> move right
  noremap h ;
  noremap l h
  noremap ; l
endfunction
"call s:rebind_movement_keys()
function! s:move_lines_with_alt_jk()
  " move line under cursor, or multiple highlighted ones,
  " with Alt+[jk] and Alt-arrow keys
  " https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
  nnoremap ∆ :m .+1<cr>==
  nnoremap <m-down> :m .+1<cr>==
  nnoremap ˚ :m .-2<cr>==
  nnoremap <m-up> :m .-2<cr>==
  inoremap ∆ <esc>:m .+1<cr>==gi
  inoremap <m-down> <esc>:m .+1<cr>==gi
  inoremap ˚ <esc>:m .-2<cr>==gi
  inoremap <m-up> <esc>:m .-2<cr>==gi
  vnoremap ∆ :m '>+1<cr>gv=gv
  vnoremap <m-down> :m '>+1<cr>gv=gv
  vnoremap ˚ :m '<-2<cr>gv=gv
  vnoremap <m-up> :m '<-2<cr>gv=gv
endfunction
function! s:setup_tab_nav()
  " navigate between tabs using <leader>n
  nnoremap \1 1gt
  nnoremap \2 2gt
  nnoremap \3 3gt
  nnoremap \4 4gt
  nnoremap \5 5gt
  nnoremap \6 6gt
  nnoremap \7 7gt
  nnoremap \8 8gt
  nnoremap \9 9gt
endfunction
call s:setup_tab_nav()
call s:move_lines_with_alt_jk()
function! s:custom_leader_based_edit_commands()
  " Documentation
  " -------------
  " yl  - yank line (no newline char at end), without moving the cursor (uses z mark)
  " yel - yank to the End of the Line (no newline char at end), without moving the cursor
  " yw  - yank word under the cursor, without moving the cursor (uses z mark)
  " dw  - delete word under cursor, and the character after it
  " da  - delete every char on line after cursor
  " ymn - yank module name. For elixir modules, yanks whole module name,
  "       without moving the cursor (uses z mark)
  " yq  - yank quoted text (string) beneath cursor
  " pw  - paste over word under cursor with contents of register
  " a   - go to end of line, 1 space after last character, into cmd mode
  " pa  - paste on end of line (paste after)
  nnoremap <leader>yl mz^y$`z
  nnoremap <leader>yel y$
  nnoremap <leader>yw mzyiw`z
  nnoremap <leader>dw diwx
  nnoremap <leader>da a<space><esc>d$
  nnoremap <leader>ymn mzgg^wv$bhhy`z
  nnoremap <leader>yq mzF"vf"y`z
  nnoremap <leader>pw ciw<esc>"0p
  nnoremap <leader>a A<space><esc>a
  nnoremap <leader>pa A<space><esc>p
endfunction
call s:custom_leader_based_edit_commands()
" open definition in new visual split - WIP
"nnoremap <leader>] :vs<CR><c-w>l
nnoremap <leader>jt :call JumpBetweenElixirModuleAndTestFile()<CR>


" Window management
" =================
" open with a project drawer on the left by default
"autocmd VimEnter * :45 vsp .
" Window movement mappings - use CTRL and my custom arrow key maps to jump
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
" shortcuts to resize window heights/widths
" leader = -> make all windows same size
noremap <leader>= <c-w>=


" Terminal emulator
" =================
function OpenTerminal()
  " open the terminal window
  split
endfunction
nnoremap <leader>` :call OpenTerminal()<CR>
" <leader><Esc> exits insert mode inside terminal. Cant be just normal <Esc>
" as that interferes with fzf, prevents <Esc> from closing that entirely
tnoremap <leader><esc> <C-\><C-n>


" ALE - linting engine
" ====================
let g:ale_elixir_elixir_ls_release = '/Users/luke/workbench/tools/elixir-ls/rel'
" add support for showing language server messages in status line
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'


" vim-submode (plugin)
" ====================
let g:submode_always_show_submode = 1
" Window mode
" press <leader>-W, now all normal window commands work with just normal keys.
call submode#enter_with('Window', 'n', '', '<leader>w')
for key in ['a','b','c','d','e','f','g','h','i','j','k','l','m',
      \        'n','o','p','q','r','s','t','u','v','w','x','y','z']
  " maps lowercase, uppercase and <C-key>
  call submode#map('Window', 'n', '', key, '<C-w>' . key)
  call submode#map('Window', 'n', '', toupper(key), '<C-w>' . toupper(key))
  call submode#map('Window', 'n', '', '<C-' . key . '>', '<C-w>' . '<C-'.key . '>')
endfor
" Go through symbols. Sadly, '|', not supported in submode plugin.
for key in ['=','_','+','-','<','>']
  call submode#map('Window', 'n', '', key, '<C-w>' . key)
endfor
" Resize faster
call submode#map('Window', 'n', '', '+', '3<C-w>+')
call submode#map('Window', 'n', '', '-', '3<C-w>-')
call submode#map('Window', 'n', '', '<', '10<C-w><')
call submode#map('Window', 'n', '', '>', '10<C-w>>')
" | aka 'pipe' (<Shift-\>) by default maximizes the width.
" \ <lowercase-pipe> sets the width to 80 columns
call submode#map('Window', 'n', '', '\', ':vertical resize 80<CR>')
" override :quit with :close, so it won't exit Vim when it's the last window.
call submode#map('Window', 'n', '', 'q', '<C-w>c')


" fzf (plugin)
" ============
" Here we override the default fzf commands with extra ripgrep options
" see: https://github.com/junegunn/fzf/blob/master/README-VIM.md
" see: https://github.com/junegunn/fzf/wiki/Examples-(vim)
" see: https://www.mankier.com/1/rg
" see: https://github.com/junegunn/fzf.vim/issues/825
"
" These are the function signitures of the functions being called:
"   fzf#vim#grep(command, with_column, [options], [fullscreen])
"
" -- regular find --
"   * exclude node_modules (--glob "!node_modules/*")
"   * exclude elixir build dir (--glob "!_build/*")
"   * show line number in results (--line-number)
"   * dont group results by file (--no-heading)
"   * use literal strings for search not regex so we dont need to escape
"     special chars (--fixed-strings)
"   * search case insensitive if all lowercase, otherwise case sensitive (--smart-case)
"   * trim whitespace at start of line in results (--trim)
"   * search hidden/dot files aswell e.g. '.example_file', '.env' (--hidden)
"   * follow symlinks, dunno if we need but why not (--follow)
"   * always use colors to display results (--color "always")
"   * ignores deps #TODO
"   * shows preview to the right (fzf#vim#with_preview)
"     need second arg to be 1, see: https://github.com/junegunn/fzf.vim/issues/732
" --
command! -bang -nargs=* FzfFind call fzf#vim#grep(
  \ 'rg --glob=!node_modules/* --glob=!_build --line-number --no-heading --fixed-strings --smart-case --trim --hidden --follow --color "always" '.shellescape(<q-args>),
  \ 0, fzf#vim#with_preview(), <bang>0)
nnoremap \f :FzfFind<cr>
" -- find in all files --
"   * same as above but without excluding any files/folders
command! -bang -nargs=* FzfFindAllFiles call fzf#vim#grep(
  \ 'rg --line-number --no-heading --fixed-strings --smart-case --hidden --follow --color "always" '.shellescape(<q-args>),
  \ 0, fzf#vim#with_preview(), <bang>0)
nnoremap \<S-f> :FzfFindAllFiles<cr>
" -- search filenames
"   * ignore files not tracked in git
"   * show a preview
"command! -bang -nargs=* FzfGitTrackedFiles call fzf#run({'source': 'git ls-files', 'sink': 'e', 'down': '40%'})
"command! -bang -nargs=* -complete=dir FzfGitTrackedFiles call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
nnoremap \p :GFiles<cr>
" -- search all filenames
"   * same as above but without excluding any files/folders
command! -bang -nargs=* -complete=dir FzfAllFiles call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
nnoremap \<S-p> :FzfAllFiles<cr>
" -- most recently used
nnoremap \r :FZFMru<cr>


" vim-airline (plugin)
" ====================
" don't show branch in status line
let g:airline#extensions#branch#enabled = 0


" deoplete (plugin)
" =================
let g:deoplete#enable_at_startup = 1
" use tab for completion
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
" use vim home keys to go up and down the popup menu
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"


" easymotion (plugin)
" ===================
" leader-space opens bidirectional 2 letter jump - overwin means jump windows
" in normal mode
map <leader>f <Plug>(easymotion-s2)
"nmap <leader><space> <Plug>(easymotion-overwin-s2)
map <leader>l <Plug>(easymotion-lineforward)
"nmap <space>l <Plug>(easymotion-overwin-lineforward)
map <leader>j <Plug>(easymotion-j)
"nmap <space>j <Plug>(easymotion-overwin-j)
map <leader>k <Plug>(easymotion-k)
"nmap <space>k <Plug>(easymotion-overwin-k)
map <leader>h <Plug>(easymotion-linebackward)
"nmap <space>h <Plug>(easymotion-overwin-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
" With smartcase set, v will match both v and V, but V will match V only
let g:EasyMotion_smartcase = 1


" vim-better-whitespace (plugin)
" ==============================
" remove trailing whitespace every time I save the file, and dont confirm
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1
nnoremap :swp :StripWhitespace<cr>


" gitgutter (plugin)
" ==================
" gitgutter updatetime is 0.05s
set updatetime=50
" make gitgutter column always there even if no changs
if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif


" NERDTree (plugin)
" =================
let NERDTreeHijackNetrw=1
let NERDTreeShowHidden=1
" make NERDTree x columns wide
let g:NERDTreeWinSize=42
" close neovim if NERDTree is last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
