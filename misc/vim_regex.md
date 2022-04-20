---
title:  "VIM REGEX"
author: "b06303009@ntu.edu.tw"
date:   "2021-Mar-05"
---

# Basics

- `.`  any character except new line
- `\s` whitespace character
- `\S` non-whitespace character
- `\d` digit
- `\D` non-digit
- `\x` hex digit
- `\X` non-hex digit
- `\o` octal digit
- `\O` non-octal digit
- `\h` head of word character (a-z, A-Z and `_`)
- `\H` non-head of word character
- `\p` printable character
- `\P` like \p, but excluding digits
- `\w` word character (a-z, A-Z, 0-9)
- `\W` non-word character
- `\a` alphabetic character
- `\A` non-alphabetic character
- `\l` lowercase character
- `\L` non-lowercase character
- `\u` uppercase character
- `\U` non-uppercase character

- `\<\>` same as above: word boundary: usage: `\<WORD\>`

- `\(\)` anchor
- `[]`   ranges
- `[^]`  ranges negate

# Quantifier

- `*`      matches 0 or more of the preceding characters
- `\+`     matches 1 or more of the preceding characters
- `\=`     matches 0 or 1 more of the preceding characters
- `\{n,m}` matches from n to m of the preceding characters
- `\{n}`   matches exactly n times of the preceding characters
- `\{,m}`  matches at most m (from 0 to m) of the preceding characters
- `\{n,}`  matches at least n of of the preceding characters

- `\{-n,m}` matches n to m of the preceding atom, as few as possible
- `\{-n}`   matches n of the preceding atom
- `\{-n,}`  matches at least n of the preceding atom, as few as possible
- `\{-,m}`  matches 0 to m of the preceding atom, as few as possible
- `\{-}`    matches 0 or more of the preceding atom, non greedy, non-greedy

# Replacement

- `&`  the whole matched pattern
- `\0` the whole matched pattern
- `\1` the matched pattern in the first pair of `\(\)`
- `\L` the following characters are made lowercase
- `\U` the following characters are made uppercase
- `\E` end of `\U` and `\L`
- `\e` end of `\U` and `\L`
- `\r` split line in two at this point; insert `\n`
- `\l` next character made lowercase
- `\u` next character made uppercase
- `~`  the previous substitute string

# Additional tips

- using the search pattern in `/` in `:%s`.
	- In general, an empty regular expression means to use the previously 
	  entered regular expression, so `:%s//\1/g` should do what you want.
	- Also, if you want to verify or modify the last used pattern, 
	  you can use `<C-R>` then `/` to insert the contents of the search 
	  pattern register `/` directly into a partially typed command line.
- Replacing in visual block: 
  use command `:'<,'>s/\%V{pattern}/{replace}/{option}` where the `\%V` 
  specifies that the replacement is only done in the selected block.
- Note that atoms in `[]`'s have different meanings. E.g., `.` outside of `[]`
  means any character, but in `[]` it means literally `.`.
