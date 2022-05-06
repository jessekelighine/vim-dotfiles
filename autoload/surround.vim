" ~/.config/nvim/autoload/surround.vim

" Test if a character is in "&matchedpairs".  Defaults to test the current
" character under the cursor.
let s:matchpairs = split(substitute(&matchpairs,',\|:',"\<Space>",'g'))
function! <SID>in_matchedpairs(char=my#GetChar())
	return index(s:matchpairs,a:char) >= 0
endfunction

" Add surrounding characters to a visually selected region. 
function! surround#Add(symbol_start,symbol_end) range
	let [ l:start, l:end ] = [ getpos("'<"), getpos("'>") ]
	call setpos('.',l:end  ) | exec "norm a".a:symbol_end  ."\<Esc>"
	call setpos('.',l:start) | exec "norm i".a:symbol_start."\<Esc>"
endfunction

" Delete paired characters (in "matchedpairs"). If "a:symbol" is given, then
" find the boundaries first. If "a:symbol" is not given and the current
" character is not in "matchedpairs", do nothing.
" Testing: [ something( here ) { ... } ]
function! surround#Delete(symbol='')
	if !empty(a:symbol) | exec "norm va".a:symbol."\<Esc>" | endif 
	if empty(a:symbol) && !<SID>in_matchedpairs() | return | endif 
	let [ l:l1, l:c1 ] = [ line("."), col(".") ] | norm %
	let [ l:l2, l:c2 ] = [ line("."), col(".") ] | norm %
	if  l:l1==l:l2 && l:c1>l:c2 | let [l:c1,l:c2] = [l:c2,l:c1] | endif
	call cursor(l:l2,l:c2) | norm x
	call cursor(l:l1,l:c1) | norm x
endfunction
