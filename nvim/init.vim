" ===================== Editor behavior =====================
" set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set cursorline
let mapleader=","
exec "nohlsearch"
set number
" set relativenumber
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

set nocompatible
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
" You can't stop me
cmap w!! w !sudo tee %

" normal mode bindings
nnoremap <C-Down> :res +5<CR>
nnoremap <C-Up> :res -5<CR>
nnoremap <C-Left> :vertical resize-5<CR>
nnoremap <C-Right> :vertical resize+5<CR>

" ===================== Cursor Movement =====================
" insert mode bindings(emacs like)
inoremap <C-a> <Esc>I
inoremap <C-e> <Esc>A
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <M-f> <S-Right>
inoremap <M-b> <S-Left>
inoremap <C-d> <Del>
inoremap <C-k> <Esc>d$a
inoremap <C-g> <Esc>
map <C-g> <Esc>
" <C-w> 向行首删除一个word
inoremap <silent><expr> <C-w>
      \ <SID>is_first_of_line() ? "" :
      \ "\\<Left><S-Left><Esc>ct\\<Del>"
" <M-d> 向行尾删除一个word
inoremap <silent><expr> <M-d>
      \ <SID>is_end_of_line() ? "" :
      \ "<CR><Esc>caw<BS>"
" 检查是否删除到了行首
function! s:is_first_of_line() abort
    return !(col('.') - 1)
endfunction
" 检查是否删除到了行尾 注意vim行尾有换行符, 所以 col(最后一个可视字符) + 1 = col('$')
function! s:is_end_of_line() abort
    return col('.') == col('$')
endfunction
" inoremap <C-n> <Down>
" inoremap <C-p> <Up>

" === prevent replacing paste buffer on paste
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<CR>"
endfunction
vmap <silent> <expr> p <sid>Repl()

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
" quit all the other window except for current
nnoremap <Leader>q <C-w>o
inoremap <S-Del> <Esc>ddkA

" Opening a terminal window
"noremap <Leader>/ :term<CR>

" insert a <++>
inoremap <M-i> <++>
" jump to next <++> and replace it
nnoremap <M-Space> <Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap <M-Space> <Esc>/<++><CR>:nohlsearch<CR>c4l

" duplicate wordds
" nnoremap <Leader>dw /\(\<\w\+\>\)\_s*\1<CR>

" Open the vimrc file anytime
nnoremap <Leader>i :e ~/.config/nvim/init.vim<CR>

" Open the plugins.vim file anytime
nnoremap <Leader>p :e ~/.config/nvim/plugins.vim<CR>

" Open the coc.vim file anytime
nnoremap <Leader>cc :e ~/.config/nvim/coc.vim<CR>
nnoremap <Leader>cs :e ~/.config/nvim/coc-settings.json<CR>

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
" noremap H 3h
" noremap J 3j
" noremap K 3k
" noremap L 3l

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
" noremap <M-n> :tabnew 
" noremap <Leader>n :tabe<CR>
" switching tabs
nnoremap <M-,> :-tabnext<CR>
nnoremap <M-.> :+tabnext<CR>
" Move the tabs
nnoremap <M-<> :-tabmove<CR>
nnoremap <M->> :+tabmove<CR>
" Map alt-x keys to jump to a tab
for i in range(1, 8)
  execute "nnoremap <M-" . i . "> :tabnext " . i . "<CR>"
endfor
nnoremap <M-9> :tablast<CR>

" open the quickfix
nnoremap <Leader>co :copen<CR>

" reading source into vim
nnoremap <M-S-r> :r! cat 

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file=1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file=0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

" Compile function
nnoremap <M-r> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		" exec "!g++ % -o %<"
		exec "!gcc % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
        " ==== compile & run ===
		" exec "!javac %"
		" exec "!time java %<"
        " === make & run ===
		" exec 'set makeprg=javac\ -g\ %'
		" exec "make"
		" exec "!time java %<"
        " === make ===
		exec "make"
        " === for debug ===
		" exec "!time java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=5005,suspend=y %<"
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
		" silent! exec "VimtexStop"
		" silent! exec "VimtexCompile"
		silent! exec "LLPStartPreview"
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
	elseif &filetype == 'nasm'
		exec "!nasm -f bin % -o %<.bin"
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

" for assembly
" changeToHex
" nnoremap <M-\> :%!xxd<CR>
" reverseFromHex
" nnoremap <M-\|> :%!xxd -r<CR>
" 备注: Vim 的操作大概涉及的场景有：读取，写入，缓冲区，选项，启动和退出，杂项。
autocmd BufEnter *.asm,*.inc,*.nas :setlocal filetype=nasm

command! -bang -nargs=* UnixEncodingUtf8 exec "set fileformat=unix | set fileencoding=utf-8"
" <q-args>会自动对参数特殊字符进行转义 函数接收参数时，使用关键字<f-args>
com! -bang -nargs=* FormatAndEncode call FormatAndEncodeFunc(<f-args>)
" 可变参数（Varargs)：Vimscript 函数支持可变参数传递，参数格式为：...
" func! FormatAndEncodeFunc(...)
" usage: a:0 a:1 a:2
func! FormatAndEncodeFunc(format, encoding)
    execute 'set fileformat=' . a:format
    execute 'set fileencoding=' . a:encoding
endfunc

" sessions
" 自带的session颜色丢失 用startify的session管理代替
" auto save and load session for $HOME/.config/nvim/session/current.session
" set sessionoptions="blank,buffers,curdir,folds,globals,help,localoptions,options,resize,sesdir,slash,tabpages,terminal,unix,winpos,winsize"
" set sessionoptions="blank,buffers,folds,globals,help,localoptions,resize,sesdir,slash,tabpages,terminal,unix,winpos,winsize"
" let g:OrigPWD=getcwd()
" let g:OrigPWD='/home/xc/.config/nvim'
" let g:AutoSessionFile='session/recent.session'
" if filereadable("".g:OrigPWD."/".g:AutoSessionFile)
"     if argc() == 0
"         au VimEnter * call LoadRecentSession()
"     endif
" else
"     if argc() == 0
"         au VimLeave * call SaveRecentSession()
"     endif
" endif
" function! SaveRecentSession()
"     exec "mks! ".g:OrigPWD."/".g:AutoSessionFile
" endfunction
" function! LoadRecentSession()
"     exe "source ".g:OrigPWD."/".g:AutoSessionFile
" endfunction

" plugins
source ~/.config/nvim/plugins.vim
