" ~/.config/nvim/site/ftplugin/tex.vim
" ~/.config/nvim/snippets/tex/
" ~/.config/nvim/after/indent/tex.vim
" ~/.config/nvim/pack/lang/opt/tex/
" ~/.config/nvim/autoload/tex.vim
" ~/.config/nvim/autoload/textoggle.vim
" ~/.config/nvim/autoload/texcomplete.vim

" SETTINGS: fast syntax, comment, spell, indent environment.
packadd  matchit
setlocal synmaxcol=200
setlocal commentstring=%\ %s
setlocal spellfile=~/.config/nvim/spell/en.utf-8.add,~/.config/nvim/spell/latex.utf-8.add
setlocal foldmethod=manual
setlocal foldnestmax=1
let g:tex_noindent_env='document\|verbatim\|lstlisting\|multicols'
let g:tex_indent_brace=0

" SURROUND: surround settings.
let b:surround_indent=1
let b:surround_66 ="\\Big\r\\Big"
let b:surround_98 ="\\big\r\\big"
let b:surround_99 ="\\\1--> Command: \1{\r}"
let b:surround_81 ="``\r''"
let b:surround_113="`\r'"
let b:surround_101="\\begin{\1--> Environment name: \1}\r\\end{\1\1}"
let b:surround_108="\\left\r\\right"
let b:surround_103="($\r$)"

" FUNCTION KEYS:
nnoremap <buffer> <F1> :tabnew ~/.config/nvim/ftplugin/tex.vim<CR>
nnoremap <buffer> <F2> :tabnew ~/.config/nvim/syntax/tex.vim<CR>
nnoremap <buffer> <F5> :call tex#Compile("xelatex",'jobstart')<CR>
nnoremap <buffer> <F6> :call tex#Compile("xelatexmk",'termopen')<CR>
" nnoremap <buffer> <F5> :call tex#Compile("xelatex",'!')<CR><CR>
" nnoremap <buffer> <F6> :call tex#Compile("latex")<CR>
" nnoremap <buffer> <F6> :call tex#Compile("cwtex")<CR>
" nnoremap <buffer> <F6> :call tex#Compile("xelatexmk")<CR>
" nnoremap <buffer> <F6> :call tex#Compile("latexmk")<CR>
" nnoremap <buffer> <F6> :call tex#Compile("png")<CR>
" nnoremap <buffer> <F6> :call tex#Compile("png_white")<CR>

" UTILITIES: utilities.
nnoremap <buffer> <leader>p :! open %:r.pdf<CR><CR>
nnoremap <buffer> <leader>c :call tex#EnvironmentChange()<CR>
nnoremap <buffer> <leader>d :call tex#EnvironmentDelete()<CR>
nnoremap <buffer> <leader>, :call tex#DelLeftRight()<CR>
nnoremap <buffer> <leader>8 :call tex#EnvironmentStar()<CR>
nnoremap <buffer> <leader>t :call textoggle#Master()<CR>
nnoremap <buffer> <leader>; :call my#DelFuncCall('\\','[a-zA-Z]','{}')<CR>
command! -buffer -nargs=? CompileLaTeX :call tex#Compile(<args>,'termopen')
command! -buffer -nargs=0 LastMod      :call my#LastMod('^\(%* *Last Modified: *\)[^ ]*',7)
command! -buffer -nargs=0 ReloadTeX    :call textoggle#Reload()
command! -buffer -nargs=0 ShowToggles  :call textoggle#Show()
command! -buffer -nargs=0 ClearToggles :call textoggle#Clear()
command! -buffer -nargs=0 RemoveJunk   :! latexmk -C %:r
command! -buffer -nargs=0 FindSection  :call tex#FindSection()

" COMPLETETION: `Lables` and `Biblography` complete settings.
setlocal completefunc=texcomplete#Label
setlocal omnifunc=texcomplete#Bib
command! -buffer -nargs=1 LazyComplete :call texcomplete#SetLazy(<args>)
command! -buffer -nargs=0 ShowLables   :call texcomplete#Show('label')
command! -buffer -nargs=0 ShowBib      :call texcomplete#Show('bib')
if !has('nvim') | silent call texcomplete#SetLazy(1) | endif

