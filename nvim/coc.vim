
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
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>+ <Plug>(coc-diagnostic-next)
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Open up coc-commands
nnoremap <LEADER>CC :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Useful commands
nnoremap <silent> <LEADER>y :<C-u>CocList -A --normal yank<cr>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <LEADER>rn <Plug>(coc-rename)
nmap <LEADER>tt :CocCommand explorer<CR>
nnoremap <silent> <C-H> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" coc-translator
nmap <C-Y> <Plug>(coc-translator-p)
vmap <C-Y> <Plug>(coc-translator-pv)

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
imap <C-n> <Plug>(coc-snippets-expand)
vmap <C-n> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-p>'
imap <TAB> <Plug>(coc-snippets-expand-jump)
xmap <leader>x  <Plug>(coc-convert-snippet)
let g:snips_author = 'Reminance'

" go coc settings
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

