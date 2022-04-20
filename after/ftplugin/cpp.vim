" ~/.config/nvim/ftplugin/cpp.vim

" commenting
setlocal commentstring=//\ %s

" complie and run
nnoremap <F1> :tabnew ~/.config/nvim/after/ftplugin/cpp.vim<CR>
nnoremap <F2> :set filetype=cpp<CR>
" nnoremap <F5> :w<CR>:! g++ -o "%:r" % -lstdc++<CR>
nnoremap <F5> :w<CR>:! g++ -o "%:r" % -lstdc++ -std=c++11<CR>
nnoremap <silent> <F6> :! ./"%:r"<CR>

inoremap <leader>io<Tab> #include <iostream><CR>using namespace :: std;<CR>
inoremap <leader>s<Tab>  int main ( void ) {<CR>return 0;<CR>}<esc>%o
inoremap <leader>cl<Tab> class <++> {<CR>protected:<CR><++><CR>2<BackSpace>public:<CR><BackSpace><++><CR>};<esc>5k/<++><CR>ca<

inoremap for<Tab>  for ( int i=0; i<; i++ )<esc>F<a
inoremap forj<Tab> for ( int j=0; j<; j++ )<esc>F<a
imap     forr<Tab> for ( <++>; <++>; <++> )<esc>%<leader>]
imap     fori<Tab> for ( auto cursor = <++>.begin(); cursor != <++>.end(); cursor++ )<esc>%<leader>]
imap     fora<Tab> for ( <++> : <++> )<esc>%<leader>]
inoremap {<CR>     {}<esc>i<CR><esc><S-O>

inoremap :c<Tab>   /*<Space><Space>*/<left><left><left>
