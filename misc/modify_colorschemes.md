---
title:  "Modify to Miramare and Everforest Colorschemes"
author: "jessekelighine@gmail.com"
date:   "2022-Jan-08"
---

# Miramare colors

These are the `miramare` colors:

| Name         | RGB       | 256term | term        |
| ----------   | -------   | ------- | ---------   |
| `bg0`        | `#2A2426` | `235`   | `Black`     |
| `bg1`        | `#242021` | `236`   | `DarkGrey`  |
| `bg2`        | `#242021` | `237`   | `DarkGrey`  |
| `bg3`        | `#242021` | `238`   | `DarkGrey`  |
| `bg4`        | `#242021` | `239`   | `Grey`      |
| `bg_red`     | `#392f32` | `52`    | `DarkRed`   |
| `bg_green`   | `#333b2f` | `22`    | `DarkGreen` |
| `bg_blue`    | `#203a41` | `17`    | `DarkBlue`  |
| `fg`         | `#e6d6ac` | `223`   | `White`     |
| `red`        | `#e68183` | `167`   | `Red`       |
| `orange`     | `#e39b7b` | `208`   | `Red`       |
| `yellow`     | `#d9bb80` | `214`   | `Yellow`    |
| `green`      | `#87af87` | `108`   | `Green`     |
| `cyan`       | `#87c095` | `108`   | `Cyan`      |
| `blue`       | `#89beba` | `109`   | `Blue`      |
| `purple`     | `#d3a0bc` | `175`   | `Magenta`   |
| `grey`       | `#444444` | `245`   | `LightGrey` |
| `light_grey` | `#5b5b5b` | `245`   | `LightGrey` |
| `gold`       | `#d8caac` | `214`   | `Yellow`    |


# Modifications

## Miramare

```vim
call s:HL('CursorColumn',   s:palette.none,   s:palette.none)
call s:HL('CursorLine',     s:palette.none,   s:palette.none)
call s:HL('CursorLineNr',   s:palette.fg,     s:palette.bg3)
call s:HL('Visual',         s:palette.none,   s:palette.bg1,  'reverse')
call s:HL('NonText',        s:palette.bg4,    s:palette.none)
call s:HL('SpecialKey',     s:palette.bg4,    s:palette.none)
call s:HL('MatchParen',     s:palette.none,   s:palette.bg4,  'bold')
call s:HL('TabLineSel',     s:palette.bg0,    s:palette.gold)
call s:HL('markdownBold',   s:palette.purple, s:palette.none, 'bold')
call s:HL('markdownItalic', s:palette.blue,   s:palette.none, 'italic')

call s:HL('StatusLine',     s:palette.bg1,    s:palette.yellow)
call s:HL('StatusLineNC',   s:palette.bg1,    s:palette.fg)
```

## Everforest

```vim
call everforest#highlight('Visual',         s:palette.none,   s:palette.bg1,  'reverse')
call everforest#highlight('CursorLineNr',   s:palette.fg,     s:palette.bg3)
call everforest#highlight('markdownBold',   s:palette.purple, s:palette.none, 'bold')
call everforest#highlight('markdownItalic', s:palette.blue,   s:palette.none, 'italic')
```
