" ~/.vim/after/syntax/tex/mathnotes.vim

syntax match TexAmsthmEnv "{\zs\(assumption\|lemma\|corollary\|example\|remark\|proposition\|problem\|theorem\|definition\|proof\)\ze\*\=}" contained

highlight def link TexAmsthmEnv Blue
