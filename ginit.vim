" ~/.config/nvim/ginit.vim

if has('nvim')
	set linespace=1
else
	" cursor color
	augroup Cursor
	autocmd ColorScheme * highlight Cursor guifg=White guibg=Black
	augroup END
	" set transparency=10
	set linespace=0
endif

let g:everforest_background = 'hard'
colorscheme everforest

" set guifont=IBM\ Plex\ Mono\ Light:h18
set guifont=IBM\ Plex\ Mono\ Light:h18
set guicursor+=a:blinkon0
set guicursor+=i-ci:blinkwait1000-blinkon500-blinkoff200-ver20-iCursor
set guioptions=Ace
set lines=32 columns=100
set mouse=
set nocursorcolumn

let $PATH = $PATH . ":/usr/local/texlive/2021/bin/universal-darwin"

""" no scrolling: UP/DOWN
" nnoremap <ScrollWheelUp>      <nop>
" nnoremap <S-ScrollWheelUp>    <nop>
" nnoremap <C-ScrollWheelUp>    <nop>
" nnoremap <ScrollWheelDown>    <nop>
" nnoremap <S-ScrollWheelDown>  <nop>
" nnoremap <C-ScrollWheelDown>  <nop>
inoremap <ScrollWheelUp>      <nop>
inoremap <S-ScrollWheelUp>    <nop>
inoremap <C-ScrollWheelUp>    <nop>
inoremap <ScrollWheelDown>    <nop>
inoremap <S-ScrollWheelDown>  <nop>
inoremap <C-ScrollWheelDown>  <nop>

""" no scrolling: LEFT/RIGHT
nnoremap <ScrollWheelLeft>    <nop>
nnoremap <S-ScrollWheelLeft>  <nop>
nnoremap <C-ScrollWheelLeft>  <nop>
nnoremap <ScrollWheelRight>   <nop>
nnoremap <S-ScrollWheelRight> <nop>
nnoremap <C-ScrollWheelRight> <nop>
inoremap <ScrollWheelLeft>    <nop>
inoremap <S-ScrollWheelLeft>  <nop>
inoremap <C-ScrollWheelLeft>  <nop>
inoremap <ScrollWheelRight>   <nop>
inoremap <S-ScrollWheelRight> <nop>
inoremap <C-ScrollWheelRight> <nop>
