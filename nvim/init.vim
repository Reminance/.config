" ===================== Editor behavior =====================
set nocompatible
" set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set cursorline
let mapleader=","
exe "nohlsearch"
set number
set relativenumber
set wrap
set pumheight=10
set showcmd
set path+=**
set wildmenu
" set spell
" set hlsearch
set incsearch
set ignorecase
set smartcase

" gui
syntax on
set background=dark
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256

" for better coc experience
set updatetime=200
set signcolumn=yes

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
" set clipboard^=unnamed,unnnamedplus
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileformats=unix,dos,mac
set backspace=indent,eol,start " 退格键可以退到上一行
let &t_ut=''
set textwidth=80
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
" za，打开或关闭当前折叠；zc 关闭折叠; zo 打开折叠; zM，关闭所有折叠；zR，打开所有折叠
set foldmethod=indent
set foldlevel=99
set foldenable
set ttyfast "should make scrolling faster
set lazyredraw "same as above
let &t_SI="\<Esc>]50;CursorShape=1\x7"
let &t_SR="\<Esc>]50;CursorShape=2\x7"
let &t_EI="\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set noshowmode
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " make cursor remain the position of last quit
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

" show the vim mappings
nnoremap <leader>vmn :nmap 
nnoremap <leader>vmi :imap 
nnoremap <leader>vmv :vmap 

" You can't stop me
cnoremap w!! w !sudo tee %

" normal mode bindings
nnoremap <C-Down> :res +5<CR>
nnoremap <C-Up> :res -5<CR>
nnoremap <C-Left> :vertical resize-5<CR>
nnoremap <C-Right> :vertical resize+5<CR>

" ===================== Cursor Movement =====================
" insert mode bindings(emacs like)
inoremap <C-a> <C-o>I
inoremap <C-e> <C-o>A
inoremap <M-a> <Esc>{jI
inoremap <M-e> <Esc>}kA
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <M-f> <S-Right>
inoremap <M-b> <S-Left>
inoremap <C-d> <Del>
inoremap <C-k> <C-o>D
inoremap <M-k> <Esc>ddkA
inoremap <S-Del> <Esc>ddkA
inoremap <C-g> <Esc>
map <C-g> <Esc>
" inoremap <C-n> <Down>
" inoremap <C-p> <Up>

" use the system clipboard
" might need to install a system clipboard tool such as : sudo pacman -S xclip / xsel
noremap Y "+y
noremap P "+p

" command line mode bindings
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <M-f> <S-Right>
cnoremap <M-b> <S-Left>

" ===================== Basic Mappings =====================
nnoremap <Leader><Space> :nohlsearch<CR>
" quit all the other windows except for current  " (:h only)(<C-w>o)
nnoremap <Leader>qw :only<CR>
" quit all the other tabs except for current  " (:h tabonly)
nnoremap <Leader>qt :tabonly<CR>

" Opening a terminal window
" nnoremap <Leader>/ :term<CR>

" insert a <++>
inoremap <M-i> <++>
" jump to next <++> and replace it
nnoremap <M-Space> <Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap <M-Space> <Esc>/<++><CR>:nohlsearch<CR>c4l


" duplicate words
" nnoremap <Leader>dw /\(\<\w\+\>\)\_s*\1<CR>

" Open the vimrc file anytime
nnoremap <Leader><Leader>i :e ~/.config/nvim/init.vim<CR>
" Open the function.vim file anytime
nnoremap <Leader><Leader>f :e ~/.config/nvim/function.vim<CR>
" Open the _md_snippets.vim file anytime
nnoremap <Leader><Leader>m :e ~/.config/nvim/snippets/_md_snippets.vim<CR>
" Open the presentation.vim file anytime
nnoremap <Leader><Leader>P :e ~/.config/nvim/mode/presentation.vim<CR>
" Open the plugins.vim file anytime
nnoremap <Leader><Leader>p :e ~/.config/nvim/plugins.vim<CR>
" Open the coc.vim file anytime
nnoremap <Leader><Leader>c :e ~/.config/nvim/coc.vim<CR>
" Open the coc-settings.json file anytime
nnoremap <Leader><Leader>s :e ~/.config/nvim/coc-settings.json<CR>

