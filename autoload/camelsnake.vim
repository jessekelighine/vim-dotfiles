" autoload/camelsnake.vim

" Test: CamelSnake --> camel_snake
function! camelsnake#To(name)
	let l:name = substitute(a:name, '\u', '_\l&', 'g')
	let l:name = l:name=='_' ? strpart(l:name,1,strlen(l:name)) : l:name
	return l:name
endfunction

function! camelsnake#From(name)
	let l:name = substitute(a:name, '_\([a-z]\)', '\u\1', 'g')
	let l:name = l:name[0]!=#'\u' ? toupper(l:name[0]).strpart(l:name,1,strlen(l:name)) : l:name
	return l:name
endfunction
