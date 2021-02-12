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
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'

" code complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim-peekaboo
Plug 'junegunn/vim-peekaboo'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" fzf
Plug 'junegunn/fzf.vim'

" ranger
Plug 'francoiscabrol/ranger.vim'

" Tagbar
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
"Plug 'w0rp/ale'

" Undo Tree
"Plug 'mbbill/undotree/'

" Other visual enhancement
"Plug 'nathanaelkane/vim-indent-guides'
" Plug 'itchyny/vim-cursorword'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
" Plug 'airblade/vim-gitgutter'
" Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

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
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

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

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Other useful utilities
Plug 'makerj/vim-pdf'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'tpope/vim-commentary' " gcc to comment the current line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'

" Debugger
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" which-key
Plug 'liuchengxu/vim-which-key'

call plug#end()
" ===================== Install Plugins with Vim-Plug end =====================


" ===================== Start of Plugin Settings =====================

" latex
" compile to pdf
" arch requirements sudo pacman -S texlive-most texlive-lanf mupdf zathura
nnoremap \l :! pdflatex %<CR><CR>
" view the pdf
nnoremap \p :! mupdf $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
" delete the compling output
nnoremap \c :! ls \| grep -E '*.aux\|*.log\|*.nav\|*.out\|*.snm\|*.toc\|*.pdf' \| xargs rm -rf {}<CR><CR>

" vim-latex-live-preview
" let g:livepreview_previewer = 'zathura'
let g:livepreview_previewer = 'mupdf'
let g:livepreview_engine = 'pdflatex'

" airline
let g:airline_theme='onedark'

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" ===
" === Dress up my vim
" ===
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" colorscheme
let g:SnazzyTransparent = 1
colorscheme snazzy
" colorscheme gruvbox
" colorscheme hybrid

" ===
" === vim-peekaboo
" ===
" suppress the default key bindings if you need imap <C-r> keybinding
" let g:peekaboo_ins_prefix = '<S>'

" ===
" === NERDTree
" ===
nnoremap tt :NERDTreeToggle<CR>
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
" == wildfire
" ==
" This selects the next closest text object.
nnoremap <CR> <plug>(wildfire-fuel)
" this selects the previous closest text object.
" vmap <C-SPACE> <plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i>", "i)", "i]", "i}", "ip", "it"]

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
set tags=./.tags;,.tags
nnoremap <silent> T :TagbarOpenAutoClose<CR>

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

" ===
" === vim-table-mode
" ===
nnoremap <LEADER>tm :TableModeToggle<CR>

" ===
" === vim-easymotion
" ===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
nnoremap <LEADER>f <Plug>(easymotion-bd-f2)

" ===
" === Far.vim
" ===
nnoremap <LEADER>F :F  %<left><left>

" ===
" === FZF
" ===
nnoremap <M-S-l> :Lines<CR>
" ripgrep
nnoremap <M-S-f> :Rg<CR>
nnoremap <M-S-g> :GFiles<CR>
nnoremap <M-S-n> :Files<CR>
nnoremap <M-S-e> :Buffers<CR>
nnoremap <M-S-h> :History<CR>
" noremap <M-;> :History:<CR>
" The Silver Searcher
" noremap <M-S-f> :Ag<CR>
" noremap <M-t> :BTags<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" ===
" === RANGER
" ===
" suppress the default key bindings
let g:ranger_map_keys = ''
nnoremap <LEADER>ra :Ranger<CR>

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
" === vim-bookmarks
" ===
let g:bookmark_no_default_key_mappings = 1
nnoremap <LEADER>mt <Plug>BookmarkToggle
nnoremap <LEADER>ma <Plug>BookmarkAnnotate
nnoremap <LEADER>ml <Plug>BookmarkShowAll
nnoremap <LEADER>mi <Plug>BookmarkNext
nnoremap <LEADER>mn <Plug>BookmarkPrev
nnoremap <LEADER>mc <Plug>BookmarkClear
nnoremap <LEADER>mx <Plug>BookmarkClearAll
nnoremap <LEADER>mu <Plug>BookmarkMoveUp
nnoremap <LEADER>me <Plug>BookmarkMoveDown
nnoremap <LEADER>mg <Plug>BookmarkMoveToLine
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_location_list = 1

" ==
" == vim-startify
" ==
" Open Startify
nnoremap <LEADER>\ :Startify<CR>

" ==
" == vim-surround
" ==
" suppress the default key bindings
let g:surround_no_insert_mappings = 1

" ==
" == vim-signify
" ==
" 设置要检查的VCS
let g:signify_vcs_list = ['git']
" 插入模式下指定updatetime时间后无操作将缓存区交换文件写入磁盘
let g:signify_cursorhold_insert     = 1
" 正常模式下指定updatetime时间后无操作将缓存区交换文件写入磁盘
let g:signify_cursorhold_normal     = 1
" 缓冲区被修改时更新符号
let g:signify_update_on_bufenter    = 0
" vim获取焦点时更新符号
let g:signify_update_on_focusgained = 1
" 键盘映射
nnoremap <LEADER>gsd :SignifyDiff<CR>
nnoremap <LEADER>gst :SignifyToggle<CR>
nnoremap <LEADER>gsh :SignifyToggleHighlight<CR>
nnoremap <LEADER>gsr :SignifyRefresh<CR>
nnoremap <LEADER>gsx :SignifyDebug<CR>
" hunk jumping
nnoremap <LEADER>gsj <plug>(signify-next-hunk)
nnoremap <LEADER>gsk <plug>(signify-prev-hunk)

" ==
" == GitGutter
" ==
""let g:gitgutter_signs = 0
"let g:gitgutter_map_keys = 0
"let g:gitgutter_override_sign_column_highlight = 1
""let g:gitgutter_highlight_linenrs = 1
"let g:gitgutter_preview_win_floating = 1
"autocmd BufWritePost * GitGutter
"nnoremap <LEADER>gf :GitGutterFold<CR>
"nnoremap <LEADER>gh :GitGutterPreviewHunk<CR>
"nnoremap <LEADER>g[ :GitGutterPrevHunk<CR>
"nnoremap <LEADER>g] :GitGutterNextHunk<CR>

" ===
" === vim-fugitive
" ===
nnoremap <LEADER>gb :Gblame<CR>
nnoremap <LEADER>dh :diffget //2<CR>
nnoremap <LEADER>dl :diffget //3<CR>
nnoremap <LEADER>gg :G<CR>

" ===
" === vimspector
" ===
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'vscode-cpptools', 'debugpy', 'vscode-go' ]
" let g:vimspector_base_dir=expand( '$HOME/.config/nvim/vimspector-config' )

" " 从模板文件读入到当前buffer
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/vimspector-config/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/vimspector-config',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })

" " noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
" sign define vimspectorBP text=☛ texthl=Normal
" sign define vimspectorBPDisabled text=☞ texthl=Normal
" sign define vimspectorPC text=🔶 texthl=SpellBad

" which-key
" let g:mapleader = "\<Space>"
" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
let g:mapleader = ','
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey ','<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" coc settings
source ~/.config/nvim/coc.vim
" ===================== End of Plugin Settings =====================
