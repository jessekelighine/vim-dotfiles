" Minimum highlighting of yaml header (copied from vim82)
syn match  rmdYamlFieldTtl  /^\s*\zs[a-zA-Z0-9-]*\ze:/ contained
syn match  rmdYamlFieldTtl  /^\s*-\s*\zs\w*\ze:/ contained
syn region yamlFlowString   matchgroup=yamlFlowStringDelimiter start='"' skip='\\"' end='"' contains=yamlEscape,rmdrInline contained
syn region yamlFlowString   matchgroup=yamlFlowStringDelimiter start="'" skip="''"  end="'" contains=yamlSingleEscape,rmdrInline contained
syn match  yamlEscape       contained '\\\%([\\"abefnrtv\^0_ NLP\n]\|x\x\x\|u\x\{4}\|U\x\{8}\)'
syn match  yamlSingleEscape contained "''"
syn region pandocYAMLHeader matchgroup=rmdYamlBlockDelim start=/\%(\%^\|\_^\s*\n\)\@<=\_^-\{3}\ze\n.\+/ end=/^\([-.]\)\1\{2}$/ keepend contains=rmdYamlFieldTtl,yamlFlowString

highlight def link rmdYamlBlockDelim Delimiter
highlight def link rmdYamlFieldTtl Identifier
highlight def link yamlFlowString String

" added by me (migrated from after/syntax)
syntax match   MarkdownListExpand "^\s*\(-\|+\|\*\|\d\{-}\.\|(\d.\{-})\)\s"
syntax region  MarkdownComment    start="<!--" end="-->" contains=MarkdownTODO
syntax region  TexMath            matchgroup=TexDollar start="\$"   end="\$"   contains=@NoSpell
syntax region  TexMathEnv         matchgroup=TexDollar start="\$\$" end="\$\$" contains=@NoSpell
syntax keyword MarkdownTODO       TODO

highlight def link MarkdownListExpand Red
highlight def link TexDollar          Grey
highlight def link TexMath            String
highlight def link TexMathEnv         String
highlight def link MarkdownComment    Comment
highlight def link MarkdownTODO       Todo
