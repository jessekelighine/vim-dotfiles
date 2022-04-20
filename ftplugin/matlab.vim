" ~/.config/nvim/ftplugin/matlab.vim
" ~/.config/nvim/after/syntax/matlab.vim

" FUNCTION KEYS: compile.
nnoremap <buffer> <F1> :tabnew ~/.config/nvim/ftplugin/matlab.vim<CR>
nnoremap <buffer> <F2> :tabnew ~/.config/nvim/after/syntax/matlab.vim<CR>

" SNIPPETS: shebang, template.
inoremap <buffer> :qui<Tab> <esc>:call my#GetSnippets('matlab','matlab_qui.m')<CR>3jA<space><C-R>=my#GetDate()<CR><Esc>

" MAPPSINGS: useful mappings.
inoremap <buffer> ^<Tab> ^()<Left>
