set nocompatible
set hidden
set backspace=indent,eol,start					" allow backspacing over everything in insert mode
set directory=~/.tmp
set backupdir=~/.tmp
set backup
set history=50									" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set whichwrap+=<,>,h,l " Make backspace and cursor keys wrap accordingly"
set noexpandtab "real tabs
set tabstop=4
set shiftwidth=4
"set softtabstop=4 "makes the spaces feel like real tabs
set nu
set hlsearch
set incsearch
set ignorecase smartcase
"set wm=8 "wraps margin 4 spaces from border
"set wrap linebreak textwidth=0
set nowrap
set guifont=Courier:h14
set ul=50
set wildmenu wildmode=full
set autowrite 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set tags=./tags

colors desert

filetype on
filetype indent on
filetype plugin on

syntax enable

" Don't use Ex mode, use Q for formatting
vnoremap Q gq
nnoremap Q gqap

let mapleader = "," " Set leader to comma
let g:xml_syntax_folding=1
let g:LargeFile=1000
let g:bufmru_switchkey = "<Space>"
let g:bufmru_confclose = 0
let g:bufmru_bnrs = []
let g:bufmru_read_nummarks = 0
let NERDTreeIgnore=['\CVS']

map <Leader>c :TComment<CR>
map <Leader>vf :RVfunctional
map <Leader>l :!ruby <C-r>% \| less<CR>
map <Leader>rm :Rmodel
map <Leader>rv :Rview
map <Leader>rc :Rcontroller
map <Leader>rvm :RVmodel
map <Leader>rsm :RSmodel
map <Leader>rvv :RVview
map <Leader>rsv :RSview
"map <Leader>n ,w,t
map <Leader>o ?def <CR>:nohl<CR>w"zy$:!ruby -I"test" <C-r>% -n <C-r>z<CR>
map <Leader>p :set paste<CR>i
map <Leader>r :e doc/README_FOR_APP<CR> " Edit the README_FOR_APP (makes :R commands work)
map <Leader>f :!ruby -I"test" %<CR>
map <Leader>u :Runittest
map <Leader>vu :RVunittest
map <Leader>su :RSunittest
map <Leader>w <C-w>w

" nerd tree shortcut
map <leader>n :NERDTree<CR>

map <F3> :let &hls=!&hls<CR>
map <F2> <Esc>:1,$!xmllint --format -<CR>
"-- always encode to UTF-8 %!xmllint --format --encode UTF-8 -

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else
  set autoindent		" always set autoindenting on
endif " has("autocmd")


"nnoremap <C-n> :bnext<CR>
"nnoremap <C-p> :bprevious<CR>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk 

" Make it way easier to switch windows (<leader>w)
nmap <leader>w <C-w><C-w>_

nnoremap <silent> <F7> :YRShow<CR> 

"bufkill notes:
"When you want to unload/delete/wipe a buffer, use:
"  :bun/:bd/:bw to close the window as well (vim command), or
"  :BUN/:BD/:BW to leave the window(s) intact (this script). 
"basically: use :BW mostly
"
" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

"set foldlevelstart=20
augroup myfiletypes
	autocmd!
	autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et	" autoindent with two spaces, always expand tabs
	autocmd BufRead *.as set filetype=actionscript
	"autocmd VimEnter *  NERDTree
	" Note, perl automatically sets foldmethod in the syntax file
	autocmd Syntax c,cpp,vim,xml,html,xhtml,mxml setlocal foldmethod=syntax
	autocmd Syntax c,cpp,vim,xml,html,xhtml,mxml,perl normal zR

	"recognize groovy files by extension
	au BufNewFile,BufRead *.groovy  setf groovy 
	" Omni Completion
	" *************************************************************
	autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
	autocmd FileType python set omnifunc=pythoncomplete#Complete
	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
	autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
	autocmd FileType php set omnifunc=phpcomplete#CompletePHP
	autocmd FileType c set omnifunc=ccomplete#Complete
	autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete 
augroup END

silent! ruby nil

map <C-TAB> :bnext!<CR>
map <C-S-TAB> :bprev!<CR>
"this locked up mvim??? map <C-\> :b#<CR>


