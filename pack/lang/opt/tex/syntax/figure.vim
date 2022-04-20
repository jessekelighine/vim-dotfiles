" ~/.vim/after/syntax/tex/fig.vim

syntax match TexFigEnv "{\zs\(figure\|table\)\ze}" contained

highlight TexFigEnv ctermfg=109 cterm=bold guifg=#89beba
