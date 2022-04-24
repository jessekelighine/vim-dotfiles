" my.vim

" read from snippets.
function! my#GetSnippets(type, path, indent=1, delete_begin=1, cursor_begin=1)
	let [ l:begin, l:lines ] = [ line("."), line("$") ]
	exe "read ".$HOME."/.config/nvim/snippets/".a:type."/".a:path
	let l:end = l:begin + ( line("$") - l:lines ) - 1
	cal cursor(l:begin,0)
	if a:delete_begin | call execute('norm dd')                   | endif
	if a:indent       | call execute(l:begin.','.l:end.'norm v=') | endif
	if a:cursor_begin | call cursor(l:begin,0)                    | endif
endfunction

" source a local vimrc file if exists.
function! my#LocalVimrc(filename='.vimrc')
	if filereadable(a:filename) | call execute('source .vimrc') | endif
endfunction

" get date.
function! my#GetDate()
	let l:return = strftime("%Y-%b-%d")
	echom l:return | return l:return
endfunction

" toggles spelling, ignoring Chinese characters.
function! my#ChineseSpelling(de=0)
	set spell!
	exe "set spelllang=en" . ( a:de ? ",de" : "" )
	set spelllang+=cjk
	set spell?
endfunction

" toggle line number options
function! my#ToggleLineNumber()
	let l:num  = matchstr(execute('set number?'),        'no')
	let l:rnum = matchstr(execute('set relativenumber?'),'no')
	if     l:num==''   && l:rnum==''   | set norelativenumber
	elseif l:num==''   && l:rnum=='no' | set nonumber
	elseif l:num=='no' && l:rnum=='no' | set relativenumber
	elseif l:num=='no' && l:rnum==''   | set number
	endif
	let l:num  = ( matchstr(execute('set number?'),        'no')=='no' ? '[NO]' : '' )."number"
	let l:rnum = ( matchstr(execute('set relativenumber?'),'no')=='no' ? '[NO]' : '' )."relativenumber"
	echo "--> Line Number:" l:num "&" l:rnum
	return
endfunction

" remove trailing white spaces.
function! my#RemoveTrailingSpaces()
	let l:pos = getpos(".")
	try
		silent %s/^\(.\{-}\)\s\+$/\1/g
		redraw | echom "--> Trailing white spaces removed!"
	catch
		redraw | echom "--> No trailing white spaces found."
	endtry
	call setpos('.',l:pos)
endfunction

" rough Chinese word count (through counting non-ASCII characters).
function! my#ChineseWordCount()
	try   | %s/[^\x00-\xff]//gn
	catch | redraw | echom "--> No Chinese words found."
	endtry
endfunction

" split long Chinese sentences by punctuation.
function! my#SplitChineseSentence() range
	s/\([，。？！；]\)\n\{0,1}/\1\r/g
endfunction

" change the display width of a tab.
function! my#TabSize(size)
	exec "setlocal noexpandtab"
	exec "setlocal shiftwidth="  . a:size
	exec "setlocal softtabstop=" . a:size
	exec "setlocal tabstop="     . a:size
endfunction

" put <COUNT> blank lines above/below the current line.
function! my#MakeRoom(direction,number=1)
	let l:command = "norm " .
				\ ( a:direction=='above' ? 'O' : 'o' ) .
				\ repeat( "\<CR>", a:number-1 ) .
				\ "\<Esc>"
	let l:line = line('.') + ( a:direction=='above' ? a:number : 0 )
	let l:col  = col('.')
	silent exec l:command
	call cursor(l:line, l:col)
endfunction

" delete paried characters.
" This function is written for cases where "%" works but "ds" (by vim-surround)
" does not.  This is the case for all matched Chinese characters, e.g.
" fill-width brackets, Chinese quotes, etc.
function! my#DeletePair()
	let [ l:l1, l:c1 ] = [ line("."), col(".") ] | norm %
	let [ l:l2, l:c2 ] = [ line("."), col(".") ] | norm %
	if l:l1==l:l2 && l:c1>l:c2 | let [l:c1,l:c2] = [l:c2,l:c1] | endif
	call cursor(l:l2,l:c2) | norm x
	call cursor(l:l1,l:c1) | norm x
