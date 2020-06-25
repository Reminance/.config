" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ===
" ===================== Install Plugins with Vim-Plug start =====================
" ===
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'connorholyday/vim-snazzy'
Plug 'morhetz/gruvbox'

" code complete
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim-peekaboo
Plug 'junegunn/vim-peekaboo'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" fzf
Plug 'junegunn/fzf.vim'

" Tagbar
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
"Plug 'w0rp/ale'

"Plug 'francoiscabrol/ranger.vim'
"Plug 'rbgrouleff/bclose.vim' " dependencies plug for ranger

" Undo Tree
"Plug 'mbbill/undotree/'

" Other visual enhancement
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

" vim-be-good
"Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" vim-snippets
Plug 'honza/vim-snippets'

" Python
Plug 'vim-scripts/indentpython.vim'

" Go
"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"Plug 'vimwiki/vimwiki'

Plug 'easymotion/vim-easymotion'

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Bookmarks
Plug 'MattesGroeger/vim-bookmarks'

" Other visual enhancement
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
Plug 'wincent/terminus'

" Other useful utilities
Plug 'makerj/vim-pdf'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'tpope/vim-commentary'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'

call plug#end()
" ===================== Install Plugins with Vim-Plug end =====================


" ===================== Start of Plugin Settings =====================

" ===
" === Ranger.vim
" ===
"nnoremap R :Ranger<CR>
"let g:ranger_map_keys = 0

" airline
"let g:airline_theme='base16_snazzy'

" ===
" === Dress up my vim
" ===
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" colorscheme
let g:SnazzyTransparent = 1
"colorscheme snazzy
colorscheme gruvbox

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
"let NERDTreeMapOpenExpl = ""
"let NERDTreeMapUpdir = ""
"let NERDTreeMapUpdirKeepOpen = ""
"let NERDTreeMapOpenSplit = ""
"let NERDTreeOpenVSplit = ""
"let NERDTreeMapActivateNode = ""
"let NERDTreeMapOpenInTab = ""
"let NERDTreeMapPreview = ""
"let NERDTreeMapCloseDir = ""
"let NERDTreeMapChangeRoot = ""

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===
" === ale
" ===
"let b:ale_linters = ['pylint']
"let b:ale_fixers = ['autopep8', 'yapf']

" ===
" === Tagbar might need sudo pacman -S ctags
" ===
map <silent> T :TagbarOpenAutoClose<CR>

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 1
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" Compile function
noremap <F10> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'vimwiki'
		exec "MarkdownPreview"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		CocCommand flutter.run -d iPhone\ 11\ Pro
		CocCommand flutter.dev.openDevLog
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" ===
" === FZF
" ===
noremap <C-p> :Files<CR>
noremap <C-f> :Ag<CR>
"noremap <C-f> :Rg<CR>
noremap <C-h> :History<CR>
"noremap <C-t> :BTags<CR>
noremap <C-l> :Lines<CR>
noremap <C-w> :Buffers<CR>
noremap <C-;> :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0

" ===
" === vim-indent-guide
" ===
"let g:indent_guides_guide_size = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_color_change_percent = 1
"silent! unmap <LEADER>ig
"autocmd WinEnter * silent! unmap <LEADER>ig

" ===
" === Undotree
" ===
"map P :UndotreeToggle<CR>
"let g:undotree_DiffAutoOpen = 1
"let g:undotree_SetFocusWhenToggle = 1
"let g:undotree_ShortIndicators = 1
"let g:undotree_WindowLayout = 2
"let g:undotree_DiffpanelHeight = 8
"let g:undotree_SplitWidth = 24
"function g:Undotree_CustomMap()
	"nmap <buffer> j <plug>UndotreeNextState
	"nmap <buffer> k <plug>UndotreePreviousState
	"nmap <buffer> J 5<plug>UndotreeNextState
	"nmap <buffer> K 5<plug>UndotreePreviousState
"endfunc

" ===
" === rainbow
" ===
let g:rainbow_active = 1

" ===
" === Far.vim
" ===
"noremap <LEADER>f :F  **/*<left><left><left><left><left>
noremap <LEADER>f :F  %<left><left>

" ===
" === vim-easymotion
" ===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
map \\ <Plug>(easymotion-bd-f2)
nmap \\ <Plug>(easymotion-bd-f2)

" ===
" === vim-be-good
" ===
"let g:vim_be_good_floating = 0

" ===
" === vim-bookmarks
" ===
let g:bookmark_no_default_key_mappings = 1
nmap mt <Plug>BookmarkToggle
nmap ma <Plug>BookmarkAnnotate
nmap ml <Plug>BookmarkShowAll
nmap mi <Plug>BookmarkNext
nmap mn <Plug>BookmarkPrev
nmap mC <Plug>BookmarkClear
nmap mX <Plug>BookmarkClearAll
nmap mu <Plug>BookmarkMoveUp
nmap me <Plug>BookmarkMoveDown
nmap <Leader>g <Plug>BookmarkMoveToLine
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_location_list = 1

" ==
" == GitGutter
" ==
"let g:gitgutter_signs = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 1
"let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_preview_win_floating = 1
autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>gh :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g[ :GitGutterPrevHunk<CR>
nnoremap <LEADER>g] :GitGutterNextHunk<CR>

" ===
" === vim-fugitive
" ===
nnoremap gb :Gblame<CR>

" ===================== End of Plugin Settings =====================
