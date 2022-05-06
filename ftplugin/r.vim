" ~/.config/nvim/ftplugin/r.vim
" ~/.config/nvim/autoload/r.vim
" ~/.config/nvim/snippets/r

" * To use sc-im, modify the function "RViewDF" to using "tab term" to open
"   "sc-im" located in "Nvim-R/R/common_global.vim".
" * "Nvim-R documentation": https://github.com/jamespeapen/Nvim-R/wiki/Use

" NvimR: options.
let R_assign = 0 
let R_disable_cmds = ['RSendLine', 'RRightComment']
let R_objbr_w = 30

setlocal winminwidth=1
setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2 smarttab
command! -buffer -nargs=0 LastMod :call my#LastMod('^\(#* *Last Modified: *\)[^ ]*',6)

" Snippets: snippets.
inoremap <buffer> :sign<Tab>  <Esc>:call my#GetSnippets('r','r_sign.r')<CR>
inoremap <buffer> :block<Tab> <Esc>:call my#GetSnippets('r','r_block.r')<CR>
inoremap <buffer> :qui<Tab>   <Esc>:call my#GetSnippets('r','r_qui.r')<CR>
inoremap <buffer> :lib<Tab>   <Esc>:call my#GetSnippets('r','r_library.r')<CR>
inoremap <buffer> :ggs<Tab>   <Esc>:call my#GetSnippets('r','r_ggsave.r')<CR>
inoremap <buffer> :ggch<Tab>  <Esc>:call my#GetSnippets('r','r_ggplotChinese.r')<CR>
inoremap <buffer> :se<Tab>    <Esc>:call my#GetSnippets('r','r_robust.r')<CR>
inoremap <buffer> :log<Tab>   <Esc>:call my#GetSnippets('r','r_logfile.r')<CR>
inoremap <buffer> :cl<Tab>    <Esc>:call my#GetSnippets('r','r_consolelog.r')<CR>

" Mappings: mappings.
nnoremap <buffer> <F1>       :tabnew ~/.config/nvim/ftplugin/r.vim<CR>
nnoremap <buffer> <F2>       :tabnew ~/.config/nvim/after/syntax/r.vim<CR>
inoremap <buffer> <S-M><Tab> <Esc>:call r#PipeExpand('Tab')<CR>
inoremap <buffer> <S-M><CR>  <Esc>:call r#PipeExpand('CR')<CR>
nnoremap <buffer> <leader>;  :call my#DelFuncCall('[a-zA-Z]','[a-zA-Z0-9._]')<CR>
inoremap <buffer> :date<Tab> <C-R>=my#GetDate()<CR>
inoremap <buffer> {<CR>      {}<esc>i<CR><esc><S-O>
