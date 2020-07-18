" ===================== Editor behavior =====================
" set cursorline
let mapleader=" "
exec "nohlsearch"
syntax on
set number
set relativenumber
set wrap
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
set background=dark
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set clipboard=unnamedplus
set encoding=utf-8
let &t_ut=''
set tabstop=4
set sw=4
set shiftwidth=4
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set indentexpr=
set backspace=indent,eol,start
" za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠
set foldmethod=indent
set foldlevel=99
set foldenable
set ttyfast "should make scrolling faster
set lazyredraw "same as above
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
" use for u(undo) and Ctrl-r(redo)
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif

noremap <down> :res +5<CR>
noremap <up> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" ===================== Cursor Movement =====================
" cnoremap <M-a> <Home>
" cnoremap <M-e> <End>
" cnoremap <M-b> <S-Left>
" cnoremap <M-w> <S-Right>

inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>

cnoremap <M-h> <Left>
cnoremap <M-j> <Down>
cnoremap <M-k> <Up>
cnoremap <M-l> <Right>

xnoremap <M-h> <Left>
xnoremap <M-j> <Down>
xnoremap <M-k> <Up>
xnoremap <M-l> <Right>

tnoremap <M-h> <Left>
tnoremap <M-j> <Down>
tnoremap <M-k> <Up>
tnoremap <M-l> <Right>

" ===================== Basic Mappings =====================
noremap <LEADER><CR> :nohlsearch<CR>
inoremap <C-d> <Esc>ddk$

" Copy to system clipboard
" might need to install a system clipboard tool such as : sudo pacman -S xclip
vnoremap Y "+y

" Opening a terminal window
"noremap <LEADER>/ :term<CR>

" jump to next <++> and replace it
nnoremap <M-m> <Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap <M-m> <Esc>/<++><CR>:nohlsearch<CR>c4l

" make Y to copy till the end of the line
nnoremap Y y$

" Open the vimrc file anytime
noremap <LEADER><LEADER>i :e ~/.config/nvim/init.vim<CR>

" Open the vimrc plugins file anytime
noremap <LEADER><LEADER>p :e ~/.config/nvim/plugins.vim<CR>

" Open Startify
noremap <LEADER>\ :Startify<CR>

" Open up lazygit
noremap \g :Git 
noremap <C-g> :tabe<CR>:tabmove<CR>:term lazygit<CR>

" Open a terminal in vim
nnoremap <C-\><C-h> :set nosplitright<CR>:vsplit<CR>:term<CR>
nnoremap <C-\>h :set nosplitright<CR>:vsplit<CR>:term<CR>
nnoremap <C-\><C-j> :set splitbelow<CR>:split<CR>:term<CR>
nnoremap <C-\>j :set splitbelow<CR>:split<CR>:term<CR>
nnoremap <C-\><C-k> :set nosplitbelow<CR>:split<CR>:term<CR>
nnoremap <C-\>k :set nosplitbelow<CR>:split<CR>:term<CR>
nnoremap <C-\><C-l> :set splitright<CR>:vsplit<CR>:term<CR>
nnoremap <C-\>l :set splitright<CR>:vsplit<CR>:term<CR>
tnoremap <C-\> <C-\><C-n>

" insertmode operat
inoremap <M-o> <ESC>o
inoremap <M-S-o> <ESC>O

" ===================== Save & quit =====================
nnoremap s <nop>
nnoremap S :w<CR>
inoremap <C-s> <ESC>:w<CR>
nnoremap Q :q<CR>
noremap R :source $MYVIMRC<CR>

" ===================== split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
noremap sl :set splitright<CR>:vsplit<CR>
noremap seh :set nosplitright<CR>:vsplit 
noremap sej :set splitbelow<CR>:split 
noremap sek :set nosplitbelow<CR>:split 
noremap sel :set splitright<CR>:vsplit 

" ===================== Place the two screens side by side (vertical)
noremap sm <C-w>t<C-w>H
" ===================== Place the two screens up and down (horizontal)
noremap sn <C-w>t<C-w>K

" ===================== Rotate screens
noremap srm <C-w>b<C-w>H
noremap srn <C-w>b<C-w>K

" ===================== Window management
" Use <ALT>OR<LEADER> + new arrow keys for moving the cursor around windows
noremap <M-h> <C-w>h
noremap <M-j> <C-w>j
noremap <M-k> <C-w>k
noremap <M-l> <C-w>l
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>l <C-w>l

" ===================== Tab management
" Create a new tab with tk
noremap tk :tabe<CR>
" Move around tabs with th and tl
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmh and tml
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>


" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

" Compile function
noremap <M-r> :call CompileRunGcc()<CR>
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

" templates
if has("autocmd")
    augroup templates
        autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/sh.tpl
        autocmd BufNewFile *.c 0r ~/.config/nvim/templates/c.tpl
        autocmd BufNewFile *.java 0r ~/.config/nvim/templates/java.tpl
        autocmd BufNewFile *.go 0r ~/.config/nvim/templates/go.tpl
        autocmd BufNewFile *.py 0r ~/.config/nvim/templates/py.tpl
        autocmd BufNewFile *.html 0r ~/.config/nvim/templates/html.tpl
    augroup END
endif

" Snippets
source ~/.config/nvim/snippets/_md_snippets.vim

" plugins
source ~/.config/nvim/plugins.vim
