" init.vim

" miramare
	let g:miramare_transparent_background = 1
" vim-surround
	augroup VimSurround
		autocmd!
		autocmd VimEnter,BufNewFile,BufRead * let b:surround_49="（\r）"
		autocmd VimEnter,BufNewFile,BufRead * let b:surround_50="「\r」"
		autocmd VimEnter,BufNewFile,BufRead * let b:surround_51="《\r》"
		autocmd VimEnter,BufNewFile,BufRead * let b:surround_92="\\\r\\"
		autocmd VimEnter,BufNewFile,BufRead * let b:surround_97="\1anything: \1\r\1\1"
		autocmd VimEnter,BufNewFile,BufRead * let b:surround_122="\1anything(1): \1\r\2anything(2): \2"
	augroup END
" targets.vim
	autocmd User targets#mappings#user call targets#mappings#extend({
		\ '$': { 'quote': [{'d': '\$'}] },
		\ })
" vim-easy-align
	xmap ga <Plug>(EasyAlign)
	nmap ga <Plug>(EasyAlign)
" fzf.vim
	set rtp+=~/.fzf " where fzf is installed
	let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
	let $FZF_DEFAULT_COMMAND = "rg --files --hidden"
	let g:fzf_preview_window = ['right:40%']
	let g:fzf_layout = { 'down': '~20%' }
	nnoremap <C-T> :Files<CR>
	nnoremap <C-F> :Lines<CR>
	" nnoremap <C-B> :Buffers<CR>
	nnoremap <C-B> :ls<CR>:buffer<Space>

language en_US.UTF-8
filetype plugin on
filetype indent on
syntax on
colorscheme miramare
packloadall
let &t_SI="\e[5 q"
let &t_EI="\e[2 q"
let &t_SR="\e[4 q"

nnoremap Y      y$
nnoremap zS     zszH
nnoremap <C-N>  :tabnew<CR>
nnoremap <C-J>  <C-W>j
nnoremap <C-k>  <C-W>k
nnoremap <C-h>  <C-W>h
nnoremap <C-l>  <C-W>l
nnoremap <Up>   gk
nnoremap <Down> gj
inoremap jk     <Esc>
inoremap kj     <Esc>
inoremap <C-L>  <C-G>u<Esc>[s1z=`]a<C-G>u
inoremap <C-W>  <C-G>u<C-W>
inoremap <C-U>  <C-G>u<C-U>
inoremap (<Tab> <C-G>u()<Left>
inoremap [<Tab> <C-G>u[]<Left>
inoremap {<Tab> <C-G>u{}<Left>
inoremap <<Tab> <C-G>u<><Left>
inoremap '<Tab> <C-G>u''<Left>
inoremap `<Tab> <C-G>u``<Left>
inoremap "<Tab> <C-G>u""<Left>
xnoremap >      >gv
xnoremap <      <gv
xnoremap ''     "*y
xnoremap //     y/\V<C-R>=escape(@",'/\')<CR><CR>
xnoremap <silent> p         ""p:let @"=@0<CR>
nnoremap <silent> <leader>l :set list!<CR>
nnoremap <silent> <CR>      :noh<Bar>redraw!<Bar>echo''<CR>
nnoremap <silent> <F12>     :tabnew ~/.config/nvim/init.vim<CR>
nnoremap <silent> <S-Right> :resize+5<CR>
nnoremap <silent> <S-Left>  :resize-5<CR>
nnoremap <silent> ]q        :cnext<CR>
nnoremap <silent> [q        :cprevious<CR>
nnoremap <silent> ]Q        :clast<CR>
nnoremap <silent> [Q        :cfirst<CR>
nnoremap <silent> [t        :tabprev<CR>
nnoremap <silent> ]t        :tabnext<CR>
nnoremap <silent> [b        :bprev<CR>
nnoremap <silent> ]b        :bnext<CR>
nnoremap <silent> [B        :bfirst<CR>
nnoremap <silent> ]B        :blast<CR>
nmap [<Space>    <Plug>(MakeRoomAbove)
nmap ]<Space>    <Plug>(MakeRoomBelow)
nmap <leader>s   <Plug>(ChineseSpelling)
nmap <leader>n   <Plug>(ToggleLineNumber)
nmap <nowait> dm <Plug>(DeletePair)

set encoding=utf-8
set spelllang=en
set fileformats=unix,dos,mac
set hidden
set noswapfile
set switchbuf=useopen
set autoread
set nowrap
set wildmenu wildignorecase
set display=truncate " long line will be displayed rather than '@@@'
set colorcolumn=80
set laststatus=2
set scroll=5 scrolloff=1
set number relativenumber nonumber
set backspace=indent,eol,start
set ignorecase smartcase
set hlsearch incsearch
set noerrorbells visualbell t_vb=
set autoindent breakindent
set noexpandtab shiftwidth=4 softtabstop=4 tabstop=4 smarttab
set autochdir
set history=1000
set formatoptions+=jnmB " line joining for CJK characters
set listchars=tab:┊\ ,trail:–,extends:»,precedes:«,nbsp:+,eol:¬,space:·
set mps+=（:） mps+=「:」 mps+=『:』 mps+=《:》 mps+=【:】
set synmaxcol=0 " 300
set splitbelow
set nrformats+=alpha
set statusline=\ [%M]\ %F\ %y%=%(%c%V\ %l/%L\ %p%%\ \ %) " as
set lazyredraw ttyfast re=1
set timeoutlen=500 ttimeoutlen=50
let g:netrw_liststyle=3
let g:netrw_altv=1
let g:html_number_lines=1
set updatetime=300
set shortmess-=S " Show number of matches (alternative: vim-searchindex)

augroup CommentAndIndent
	autocmd!
	autocmd BufNewFile,BufRead * setl formatoptions-=o
	autocmd BufNewFile,BufRead * setl formatoptions+=rn
augroup END

augroup Netrw
	autocmd!
	autocmd FileType netrw setl bufhidden=delete
augroup END

if has('nvim')
	tnoremap <silent> <Esc> <C-\><C-n>
	set laststatus=3
	set undofile undodir=~/.config/nvim/undodir/
	set directory^=~/.config/nvim/swap/
	lua require('init')
else
	tnoremap <silent> <Esc><Esc> <C-W><S-N>
	set undofile undodir=~/.vim/undodir/
	set directory^=~/.vim/swap/
	set cursorlineopt=number " ,line
	set termwinsize=0*0
	runtime macros/matchit.vim " match HTML tags
endif
