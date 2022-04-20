" ~/.config/nvim/autoload/surround.vim

function! surround#Surround(symbol_start,symbol_end) range
	let [ l:start, l:end ] = [ getpos("'<"), getpos("'>") ]
	call setpos('.',l:end  ) | exec "norm a".a:symbol_end  ."\<Esc>"
	call setpos('.',l:start) | exec "norm i".a:symbol_start."\<Esc>"
endfunction

function! surround#DelSurround(symbol)
	exec "norm va".a:symbol
	let [ l:start, l:end ] = [ getpos("'<"), getpos("'>") ]
	exec "norm \<Esc>"
	call setpos('.',l:end  ) | exec "norm x"
	call setpos('.',l:start) | exec "norm x"
endfunction
