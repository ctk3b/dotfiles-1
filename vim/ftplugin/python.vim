setlocal autoindent
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal textwidth=79
setlocal softtabstop=4
setlocal colorcolumn=80

" Add nopep8 to end of line with @p
let @o = '  # nopep8'
let @p = 'mp$"op`p'


" Copy import statement to register for word under cursor
nnoremap <silent> <leader>ii :call ftplugin#python#ImportPath(v:register)<CR>
" Copy test path to register for word under cursor
nnoremap <silent> <leader>it :call ftplugin#python#TestPath(v:register)<CR>

""""""""""""""""""""""""""""""""
" Better code block navigation "
""""""""""""""""""""""""""""""""

" next/prev if/elif/else block
noremap <silent> ]i /^\s*if \\|^\s*elif \\|^\s*else:<CR>^
noremap <silent> [i 0?^\s*if \\|^\s*elif \\|^\s*else:<CR>^

" next/prev vaiable definition
noremap <silent> ]v /^\s*[a-zA-Z_][a-zA-Z_0-9]* = <CR>^
noremap <silent> [v 0?^\s*[a-zA-Z_][a-zA-Z_0-9]* = <CR>^
