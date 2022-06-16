" ~/.config/nvim/ftplugin/python.vim

" GENERAL SETTINGS: disables 8-wide tab, sensible listchars.
" let g:python_recommended_style = 0
setl listchars=tab:┊\ ,trail:·,extends:»,precedes:«,nbsp:+

" FUNCTION KEYS: compile.
nnoremap <buffer> <F1> :tabnew ~/.config/nvim/ftplugin/python.vim<CR>
nnoremap <buffer> <F5> :w<Enter>:! python3 %<CR>

" SNIPPETS: shebang, template.
inoremap <buffer> :bang<Tab> <Esc>:call my#GetSnippets('python','python_bang.py')<CR>
inoremap <buffer> :qui<Tab>  <Esc>:call my#GetSnippets('python','python_qui.py')<CR>
nnoremap <buffer> <leader>; :call python#DelCommand()<CR>