" PREAMBLES: stored in "./tex_snippets".
inoremap <buffer> :qui<tab>     <Esc>:call my#GetSnippets('tex','skeleton.tex')<CR>
inoremap <buffer> :beamer<tab>  <Esc>:call my#GetSnippets('tex','preamble_beamer.tex')<CR>
inoremap <buffer> :std<tab>     <Esc>:call my#GetSnippets('tex','preamble_standalone.tex')<CR>
inoremap <buffer> :xe<tab>      <Esc>:call my#GetSnippets('tex','preamble_xe.tex')<CR>
inoremap <buffer> :cw<tab>      <Esc>:call my#GetSnippets('tex','preamble_cwtex.tex')<CR>
inoremap <buffer> :punct<tab>   <Esc>:call my#GetSnippets('tex','preamble_punct.tex')<CR>
inoremap <buffer> :bib<tab>     <Esc>:call my#GetSnippets('tex','preamble_biblatex.tex')<CR>
inoremap <buffer> :tit<tab>     <Esc>:call my#GetSnippets('tex','preamble_title.tex')<CR>
inoremap <buffer> :chenum<tab>  <Esc>:call my#GetSnippets('tex','preamble_chineseenumerate.tex')<CR>
inoremap <buffer> :chnum<tab>   <Esc>:call my#GetSnippets('tex','preamble_chinesenumber.tex')<CR>
inoremap <buffer> :color<tab>   <Esc>:call my#GetSnippets('tex','preamble_color.tex')<CR>
inoremap <buffer> :csv<tab>     <Esc>:call my#GetSnippets('tex','preamble_csv.tex')<CR>
inoremap <buffer> :cols<tab>    <Esc>:call my#GetSnippets('tex','preamble_column.tex')<CR>
inoremap <buffer> :ct<tab>      <Esc>:call my#GetSnippets('tex','preamble_customtitle.tex')<CR>
inoremap <buffer> :enum<tab>    <Esc>:call my#GetSnippets('tex','preamble_enumerate.tex')<CR>
inoremap <buffer> :faux<tab>    <Esc>:call my#GetSnippets('tex','preamble_fauxsc.tex')<CR>
inoremap <buffer> :fig<tab>     <Esc>:call my#GetSnippets('tex','preamble_graphics.tex')<CR>
inoremap <buffer> :foot<tab>    <Esc>:call my#GetSnippets('tex','preamble_footnote.tex')<CR>
inoremap <buffer> :font<tab>    <Esc>:call my#GetSnippets('tex','preamble_font.tex')<CR>
inoremap <buffer> :german<tab>  <Esc>:call my#GetSnippets('tex','preamble_german.tex')<CR>
inoremap <buffer> :hyper<tab>   <Esc>:call my#GetSnippets('tex','preamble_hyperreference.tex')<CR>
inoremap <buffer> :lof<tab>     <Esc>:call my#GetSnippets('tex','preamble_listoffigures.tex')<CR>
inoremap <buffer> :math<tab>    <Esc>:call my#GetSnippets('tex','preamble_math.tex')<CR>
inoremap <buffer> :mn<tab>      <Esc>:call my#GetSnippets('tex','preamble_mathnotes.tex')<CR>
inoremap <buffer> :ow<tab>      <Esc>:call my#GetSnippets('tex','preamble_noorphanwidow.tex')<CR>
inoremap <buffer> :problem<tab> <Esc>:call my#GetSnippets('tex','preamble_problem.tex')<CR>
inoremap <buffer> :prob<tab>    <Esc>:call my#GetSnippets('tex','preamble_mathprob.tex')<CR>
inoremap <buffer> :pagec<tab>   <Esc>:call my#GetSnippets('tex','preamble_pagechinese.tex')<CR>
inoremap <buffer> :pagee<tab>   <Esc>:call my#GetSnippets('tex','preamble_pageenglish.tex')<CR>
inoremap <buffer> :pageg<tab>   <Esc>:call my#GetSnippets('tex','preamble_pagegerman.tex')<CR>
inoremap <buffer> :pageb<tab>   <Esc>:call my#GetSnippets('tex','preamble_pagebeamer.tex')<CR>
inoremap <buffer> :pagep<tab>   <Esc>:call my#GetSnippets('tex','preamble_pageplain.tex')<CR>
inoremap <buffer> :ruby<tab>    <Esc>:call my#GetSnippets('tex','preamble_ruby.tex')<CR>
inoremap <buffer> :rule<tab>    <Esc>:call my#GetSnippets('tex','preamble_rules.tex')<CR>
inoremap <buffer> :secf<tab>    <Esc>:call my#GetSnippets('tex','preamble_sectionfont.tex')<CR>
inoremap <buffer> :set<tab>     <Esc>:call my#GetSnippets('tex','preamble_package.tex')<CR>
inoremap <buffer> :shrug<tab>   <Esc>:call my#GetSnippets('tex','preamble_shruggie.tex')<CR>
inoremap <buffer> :sign<tab>    <Esc>:call my#GetSnippets('tex','preamble_sign.tex')<CR>
inoremap <buffer> :tikz<tab>    <Esc>:call my#GetSnippets('tex','preamble_tikz.tex')<CR>
inoremap <buffer> :toc<tab>     <Esc>:call my#GetSnippets('tex','preamble_tableofcontents.tex')<CR>
inoremap <buffer> :time<tab>    <Esc>:call my#GetSnippets('tex','preamble_time.tex')<CR>
inoremap <buffer> :udxe<tab>    <Esc>:call my#GetSnippets('tex','preamble_underdotxe.tex')<CR>
inoremap <buffer> :udcw<tab>    <Esc>:call my#GetSnippets('tex','preamble_underdotcwtex.tex')<CR>
inoremap <buffer> :verb<tab>    <Esc>:call my#GetSnippets('tex','preamble_fancyvrb.tex')<CR>
inoremap <buffer> :blind<tab>   <Esc>:call my#GetSnippets('tex','preamble_blindtext.tex')<CR>

