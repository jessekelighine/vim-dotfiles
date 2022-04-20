" ~/.vim/after/ftplugin/tex/tikz.vim

" " TIKZ: tikz package.
imap <buffer> \tikz<Tab> <C-G>u<esc>:call my#GetSnippets('tex','indoc_tikz.tex')<CR>
imap <buffer> :mra<Tab>  <C-G>u\def\MarkRightAngle[size=#1,dirac=#2](#3,#4,#5){\draw($(#4)!#1cm!(#5)$)%<CR>--($($(#4)!#1cm!(#5)$)!#1cm!#2*(-90):(#5)$)--($(#4)!#1cm!(#3)$);}
imap <buffer> :bg<Tab>   <C-G>u\pgfdeclarelayer{background}<CR>\pgfsetlayers{background,main}
imap <buffer> \int<Tab>  <C-G>u\path[name intersections={of=and}]; % (intersection-1)<Esc>F=
imap <buffer> \ang<Tab>  <C-G>u\pgfmathsetmacro<++>{atan2(<++>)};<esc>F\<leader>]
imap <buffer> \pic<Tab>  <C-G>upic[pos=]{code={<++>}}<esc>F]i
imap <buffer> \mang<Tab> <C-G>u\pic["$\theta$",->,draw=blue!80,fill=blue!20] {angle = DEMO--O--Y};
imap <buffer> \var<Tab>  <C-G>u\newcommand*{++}{++};<esc>F{;ci{
imap <buffer> \blob<Tab> <C-G>u\newcommand{\blob}[2]{\draw[fill,rounded corners=#1*1mm] (#2) +($(0:#1*2+#1*rnd)$) \foreach \a in {20,40,...,350} { -- +($(\a: #1*2+#1*rnd)$) } -- cycle;}
imap <buffer> {{{<Tab>   %% {{{<CR>%% }}}<Up><Esc>B
