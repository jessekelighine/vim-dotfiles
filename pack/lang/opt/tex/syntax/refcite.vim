" ~/.vim/after/syntax/tex/refcite.vim

syntax match TexSubRefExtra  "\\\(refeq\|refer\|figref\|tabref\)\>"                            contains=@NoSpell
syntax match TexSubRefExtra  "\\\(href\|url\|href\|hyperref\|hyperlink\)\>"                    contains=@NoSpell
syntax match TexSubCiteExtra "\\\(parencite\|citelist\|textcite\|citefield\|citename\|footcite\|cite\)\>" contains=@NoSpell

highlight TexSubRefExtra  ctermfg=208 guifg=#e39b7b
highlight TexSubCiteExtra ctermfg=208 guifg=#e39b7b
