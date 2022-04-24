" ~/.vim/after/syntax/tex/tikz.vim

syntax match TikzDraw   "\<\(node\|coordinates*\|cycle\|rectangle\|grid\|circle\|ellipse\|pic\|arc\|to\|plot\|edge\)\>"
syntax match TikzDraw   "\(--\||-\|-|\|\.\.\)"
syntax match TikzLabel  "\<label\>"                            contained
syntax match TikzOptDir "\<\(above\|below\|left\|right\)\>"    contained
syntax match TikzOption "\<\(below\|above\|left\|right\) of\>" contained
syntax match TikzOption "\<\(opacity\|dotted\|dashed\|fill\|text\|draw\|rotate\|solid\|circle\|inner sep\|thick\|very thick\)\>"       contained
syntax match TikzOption "\<\(scale\|line cap\|xshift\|yshift\|level distance\|sibling distance\|minumum width\|in\|out\|looseness\)\>" contained
syntax match TikzOption "\<\(rounded corners\|rectangle\|fit\|minimum size\|sloped\|pos\|name path\|name intersections\|anchor\)\>"    contained
syntax match TikzOption "\<\(bend right\|bend left\|help lines\|xscale\|yscale\|minimum width\|align\)\>"                              contained
syntax match TikzOption "\<\(red\|yellow\|orange\|blue\|black\|white\|green\)\>"
syntax match TikzYellow "\<\(child\|at\|controls\|and\|intersections*\|parent\)\>"
syntax match TikzYellow "\((\$\|\$)\)"
syntax match TikzBlue   "\<\(let\|in\)\>"
syntax region TikzOptionRegion start='\[' end='\]' contains=TikzOption,TikzOptDir,TikzLabel,TexSubMaths,TexCommand,TexArguments

syntax match TikzPicEnv "{\zstikzpicture\ze}" contained

highlight def link TikzLabel  Purple
highlight def link TikzOptDir Grey
highlight def link TikzOption Blue
highlight def link TikzBlue   Blue
highlight def link TikzDraw   Orange
highlight def link TikzYellow Yellow

highlight def link TikzPicEnv Blue
