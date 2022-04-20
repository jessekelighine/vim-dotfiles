" ~/.config/nvim/filetype.vim

augroup filetypedetect
	autocmd! BufRead,BufNewFile *.ctx,*.tex setlocal filetype=tex
	autocmd! BufRead,BufNewFile *.csv,*.tsv setlocal filetype=csv
augroup END
