" ~/.vim/after/syntax/tex/tikz.vim

syntax match  TexTikzDraw   "\<\(node\|coordinates*\|cycle\|rectangle\|grid\|circle\|ellipse\|pic\|arc\|to\|plot\|edge\)\>"
syntax match  TexTikzDraw   "\(--\||-\|-|\|\.\.\)"
syntax match  TexTikzLabel  "\<label\>"                            contained
syntax match  TexTikzOptDir "\<\(above\|below\|left\|right\)\>"    contained
syntax match  TexTikzOption "\<\(below\|above\|left\|right\) of\>" contained
syntax match  TexTikzOption "\<\(opacity\|dotted\|dashed\|fill\|text\|draw\|rotate\|solid\|circle\|inner sep\|thick\|very thick\)\>"       contained
syntax match  TexTikzOption "\<\(scale\|line cap\|xshift\|yshift\|level distance\|sibling distance\|minumum width\|in\|out\|looseness\)\>" contained
syntax match  TexTikzOption "\<\(rounded corners\|rectangle\|fit\|minimum size\|sloped\|pos\|name path\|name intersections\|anchor\)\>"    contained
syntax match  TexTikzOption "\<\(bend right\|bend left\|help lines\|xscale\|yscale\|minimum width\|align\)\>"                              contained
syntax match  TexTikzOption "\<\(red\|yellow\|orange\|blue\|black\|white\|green\)\>"
syntax match  TexTikzYellow "\<\(child\|at\|controls\|and\|intersections*\|parent\)\>"
syntax match  TexTikzYellow "\((\$\|\$)\)"
syntax match  TexTikzBlue   "\<\(let\|in\)\>"
syntax region TexTikzOptionRegion start='\[' end='\]' contains=TikzOption,TikzOptDir,TikzLabel,TexSubMaths,TexCommand,TexArguments

syntax match TexTikzPicEnv "{\zstikzpicture\ze}" contained

highlight def link TexTikzLabel  Purple
highlight def link TexTikzOptDir Grey
highlight def link TexTikzOption Blue
highlight def link TexTikzBlue   Blue
highlight def link TexTikzDraw   Orange
highlight def link TexTikzYellow Yellow

highlight def link TexTikzPicEnv Blue
