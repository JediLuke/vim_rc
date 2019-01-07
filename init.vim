"	Neovim config file
"	JediLuke72


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
" <leader>c<leader>		- > toggle comment of highlighted text
" :swp								- > strip whitespace
" :Tabularize /x			- > first highlight lines, then this aligns
"												> the text based on character x
" <leader>yw					- > copy word under cursor without moving it
" <leader>pw					- > replace word under cursor with last copied thing
" <leader>ymn					- > yank Elixir module name without moving cursor
" <option/alt>j (k)		- > move whole line, or highlighted lines, up (or down)
"
" === editor navigating ===
"
"	<leader>l						- > find forwards. Then type letter to jump there
" <leader>f						- > two letter find, same as normal vim f but 2 letter
"
" === window management & project navigation ===
"
" <backslash>e        - > toggle file explorer (side tray)
" <backslash>p        - > fuzzy find on filenames
" <backslash>f        - > fuzzy find everywhere
" <leader>=           - > resize all windows to same size
"
" =============


" <leader> is space bar
:let mapleader = "\<Space>"

"	plugins
"	=======
"	plug.vim - https://github.com/junegunn/vim-plug
"  :PlugInstall - must run this to install new plugins
"  :PlugUpdate - update plugins which are already installed
"  :PlugClean - remove plugins not being used
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
	" elixir
	Plug 'elixir-editors/vim-elixir'
	Plug 'slashmili/alchemist.vim'
	" git plugins
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'jreybert/vimagit'
	" vim-airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" fzf - https://github.com/junegunn/fzf
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
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


"	custom functions
"	================
"function ResizeVerticalPaneLeft()
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


"	color settings
"	==============
" set up colour scheme
syntax enable
set background=dark
"let g:arcadia_Sunset=1
colorscheme jellybeans
set termguicolors
" open with a project drawer on the left by default
"autocmd VimEnter * :45 vsp .
let g:airline_theme='murmur'


"	editor settings
"	===============
set nocompatible
set tabstop=2
set shiftwidth=2
set number
set cursorcolumn
set cursorline
set colorcolumn=72
set ruler " show the cursor position all the time
set scrolloff=7               " start scrolling x lines from the top/bottom
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" If a file is changed outside of vim, automatically reload it without asking
set autoread
set incsearch
set lazyredraw
set showmatch
set noerrorbells
set nowrap
" folding
set foldcolumn=1						" Show the foldcolumn
set foldlevel=2
set foldmethod=indent				" Fold on the syntax
"set foldclose=all					" Close folds if you leave them in any way
"set foldnestmax=1					" I only like to fold outer functions
"set foldopen=all						" Open folds if you touch them in any way
set autoindent
set smartindent
" auto-close HTMl tags
let g:closetag_filenames = '*.html'
" enable mouse
if has('mouse')
  set mouse=a
endif
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


"	key mappings
"	============
" clear search highlighting when you press escape
nnoremap <esc> :noh<return><esc>
" h -> repeat previous f, t, F or T movement (think 'hop')
"noremap h ;
" l -> move left
"noremap l h
" ; -> move right
"noremap ; l
" toggle project tray / NERDTree with \e (for 'explore')
"nnoremap <leader>e :45 vsp .<cr>
nnoremap \e :NERDTreeToggle<CR>
" move lines with Alt+[jk] and Alt-arrow keys
" https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
nnoremap ∆ :m .+1<CR>==
nnoremap <m-Down> :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
nnoremap <m-Up> :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap <m-Down> <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
inoremap <m-Up> <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap <m-Down> :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv
vnoremap <m-Up> :m '<-2<CR>gv=gv
" yl - Yank line (no newline char at end),
" without moving the cursor (uses z mark)
nnoremap <leader>yl mz^y$`z
" yel - Yank to the End of the Line (no newline char at end),
" without moving the cursor
nnoremap <leader>yel y$
" yw - yank word under the cursor,
" without moving the cursor (uses z mark)
nnoremap <leader>yw mzyiw`z
" cw - change word under cursor (delete it and go into insert mode)
nnoremap <leader>cw ciw
" dw - delete word under cursor, and the character after it
nnoremap <leader>dw diwx
" da - delete every char on line after cursor
nnoremap <leader>da a<space><esc>d$
" ymn - yank module name. For elixir modules, yanks whole module name,
" without moving the cursor (uses z mark)
nnoremap <leader>ymn mzgg^wv$bhhy`z
" pw - paste-over word under cursor with contents of register 0
nnoremap <leader>pw ciw<esc>"0p
" a - go to end of line, 1 space after last character, into cmd mode
nnoremap <leader>a A<space><esc>a
" pa - paste on end of line (paste after)
nnoremap <leader>pa A<space><esc>p
" shift and y yands entire line without newline char

" open definition in new visual split - WIP
"nnoremap <leader>] :vs<CR><c-w>l


"	Window management
"	=================
" Window movement mappings - use CTRL and my custom arrow key maps to jump
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
" shortcuts to resize window heights/widths
" leader = -> make all windows same size
noremap <leader>= <c-w>=


"	vim-submode (plugin)
"	====================
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


"	fzf (plugin)
"	============
nnoremap \p :Files<cr>
nnoremap \f :Find<cr>
command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)


"	easymotion (plugin)
"	===================
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


"	vim-better-whitespace (plugin)
"	==============================
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1
nnoremap :swp :StripWhitespace<cr>


"	gitgutter (plugin)
"	==================
" gitgutter updatetime is 0.05s
set updatetime=50
" make gitgutter column always there even if no changs
if exists('&signcolumn')
	set signcolumn=yes
else
	let g:gitgutter_sign_column_always = 1
endif


"	NERDTree (plugin)
"	=================
" make NERDTree wider
let g:NERDTreeWinSize=42
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close neovim if NERDTree is last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeHijackNetrw=1
let NERDTreeShowHidden=1
