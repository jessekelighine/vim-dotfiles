" ~/.config/nvim/autoload/surround.vim

function! surround#Add(symbol_start,symbol_end) range
	let [ l:start, l:end ] = [ getpos("'<"), getpos("'>") ]
	call setpos('.',l:end  ) | exec "norm a".a:symbol_end  ."\<Esc>"
	call setpos('.',l:start) | exec "norm i".a:symbol_start."\<Esc>"
endfunction

" delete paried characters. This function is written for cases where "%" works
" but "ds" (by vim-surround) does not.  This is the case for all matched
" Chinese characters, e.g. fill-width brackets, Chinese quotes, etc.
" If the target `a:symbol` is provived (either opening or ending part), then
" first find where the pair ends.
" Testing: [ something( here ) { ... } ]
function! surround#Delete(symbol='')
	if  a:symbol!='' | exec "norm va".a:symbol."\<Esc>" | endif
	let [ l:l1, l:c1 ] = [ line("."), col(".") ] | norm %
	let [ l:l2, l:c2 ] = [ line("."), col(".") ] | norm %
	if  l:l1==l:l2 && l:c1>l:c2 | let [l:c1,l:c2] = [l:c2,l:c1] | endif
	call cursor(l:l2,l:c2) | norm x
	call cursor(l:l1,l:c1) | norm x
endfunction
