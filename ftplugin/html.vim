" ~/.config/nvim/ftplugin/html.vim
" ~/.config/nvim/ftplugin/html_snippets/

if &ft == "markdown" | finish | endif

" UTILITIES
nnoremap <buffer> <F1>      :tabnew ~/.config/nvim/ftplugin/html.vim<CR>
nnoremap <buffer> <leader>p :! open <C-R>'%:r.html<CR><CR>

" SNIPPETS
inoremap <buffer> :qui<Tab> <esc>:call my#GetSnippets('html','html_qui.html')<CR>
