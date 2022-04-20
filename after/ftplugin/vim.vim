" ~/.config/nvim/after/ftplugin/vim.vim
" ~/.config/nvim/snippets/vim/

packadd! matchit
let b:match_words='\<function\>:\<endfunction\>,'
			\ . '\<if\>:\<elseif\>:\<else\>:\<endif\>,'
			\ . '\<for\>:\<endfor\>,'
			\ . '\<while\>:\<endwhile\>,'

nnoremap <buffer> <F1>      :tabnew ~/.config/nvim/after/ftplugin/vim.vim<CR>
nnoremap <buffer> <leader>; :call my#DelFuncCall('[a-zA-Z]','[a-zA-Z#]')<CR>
inoremap <buffer> :pwd<Tab> <C-R>=my#pwd('p')<CR>
inoremap <buffer> :fn<Tab>  <C-R>=my#pwd('t')<CR>