" Open up lazygit
nnoremap <C-\>g :tabe<CR>:tabmove<CR>:term lazygit<CR>

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

" ===================== Quick Navigation =====================
" nnoremap H 3h
" nnoremap J 3j
" nnoremap K 3k
" nnoremap L 3l

" ===================== Save & quit =====================
nnoremap s <nop>
nnoremap S :w<CR>
inoremap <C-s> <Esc>:w<CR>
nnoremap Q :q<CR>
nnoremap R :source $MYVIMRC<CR>

" ===================== split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
nnoremap sh :set nosplitright<CR>:vsplit<CR>
nnoremap sj :set splitbelow<CR>:split<CR>
nnoremap sk :set nosplitbelow<CR>:split<CR>
nnoremap sl :set splitright<CR>:vsplit<CR>
nnoremap seh :set nosplitright<CR>:vsplit 
nnoremap sej :set splitbelow<CR>:split 
nnoremap sek :set nosplitbelow<CR>:split 
nnoremap sel :set splitright<CR>:vsplit 

" ===================== Place the two screens side by side (vertical)
nnoremap sm <C-w>t<C-w>H
" ===================== Place the two screens up and down (horizontal)
nnoremap sn <C-w>t<C-w>K

" ===================== Rotate screens
nnoremap srm <C-w>b<C-w>H
nnoremap srn <C-w>b<C-w>K

" ===================== Window management
" Use <ALT> + new arrow keys for moving the cursor around windows
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
" Use <Leader> + new arrow keys for moving the windows
nnoremap <Leader>h <C-w>H
nnoremap <Leader>j <C-w>J
nnoremap <Leader>k <C-w>K
nnoremap <Leader>l <C-w>L

" ===================== Tab management
" Create a new tab
nnoremap <M-n> :tabe<CR>
nnoremap <M-q> :tabclose<CR>
" nnoremap <M-n> :tabnew 
" nnoremap <Leader>n :tabe<CR>
" switching tabs
nnoremap <M-,> :-tabnext<CR>
nnoremap <M-.> :+tabnext<CR>
" Move the tabs
nnoremap <M-<> :-tabmove<CR>
nnoremap <M->> :+tabmove<CR>
" Map alt-x keys to jump to a tab
for i in range(1, 8)
  exe "nnoremap <M-" . i . "> :tabnext " . i . "<CR>"
endfor
nnoremap <M-9> :tablast<CR>

" open the quickfix
nnoremap <Leader>co :copen<CR>

" reading source into vim(:h read) or :r! cat ~/.bashrc
nnoremap <M-S-r> :r 

" help shortcut(:helpgrep i_^n)
nnoremap <Leader>hg :helpgrep 
nnoremap <Leader>hn :cnext<CR>
nnoremap <Leader>hp :cprev<CR>
nnoremap <Leader>hl :copen<CR>

" toggle spell check
nnoremap <Leader>st :setl spell!<CR>
" fix the last spell bad to the cursor; eg: [shcool], pressing ,sf will fix it to [school]
nnoremap <Leader>sf [sz=
" fix and jump back
" nnoremap <Leader>sf mm[s1z=`m

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

" ===
" === for assembly
" ===
" changeToHex
" nnoremap <M-\> :%!xxd<CR>
" reverseFromHex
" nnoremap <M-\|> :%!xxd -r<CR>
" 备注: Vim 的操作大概涉及的场景有：读取，写入，缓冲区，选项，启动和退出，杂项。
autocmd BufEnter *.asm,*.inc,*.nas :setlocal filetype=nasm

" ===
" === markdown settings
" ===
let g:markdown_folding=1
" highlight Folded term=standout ctermfg=14 ctermbg=0
autocmd BufEnter *.md,*.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,README.md :setlocal filetype=markdown | set foldlevel=1 | exe 'normal gg'
autocmd FileType markdown nnoremap <buffer> <Tab> za

" ===
" === source the extra config
" ===
source ~/.config/nvim/function.vim
source ~/.config/nvim/snippets/_md_snippets.vim
source ~/.config/nvim/mode/presentation.vim

" Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
let has_machine_specific_file=1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
    let has_machine_specific_file=0
    silent! exe "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

" plugins
source ~/.config/nvim/plugins.vim
