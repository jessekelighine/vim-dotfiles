" ~/.config/nvim/autoload/tex.vim

" delete parenthesis modifiers (left/right,big,large,...).
function! tex#DelLeftRight()
	if getline(".")[col(".")-1] =~ '['.'()'.'\[\]'.'{}'.']'
		silent norm hhvawohx%hhviwohx%
	else
		call search('\\\(left\|Big\|big\)','cb',line(".")) | exec 'norm de'
		call search('\\\(right\|Big\|big\)','',line("."))  | exec 'norm de'
	endif
endfunction

" Compile LaTeX files.
function! tex#Compile(type='xelatex', call_type='jobstart')
	silent write
	" generate command
	if     a:type=="xelatex"   | let l:cmd = join(['xelatex',                @%], " ")
	elseif a:type=="latex"     | let l:cmd = join(['latex',                  @%], " ")
	elseif a:type=="cwtex"     | let l:cmd = join(['source ~/.zshrc; cwtex', @%], " ")
	elseif a:type=="xelatexmk" | let l:cmd = join(['latexmk -pdfxe',         @%], " ")
	elseif a:type=="latexmk"   | let l:cmd = join(['latexmk -pdf',           @%], " ")
	elseif a:type=="make"      | let l:cmd = 'make'
	elseif a:type=="png"       | let l:cmd = 'xelatex '.@%.'; convert                                -density 600 '.expand("%:r").'.pdf '.expand("%:r").'.png'
	elseif a:type=="png_white" | let l:cmd = 'xelatex '.@%.'; convert -background "#FFFFFF" -flatten -density 600 '.expand("%:r").'.pdf '.expand("%:r").'.png'
	elseif a:type==''          | echom "--> ERROR: wrong `type`." | return
	else                       | let l:cmd = a:type               | endif
	redraw | echom " ! ".l:cmd
	" call command
	if     a:call_type=='jobstart' | call jobstart(l:cmd)
	elseif a:call_type=='termopen' | call tex#TerminalOpen(l:cmd)
	elseif a:call_type=='!'        | exec '!'.l:cmd
	else | echom "--> ERROR: wrong `call_type`." | return | endif
endfunction

" open a temporary terminal to run command.
function! tex#TerminalOpen(cmd, height=10)
	exec a:height.'new'
	call termopen( a:cmd, { 'on_exit':'tex#TerminalClose' } )
	let  g:tex_temp_terminal_bn = bufnr('%')
	exec 'normal G'
	exec 'wincmd p'
	nnoremap <buffer><silent> <Space> :exec"bdelete!".g:tex_temp_terminal_bn<CR>
endfunction
" (on) exit the temporary terminal.
function! tex#TerminalClose(job_id, data, event, key='<Space>') dict
	try | call  execute('bdelete '.g:tex_temp_terminal_bn) | catch | endtry
	try | unlet g:tex_temp_terminal_bn                     | catch | endtry
	try | call  execute('nunmap <buffer> <Space>')         | catch | endtry
	redraw | echo ''
endfunction

" insert empty environment.
function! tex#EmptyEnvironment(name="", append="")
	let l:environ = a:name!="" ? a:name : input('Environment name: ')
	if  l:environ == '' | return | endif
	exec 'norm A'.
				\ '\begin{'.l:environ.'}'.a:append."\<CR>".
				\ '\end{'.l:environ.'}'.
				\ "\<Esc>vk="
endfunction

" creates quote object in latex.
function! tex#Quotes(code, double) abort
	let [ l:begin , l:end ] = [ repeat("`",(a:double?2:1)) , repeat("'",(a:double?2:1)) ]
	call search(l:begin,"bcW") | exec "norm ".repeat('l',(a:double?2:1))
	if a:code=="i"                                 | call search(l:end, "sW") | exec "norm hv`'"
	if a:code=="a" &&  a:double | exec "norm 2h"   | call search(l:end,"seW") | exec "norm v`'"
	if a:code=="q" &&  a:double | exec "norm hvhx" | call search(l:end,"seW") | exec "norm vh"
	if a:code=="a" && !a:double | exec "norm 1h"   | call search(l:end,"seW") | exec "norm v`'"
	if a:code=="q" && !a:double | exec "norm hvx"  | call search(l:end,"seW") | exec "norm v"
endfunction

"##############################################################################
"### ENCIRONMENT FUNCTIONS ####################################################
"##############################################################################

" The following environment functions depend on `matchit` package matching
" `\begin{...}` with `\end{...}`. These functions assume that there are no two
" environment declarations on the same line.

" replace the environment name on that line. Helper function for
" tex#EnvironmentChange()
function! <SID>EnvironmentReplace(change)
	call execute( 's/\V\\\(begin\|end\){\.\{-}}/\\\1{' . a:change . '}/' )
endfunction

" get the environment name. Helper function for tex#EnvironmentStar().
function! <SID>EnvironmentGet()
	return matchstr(getline('.'),'^\s*\\\(begin\|end\){\zs.\{-}\ze}')
endfunction

" change a tex environment.
function! tex#EnvironmentChange(to='')
	let l:to = a:to=='' ? input('Environment Name: ') : a:to
	if  l:to=='' | return | endif
	let l:pos = getpos('.') | exec 'norm _%'
	call <SID>EnvironmentReplace(l:to) | call setpos('.',l:pos)
	call <SID>EnvironmentReplace(l:to)
endfunction

" toggle star of a tex environment.
function! tex#EnvironmentStar()
	let l:en = <SID>EnvironmentGet()
	let l:to = strpart(l:en,strlen(l:en)-1)=='*' ? strpart(l:en,0,strlen(l:en)-1) : l:en.'*'
	call tex#EnvironmentChange(l:to)
endfunction

" delete the environment surrounding.
function! tex#EnvironmentDelete()
	let l:pos1 = getpos('.') | norm _%
	let l:pos2 = getpos('.')
	let l:pos  = l:pos1
	if l:pos1[1]>l:pos2[1] | let [l:pos1,l:pos2] = [l:pos2,l:pos1] | endif
	call setpos('.',l:pos2) | delete
	call setpos('.',l:pos1) | delete
	let l:pos2[1] = l:pos2[1] - 2
	exec "norm \<S-V>".( l:pos2[1] - l:pos1[1] ).'j='
	call setpos('.',l:pos)
endfunction
