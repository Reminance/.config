" ===================== Editor behavior =====================
" set cursorline
let mapleader=" "
exec "nohlsearch"
syntax on
set number
set norelativenumber
set wrap
set showcmd
set wildmenu
set hlsearch
set incsearch
set ignorecase
set smartcase
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set clipboard=unnamed
set encoding=utf-8
let &t_ut=''
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap <down> :res +5<CR>
noremap <up> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" ===================== Cursor Movement =====================
noremap H 0
noremap J 7j
noremap K 7k
noremap L $

" ===================== Command Mode Cursor Movement =====================
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>

" ===================== Basic Mappings =====================
inoremap <C-h> <ESC>0i
inoremap <C-l> <ESC>$a

noremap <LEADER><CR> :nohlsearch<CR>

" Copy to system clipboard
vnoremap Y "+y

" Opening a terminal window
noremap <LEADER>/ :term<CR>

" jump to next <++> and replace it
"noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" make Y to copy till the end of the line
nnoremap Y y$

" Press <SPACE> + q to close the window below the current window
inoremap <LEADER>q <esc>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Open Startify
"noremap <LEADER>st :Startify<CR>

" Disable the default s key
noremap s <nop>

" Open up lazygit
noremap \g :Git 
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>

" ===================== Save & quit =====================
noremap S :w<CR>
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap R :source $MYVIMRC<CR>

" ===================== split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" ===================== Place the two screens side by side (vertical)
noremap sm <C-w>t<C-w>H
" ===================== Place the two screens up and down (horizontal)
noremap sn <C-w>t<C-w>K

" ===================== Rotate screens
noremap srm <C-w>b<C-w>K
noremap srn <C-w>b<C-w>H

" ===================== Window management
" Use <LEADER> + new arrow keys for moving the cursor around windows
noremap <C-w> <C-w>w
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" ===================== Tab management
" Create a new tab with tk
noremap tk :tabe<CR>
" Move around tabs with th and tl
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmh and tml
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>

" plugins
source ~/.config/nvim/plugins.vim