endfunction

" Delete surrounding function calls: 'print(...)' --> '...'. A function assumes
" the form "<HEAD><BODY>\{-}<SPACE>\{-}<BRACKETS_OPEN>...<BRACKETS_CLOSE>".
" Testing: funcOne(aa, funcTwo (bb, funcThree(cc)), dd, funcFour (hh, funcFive (ee), gg), ff)
function! my#DelFuncCall(head='[a-zA-Z]', body='[a-zA-Z0-9]', brackets='()')
	let l:col  = col('.') - 1
	let l:line = getline('.')
	for l:i in range(strlen(l:line))
		let l:char = l:line[l:col + l:i]
		if  l:char=~a:head && l:i==0 | continue | endif
		if  l:char==' '              | continue | endif
		if  l:char=~a:body           | continue | endif
		if  l:char==a:brackets[0]    | break    | endif
		execu 'norm va'.a:brackets[0]."o\<Esc>"
		break
	endfor
	call search(a:head.a:body.'\{-}'.'\s\{-}'.a:brackets[0], 'cb')
	exec 'norm dt'.a:brackets[0]
	call my#DeletePair()
endfunction

" highlight git merge conflict.
let g:my_git_conflict_highlight_toggle = 1
function! my#ConflictHighlight()
	syntax match GitConflict "^>>>>>>>.*$"
	syntax match GitConflict "^<<<<<<<.*$"
	syntax match GitConflict "^=======$"
	if g:my_git_conflict_highlight_toggle
		let g:my_git_conflict_highlight_toggle = 0
		highlight GitConflict ctermfg=White ctermbg=Red guifg=White guibg=Red
		redraw | echom "--> Merge conflict highlighted."
	else
		let g:my_git_conflict_highlight_toggle = 1
		silent syntax clear GitConflict
		redraw | echom "--> Clear merge conflict highlight."
	endif
endfunction

" change the 'Last Modified' date automatically. The pattern provided must
" match the entirety of the 'Last Modified' part including the old date. The
" pattern must contain 2 capture groups, the 2 groups will be reused at the
" beginning and the end of the substitution. E.g., if the 'Last Modified'
" format on a file is 'date:   "2022-01-01"', then the pattern should look
" like `^\(date:\s\{-}"\).\{-}\("\)`.
function! my#LastMod(pattern, line=6)
	exec "norm m'"
	exec "1,".a:line.'g/'.a:pattern.'/s/'.a:pattern.'/\1'.strftime("%Y-%b-%d").'\2'
	exec "norm `'"
endfunction

" Testing encoding.
function! my#TestEncoding()
	let l:encodings = [
				\ 'latin1',
				\ 'iso-8859-2',  'iso-8859-3',  'iso-8859-4',  'iso-8859-5',  'iso-8859-6',
				\ 'iso-8859-7',  'iso-8859-8',  'iso-8859-9',  'iso-8859-10', 'iso-8859-11',
				\ 'iso-8859-13', 'iso-8859-14', 'iso-8859-15',
				\ 'cp437',  'cp737',  'cp775',  'cp850',  'cp852',  'cp855',  'cp857',
				\ 'cp860',  'cp861',  'cp862',  'cp863',  'cp865',  'cp866',  'cp869',
				\ 'cp874',  'cp1250', 'cp1251', 'cp1253', 'cp1254', 'cp1255', 'cp1256',
				\ 'cp1257', 'cp1258', 'cp932',  'cp949',  'cp936',  'cp950',
				\ 'ucs-2', 'ucs-2le', 'ucs-4', 'ucs-4le',
				\ 'euc-jp', 'euc-kr', 'euc-cn', 'euc-tw',
				\ 'utf-8', 'utf-16', 'utf-16le',
				\ 'koi8-r', 'koi8-u',
				\ 'sjis', 'big5', 'macroman']
	for l:encoding in l:encodings
		exec "norm :set encoding=" . l:encoding . "\<CR>"
		redraw | echom l:encoding
		call input('Press any key to continue')
	endfor
endfunction