" MISC: page environments.
inoremap <buffer> \b<Tab>      <Esc>:call tex#EmptyEnvironment()<CR>
inoremap <buffer> \doc<Tab>    <Esc>:call tex#EmptyEnvironment('document')<CR>
inoremap <buffer> \cols<Tab>   <Esc>:call tex#EmptyEnvironment('multicols','{2}')<CR>
inoremap <buffer> \cbreak<Tab> <C-G>u\vfill\null\columnbreak
inoremap <buffer> \blind<Tab>  <Esc>:call my#GetSnippets('tex','indoc_blindtext.tex')<CR>
inoremap <buffer> \vi<Tab>     <Esc>:call my#GetSnippets('tex','indoc_verbatiminput.tex')<CR>$i

" MATH: math shortcuts.
inoremap <buffer> _<Tab>          <C-G>u_{}<Left>
inoremap <buffer> ^<Tab>          <C-G>u^{}<Left>
inoremap <buffer> $<Tab>          <C-G>u$$<Left>
inoremap <buffer> ]<Tab>          <C-G>u\left[\right]<Esc><S-F>[a
inoremap <buffer> )<Tab>          <C-G>u\left(\right)<Esc><S-F>(a
inoremap <buffer> }<Tab>          <C-G>u\left\{\right\}<Esc><S-F>{a
inoremap <buffer> {{<Tab>         <C-G>u\{\}<Esc><S-F>{a
inoremap <buffer> <bar><Tab>      <C-G>u<bar><bar><Left>
inoremap <buffer> <bar><bar><Tab> <C-G>u\left<bar>\right<bar><Esc>6hi
inoremap <buffer> \ali<Tab>       <Esc>:call tex#EmptyEnvironment('aligned')<CR>
inoremap <buffer> \ba<Tab>        <Esc>:call tex#EmptyEnvironment('align*')<CR>o
inoremap <buffer> \cases<Tab>     <Esc>:call tex#EmptyEnvironment('cases')<CR>
inoremap <buffer> \mat<Tab>       <Esc>:call tex#EmptyEnvironment('bmatrix')<CR>
inoremap <buffer> \vmat<Tab>      <Esc>:call tex#EmptyEnvironment('vmatrix')<CR>
inoremap <buffer> \ma<Tab>        <Esc>:call my#GetSnippets('tex','indoc_matrix.tex')<CR>

" FIGURES AND TABLES: insert figure/table environments.
inoremap <buffer> \btab<Tab>  <Esc>:call my#GetSnippets('tex','indoc_envtable.tex')<CR>
inoremap <buffer> \csv<Tab> <Esc>:call my#GetSnippets('tex','indoc_envtable_csv.tex',0)<CR>
inoremap <buffer> \bfig<Tab>  <Esc>:call my#GetSnippets('tex','indoc_envfigure.tex')<CR>
inoremap <buffer> \mini<Tab>  <Esc>:call my#GetSnippets('tex','indoc_minipage.tex')<CR>
inoremap <buffer> \tab<Tab>   <Esc>:call my#GetSnippets('tex','indoc_table.tex')<CR>
inoremap <buffer> \fig<Tab>   <Esc>:call my#GetSnippets('tex','indoc_figure.tex')<CR>

" LISTS: enumerate and itemize lists.
inoremap <buffer> \enum<Tab>  <Esc>:call my#GetSnippets('tex','indoc_enum_arabic.tex')<CR>
inoremap <buffer> \enumr<Tab> <Esc>:call my#GetSnippets('tex','indoc_enum_roman.tex')<CR>
inoremap <buffer> \enuma<Tab> <Esc>:call my#GetSnippets('tex','indoc_enum_alph.tex')<CR>
inoremap <buffer> \enump<Tab> <Esc>:call my#GetSnippets('tex','indoc_enum_pure.tex')<CR>
inoremap <buffer> \item<Tab>  <Esc>:call my#GetSnippets('tex','indoc_item.tex')<CR>
inoremap <buffer> \iffa<Tab>  <Esc>:call my#GetSnippets('tex','indoc_iff_arrow.tex')<CR>
inoremap <buffer> \iffc<Tab>  <Esc>:call my#GetSnippets('tex','indoc_iff_cup.tex')<CR>

" TEXT: text/font modifiers.
inoremap <buffer> \bf<Tab> <C-G>u\textbf{}<Left>
inoremap <buffer> \sf<Tab> <C-G>u\textsf{}<Left>
inoremap <buffer> \tt<Tab> <C-G>u\texttt{}<Left>
inoremap <buffer> \em<Tab> <C-G>u\emph{}<Left>
inoremap <buffer> \it<Tab> <C-G>u\textit{}<Left>
inoremap <buffer> \ud<Tab> <C-G>u\underdot{}<Left>
inoremap <buffer> \bs<Tab> <C-G>u\boldsymbol{}<Left>
inoremap <buffer> \t<Tab>  <C-G>u\text{}<Left>
inoremap <buffer> \v<Tab>  <C-G>u\verb""<Left>
inoremap <buffer> \mb<Tab> <C-G>u\mathbf{}<Left>
inoremap <buffer> \mc<Tab> <C-G>u\mathcal{}<Left>
inoremap <buffer> \ms<Tab> <C-G>u\mathscr{}<Left>
inoremap <buffer> \mr<Tab> <C-G>u\mathrm{}<Left>
inoremap <buffer> \bb<Tab> <C-G>u\mathbb{}<Left>

" QUOTE OBJECT: in/all/surround quotes.
xnoremap <buffer> <silent> iQ :<C-U>call tex#Quotes("i",1)<CR>
xnoremap <buffer> <silent> aQ :<C-U>call tex#Quotes("a",1)<CR>
onoremap <buffer> <silent> iQ :<C-U>call tex#Quotes("i",1)<CR>
onoremap <buffer> <silent> aQ :<C-U>call tex#Quotes("a",1)<CR>
onoremap <buffer> <silent> QQ :<C-U>call tex#Quotes("q",1)<CR>
xnoremap <buffer> <silent> iq :<C-U>call tex#Quotes("i",0)<CR>
xnoremap <buffer> <silent> aq :<C-U>call tex#Quotes("a",0)<CR>
onoremap <buffer> <silent> iq :<C-U>call tex#Quotes("i",0)<CR>
onoremap <buffer> <silent> aq :<C-U>call tex#Quotes("a",0)<CR>
onoremap <buffer> <silent> qq :<C-U>call tex#Quotes("q",0)<CR>
