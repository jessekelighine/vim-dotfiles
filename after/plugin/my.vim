" ~/.config/nvim/after/plugin/my.vim

nnoremap <silent> <Plug>(ChineseSpelling)  :call my#ChineseSpelling()<CR>
nnoremap <silent> <Plug>(MakeRoomAbove)    :<C-U>exe "call my#MakeRoom('above',".v:count1.")"<CR>
nnoremap <silent> <Plug>(MakeRoomBelow)    :<C-U>exe "call my#MakeRoom('below',".v:count1.")"<CR>
nnoremap <silent> <Plug>(DeletePair)       :call my#DeletePair()<CR>
nnoremap <silent> <Plug>(ToggleLineNumber) :call my#ToggleLineNumber()<CR>

command! -nargs=1 TabSize                  :call my#TabSize(<args>)
command! -nargs=? LocalVimrc               :call my#LocalVimrc(<args>)
command! -nargs=0 ChineseWordCount         :call my#ChineseWordCount()
command! -nargs=0 RemoveTrailingSpaces     :call my#RemoveTrailingSpaces()
command! -nargs=0 ToggleAlacrittyArrowKeys :call my#ToggleAlacrittyArrowKeys()
command! -range   SplitChineseSentence     :<line1>,<line2>call my#SplitChineseSentence()
command! -nargs=0 SudoWrite                :w !sudo tee % > /dev/null " This only works for vim, not neovim.

" command! -nargs=0 ConflictHighlightToggle  :call my#ConflictHighlightToggle()
