
" ===
" === coc
" ===
  " \ 'coc-sourcekit',
  " \ 'coc-leetcode',
let g:coc_global_extensions=[
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
  \ 'coc-syntax',
  \ 'coc-tasks',
  \ 'coc-todolist',
  \ 'coc-translator',
  \ 'coc-vimlsp',
  \ 'coc-vimlsp',
  \ 'coc-yaml',
  \ 'coc-lists',
  \ 'coc-xml',
  \ 'coc-wxml',
  \ 'coc-restclient',
  \ 'coc-webpack',
  \ 'coc-pyls',
  \ 'coc-jedi',
  \ 'coc-db',
  \ 'coc-sql',
  \ 'coc-emoji',
  \ 'coc-floaterm',
  \ 'coc-emoji',
  \ 'coc-protobuf',
  \ 'coc-project-manager',
  \ 'coc-lua',
  \ 'coc-julia',
  \ 'coc-yank',
  \ 'coc-stylelint',
  \ 'coc-explorer',
  \ 'coc-marketplace']

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" use <tab> for trigger completion and navigate to the next complete item
inoremap <SILENT><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
	let col=col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <SILENT><expr> <C-space> coc#refresh()
" use <,c,> to prev diagnostic;
nmap <SILENT> <LEADER>c, <Plug>(coc-diagnostic-prev)
" use <,c.> to next diagnostic;
nmap <SILENT> <LEADER>c. <Plug>(coc-diagnostic-next)
" nmap <SILENT> <LEADER>c. <Plug>(coc-diagnostic-next-error)
inoremap <SILENT><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <SILENT><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Open up coc-commands
nnoremap <LEADER>cC :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Useful commands
nnoremap <SILENT> <LEADER>y :<C-u>CocList -A --normal yank<cr>

nmap <SILENT> gd <Plug>(coc-definition)
nmap <SILENT> gt <Plug>(coc-type-definition)
nmap <SILENT> gi <Plug>(coc-implementation)
nmap <SILENT> gr <Plug>(coc-references)
nmap <LEADER>rn <Plug>(coc-rename)
nnoremap <LEADER>tt :CocCommand explorer<CR>

nnoremap <SILENT> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    echo 1
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

" " Remap for do codeAction of selected region
" function! s:cocActionsOpenFromSelected(type) abort
"   execute 'CocCommand actions.open ' . a:type
" endfunction
" xmap <SILENT> <LEADER>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
" nmap <SILENT> <LEADER>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Applying codeAction to the selected region.
" Example: `<LEADER>aap` for current paragraph
xmap <M-CR> <Plug>(coc-codeaction-selected)
" nmap <LEADER>cs  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <M-CR> <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <LEADER>cq  <Plug>(coc-fix-current)

" coctodolist
nnoremap <LEADER>tn :CocCommand todolist.create<CR>
nnoremap <LEADER>tl :CocList todolist<CR>
nnoremap <LEADER>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
nnoremap <LEADER>ts :CocList tasks<CR>

" coc-snippets
vmap <C-n> <Plug>(coc-snippets-select)
imap <C-n> <Plug>(coc-snippets-expand)
" 直接展开snippets
imap <C-\> <Plug>(coc-snippets-expand-jump)
xmap <LEADER>x  <Plug>(coc-convert-snippet)
let g:snips_author='Reminance'
" 在snippets占位符间跳转
let g:coc_snippet_next='<C-j>'
let g:coc_snippet_prev='<C-k>'

" Mappings for CoCList
" Show all diagnostics.
nnoremap <SILENT><NOWAIT> <LEADER>cld  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <SILENT><NOWAIT> <LEADER>cle  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <SILENT><NOWAIT> <LEADER>clc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <SILENT><NOWAIT> <LEADER>clo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <SILENT><NOWAIT> <LEADER>cls  :<C-u>CocList -I symbols<cr>
" Resume latest coc list.
nnoremap <SILENT><NOWAIT> <LEADER>clr  :<C-u>CocListResume<CR>
" marketplace coc list.
nnoremap <SILENT><NOWAIT> <LEADER>clm  :<C-u>CocList marketplace<CR>
" Do default action for next item.
nnoremap <SILENT><NOWAIT> <LEADER>cn  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <SILENT><NOWAIT> <LEADER>cp  :<C-u>CocPrev<CR>

" ===
" === coc-leetcode
" ===
" let g:leetcode_language='java'
" let g:leetcode_trace_server=0
" let g:leetcode_enabled=1
" nnoremap <SILENT> <LEADER>ll :CocCommand leetecode.login<CR>
" nnoremap <SILENT> <LEADER>lp :CocList LeetcodeProblems<CR>
" nnoremap <SILENT> <LEADER>lr :CocCommand leetcode.run<CR>
" nnoremap <SILENT> <LEADER>ls :CocCommand leetcode.submit<CR>
" nnoremap <SILENT> <LEADER>lc :CocCommand leetcode.comments<CR>

" ===
" === coc-restclient
" ===
nnoremap <LEADER>crr :CocCommand rest-client.request <cr>
nnoremap <LEADER>crl :r! cat ~/.config/coc/extensions/node_modules/coc-restclient/test/sample/single.http<CR>
nnoremap <LEADER>crL :r! cat ~/.config/coc/extensions/node_modules/coc-restclient/test/sample/multiple.http<CR>

" go coc settings
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

