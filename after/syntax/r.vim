" ~/.config/nvim/after/syntax/r.vim

syntax match RDTSet ":="
syntax match RPrefix "`.\{-}`"

highlight def link RDTSet  Operator
highlight def link RPrefix Operator
