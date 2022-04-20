---
title:  "NOTES"
author: "jessekelighine@gmail.com"
date:   "2022-Mar-06"
---

# Bulk (Batch) Rename files

1. `\ls | vim -`: read all the files into vim
2. `%s/.*/mv -i <PATTERN>/g`: rename files
3. `:%!bash`: write and run the commands

# Old copy in vimrc

The following can copy to the system clipboard on a Mac.  However, if feature
`clipboard` is included in the vim you are using, then one can simply yank to
register `*`, which is represents the system clipboard register.

```vim
xnoremap <silent> '' :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>
```

# Key Repead Speed on MacOS

```sh
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```

# tpope/vim-fugitive settings

```vim
nnoremap <leader>ga :Git add<space>
nnoremap <leader>gb :Git branch<space>
nnoremap <leader>gc :Git commit<space>
nnoremap <leader>gd :Git diff<space>
nnoremap <leader>gh :Git stash<space>
nnoremap <leader>gl :Git log<space>
nnoremap <leader>gm :Git merge<space>
nnoremap <leader>gp :Git push -u origin master
nnoremap <leader>gs :Git status<space>
nnoremap <leader>gr :Git reset<space>
nnoremap <leader>gt :Git checkout<space>
```

# Miramare and Everforest modifications

1. Miramare modifications:

```vim
call s:HL('Visual',         s:palette.none,   s:palette.bg1,  'reverse')
call s:HL('CursorLineNr',   s:palette.fg,     s:palette.bg3)
call s:HL('markdownItalic', s:palette.purple, s:palette.none)
call s:HL('markdownBold',   s:palette.purple, s:palette.none, 'bold')
call s:HL('SpecialKey',     s:palette.bg4,    s:palette.none)
call s:HL('NonText',        s:palette.bg4,    s:palette.none)
call s:HL('MatchParen',     s:palette.none,   s:palette.bg3,  'bold')
call s:HL('TabLineSel',     s:palette.bg0,    s:palette.gold)
```

2. Everforest modifications:

```vim
call everforest#highlight('Visual',         s:palette.none,   s:palette.bg1,  'reverse')
call everforest#highlight('CursorLineNr',   s:palette.fg,     s:palette.bg3)
call everforest#highlight('markdownItalic', s:palette.blue,   s:palette.none, 'italic')
call everforest#highlight('markdownBold',   s:palette.purple, s:palette.none, 'bold')
```

# Git checklist

- [vimd](~/.vimdotfiles.zsh)
- [dotf](~/.dotfiles.zsh)

# Indent files

- [How to write indent files](https://psy.swansea.ac.uk/staff/carter/vim/vim_indent.htm)

# hex editing

```sh
:%!xxd
```
