" ~/.config/nvim/autoload/python.vim

" delete a surrounding function( e.g. print(sum(that)) ).
function! python#DelCommand()
	call search('[a-zA-Z]\{-}(', 'ce', line("."))
	exec "norm hdiwds("
endfunction
