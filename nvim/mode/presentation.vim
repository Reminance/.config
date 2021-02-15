au VimEnter no_plugins.vim setl window=66
au VimEnter no_plugins.vim normal 8Gzz
au VimEnter no_plugins.vim command! GO normal M17jzzH
au VimEnter no_plugins.vim command! BACK normal M17kzzH
au VimEnter no_plugins.vim command! RUN normal gg8Gzz
au VimEnter no_plugins.vim nnoremap <buffer> <Down> :GO<CR>
au VimEnter no_plugins.vim nnoremap <buffer> <Up> :BACK<CR>
au VimEnter no_plugins.vim nnoremap <buffer> . :RUN<CR>
au VimEnter no_plugins.vim call ToggleHiddenAll()

" toggle hiding everything except for the presentation contents
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        setl noshowmode
        setl noruler
        setl laststatus=0
        setl noshowcmd
        setl nonumber
        setl norelativenumber
        setl shortmess=F
    else
        let s:hidden_all = 0
        setl showmode
        setl ruler
        setl laststatus=2
        setl showcmd
        setl number
        setl relativenumber
        setl shortmess=filnxtToOF
    endif
endfunction
nnoremap <Leader><Leader>h :call ToggleHiddenAll()<CR>




" didn't work
" au VimEnter no_plugins.vim command! RUN execute getline(".")
" au VimEnter no_plugins.vim unmap H
" au VimEnter no_plugins.vim unmap L
" why dont these work :(
" au VimEnter no_plugins.vim nnoremap ^f :GO<CR>
" au VimEnter no_plugins.vim nnoremap ^b :BACK<CR>
