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

" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline-themes'
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

" vim-be-good
"Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

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
" Plug 'terryma/vim-multiple-cursors'
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

" airline
"let g:airline_theme='base16_snazzy'

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
set tags=./.tags;,.tags
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

" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" ===
" === vim-easymotion
" ===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
nmap <LEADER>f <Plug>(easymotion-bd-f2)

" ===
" === Far.vim
" ===
noremap <LEADER>F :F  %<left><left>

" ===
" === FZF
" ===
noremap <M-S-l> :Lines<CR>
" ripgrep
noremap <M-S-f> :Rg<CR>
noremap <M-S-g> :GFiles<CR>
noremap <M-S-n> :Files<CR>
noremap <M-S-e> :Buffers<CR>
noremap <M-S-h> :History<CR>
" noremap <M-;> :History:<CR>
" The Silver Searcher
" noremap <M-S-f> :Ag<CR>
" noremap <M-t> :BTags<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" ===
" === RANGER
" ===
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
nmap <LEADER>g <Plug>BookmarkMoveToLine
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_location_list = 1

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
nnoremap gsd :SignifyDiff<CR>
nnoremap gst :SignifyToggle<CR>
nnoremap gsh :SignifyToggleHighlight<CR>
nnoremap gsr :SignifyRefresh<CR>
nnoremap gsx :SignifyDebug<CR>
" hunk jumping
nmap gsj <plug>(signify-next-hunk)
nmap gsk <plug>(signify-prev-hunk)

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
nnoremap <LEADER><LEADER>h :diffget //2<CR>
nnoremap <LEADER><LEADER>l :diffget //3<CR>
nnoremap <LEADER><LEADER>g :G<CR>

" ===
" === coc
" ===
" fix the most annoying bug that coc has
"silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
  " \ 'coc-stylelint',
  " \ 'coc-explorer',
let g:coc_global_extensions = [
  \ 'coc-java',
  \ 'coc-go',
  \ 'coc-pairs',
  \ 'coc-pyright',
  \ 'coc-python',
  \ 'coc-tslint',
  \ 'coc-tsserver',
  \ 'coc-flutter',
  \ 'coc-actions',
  \ 'coc-css',
  \ 'coc-diagnostic',
  \ 'coc-eslint',
  \ 'coc-git',
  \ 'coc-gitignore',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-lists',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-sourcekit',
  \ 'coc-syntax',
  \ 'coc-tasks',
  \ 'coc-todolist',
  \ 'coc-translator',
  \ 'coc-vimlsp',
  \ 'coc-vimlsp',
  \ 'coc-yaml',
  \ 'coc-yank']
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()

" Open up coc-commands
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <LEADER>rn <Plug>(coc-rename)
nmap <LEADER>tt :CocCommand explorer<CR>
" coc-translator
nmap <LEADER>tr <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" coctodolist
nnoremap <leader>tn :CocCommand todolist.create<CR>
nnoremap <leader>tl :CocList todolist<CR>
nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <leader>ts :CocList tasks<CR>
" coc-snippets
" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)

" go coc settings
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" ===================== End of Plugin Settings =====================
