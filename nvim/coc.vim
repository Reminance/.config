
" ===
" === coc
" ===
" fix the most annoying bug that coc has
"silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
  " \ 'coc-stylelint',
  " \ 'coc-explorer',
let g:coc_global_extensions = [
  \ 'coc-sh',
  \ 'coc-clangd',
  \ 'coc-cmake',
  \ 'coc-rls',
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
  \ 'coc-java',
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
nnoremap <LEADER>CC :CocCommand<CR>
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

