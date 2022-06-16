" ~/.config/nvim/autoload/texcomplete.vim

"##############################################################################
"### SETTINGS #################################################################
"##############################################################################

let g:texcomplete_autolabelsfiles=@%
let g:texcomplete_autobibfile='ref.bib'
let g:texcomplete_lazy=0

function! texcomplete#SetBibFile(file='ref.bib')
	let g:texcomplete_autobibfile = a:file
endfunction

function! texcomplete#SetLabelFiles(files=@%)
	let g:texcomplete_autolabelsfiles = a:files
endfunction

" Toggle `g:texcomplete_lazy`.
function! texcomplete#SetLazy(set)
	let g:texcomplete_lazy = a:set
	redraw | echom '--> Lazy Complete: '.( g:texcomplete_lazy ? 'ON' : 'OFF')
endfunction

"##############################################################################
"### COMPLETION FUNCTION ######################################################
"##############################################################################

" Makes the list `g:texcomplete_labels` for auto-complete. The
" argument `a:files` is a string of file names (separated by spaces, thus no
" files can contain names with spaces), that contains labels we want to
" complete. If no such argument is given, this function only searches for
" labels in the current tex file. The default argument will be updated
" with each call of the function.
" Assumptions:
" - There is only one `\label{...}` on each line of the tex file.
function! texcomplete#GenerateLabel(files=g:texcomplete_autolabelsfiles) abort
	let g:texcomplete_autolabelsfiles = a:files
	let g:texcomplete_labels = []
	for l:file in split(g:texcomplete_autolabelsfiles)
		let @9 = @z
		norm qzq
		silent exec "split ".l:file
		silent exec "g/\\label{/yank Z"
		silent quit
		let l:labels = split(@z,"\n")
		let @z = @9
		for l:i in range(len(l:labels))
			let l:labels[l:i] = {
						\ 'word': matchstr(l:labels[l:i],'\\label{\zs.\{-}\ze}'),
						\ 'menu': '['.l:file.']',
						\ }
		endfor
		let g:texcomplete_labels = g:texcomplete_labels + l:labels
	endfor
endfunction

" Auto-complete for LaTeX labels. Regenerates `b:texcomplete_lables` on each
" function call if `g:texcomplete_lazy` is set to 0. Returns the labels in the
" order they appear in the tex document.
function! texcomplete#Label(findstart,base) abort
	if a:findstart
		return matchstrpos(getline('.'),'.*{')[2]
	else
		let l:suggestions = []
		if !g:texcomplete_lazy | call texcomplete#GenerateLabel() | endif
		for l:item in g:texcomplete_labels
			if l:item['word']=~'^'.a:base
				call add(l:suggestions, l:item)
			endif
		endfor
		return l:suggestions
	endif
endfunction

" Makes a completion list `g:texcomplete_bib` for auto-complete.
" The default argument will be updated with each call of the function.
" Assumptions:
" - No multiple bib items on the same line.
function! texcomplete#GenerateBib(file=g:texcomplete_autobibfile)
	let g:texcomplete_autobibfile = a:file
	let @9 = @z
	norm qzq
	silent exec "split ".a:file
	g/^@[a-z]\{-}{/yank Z
	silent quit
	let l:bibs = split(@z,"\n")
	let @z = @9
	for l:i in range(len(l:bibs))
		let l:bibs[l:i] = {
					\ 'word': matchstr(l:bibs[l:i],'@[a-z]\{-}{\zs.\{-}\ze,'),
					\ 'menu': '['.matchstr(l:bibs[l:i],'@\zs[a-z]\{-}\ze{.\{-},').']',
					\ }
	endfor
	let g:texcomplete_bib = l:bibs
endfunction

" Auto-complete for items in `bib` files. Regenerates `b:texcomplete_bib` on
" each function call if `g:texcomplete_lazy` is set to 0. Returns bib items in
" the order they appeat in the bib file.
function! texcomplete#Bib(findstart,base)
	if a:findstart
		return matchstrpos(getline('.'),'.*\({\|,\)')[2]
	else
		let l:suggestions = []
		if !g:texcomplete_lazy | call texcomplete#GenerateBib() | endif
		for l:item in g:texcomplete_bib
			if l:item['word']=~'^'.a:base
				call add(l:suggestions, l:item)
			endif
		endfor
		return l:suggestions
	endif
endfunction

"##############################################################################
"### UTILITIES ################################################################
"##############################################################################

" Print out all bibs or labels. Argument `a:type` can take either 'bib' or
" 'labels'.
function! texcomplete#Show(type)
	let l:count = 1
	if     a:type=='bib'   | let l:list = g:texcomplete_bib
	elseif a:type=='label' | let l:list = g:texcomplete_labels
	endif
	for l:item in l:list
		echo l:count."\t".l:item['word']."\t".l:item['menu']
		let l:count = l:count + 1
	endfor
endfunction
