" ~/.config/nvim/autoload/R.vim

" expand pipe symbol
function! r#PipeExpand(type)
	execut 'norm! a' . ( getline(".")[col(".")-1]!=" " ? " " : "" ) . '%>%'
	if     a:type=='CR'  | call feedkeys("a\<CR>")
	elseif a:type=='Tab' | call feedkeys("a")
	endif
endfunction
