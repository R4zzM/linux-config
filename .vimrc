" NEEDS TO BE FIXED SECOTION
" - np doesn't work if parenthesis is empty (This one is hard)
" - Remember position after intenting (maybe ok?)
" - BUG: Quotations and empahzise doesn't work as they should when in a sentence
" - :grep is a really nice cmd. Add the stuff from learnvimthehardway here.
" - Understand why after/ftplugin/vim.vim doesn't bite.

" Shouldn't it be possible to add this one to a vim.vim ftplugin file?
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" Editor configuration {{{

" Should be set when this file is found. More of a statement...
set nocompatible

" Use highlightnig of text for different type of files (mostly code).
syntax on

" Read custom filetype konfiguration from ~/.vim/ftplugin/
filetype plugin on

" Set font
" set guifont=Inconsolata\ 11

" Show line numbers
set number
 
" Start searching as soon as text is typed after an '/'
set incsearch

" Highlight all search matches
set hlsearch

" Automatically indent files that should be indented
set autoindent
set smartindent

" Use spaces instead of tabs
" To insert tabs (needed e.g in makefiles) I first press <CTRL-v> followed by <TAB> 
set expandtab
set shiftwidth=2
set softtabstop=2

" Left, right and backspace keys wraps the cursor
set whichwrap+=<,>,h,l 

" Backspace erases
set backspace=2 

" Ignore interpretation of remapped keys when pasting into buffer
set mouse=a

" Share clipboard with X
set clipboard=unnamedplus

" Show command in status line
set showcmd

" Ignore in filesearch and completion
set wildignore+=*.swp,*.class,*.jar,*.tar,*.jpg

" Always show the statusline
set laststatus=2

" Modify the statusline
set statusline=%F
set statusline+=\ -\ 
set statusline+=%y
set statusline+=\ -\ 
set statusline+=%l/%L
set statusline+=\ -\ 
set statusline+=%{fugitive#statusline()}

" No autocommenting, atleast for the time being
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" }}}

" Key remappnings {{{

" Another way to quit
nnoremap <F12> :wq!<CR>

" Make scrolling be more smooth. 20 Lines at a time "
noremap <c-u> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
noremap <c-d> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E> 

" Go to beginning and end of current line
nnoremap H ^
vnoremap H ^
onoremap H ^
nnoremap L $
vnoremap L $
onoremap L $

" Swedish Programmer experiment
inoremap aa å
inoremap AA Å
inoremap Aa Å
inoremap ae ä
inoremap AE Ä
inoremap Ae Ä
inoremap oe ö
inoremap OE Ö
inoremap Oe Ö

" Fundamental ESC remapping!
inoremap jk <esc>

" [U]PPERCASE word 
inoremap <c-u> <right><esc>viwUi


" Double quotationmarks => Put cursor inbetween (v = qvote ;)
inoremap <c-v> ""<esc>i
inoremap '' ''<esc>i

" Double semi-colons closes the line
inoremap ;; <esc>A;

" Double comma adds comma outside of textmass.
inoremap ,, <esc>Ea, 

" Control-space spaces out of textmass to the right
inoremap <c-space> <esc>Ea

" Control-return spaces out of textmass to the left
inoremap <c-return> <esc>Bi

" Control-return spaces out of textmass to the left
inoremap <c-f> <right>

" Control-return spaces out of textmass to the left
inoremap <c-j> <left>

" Put equal sign in an easier to reach position "
inoremap <c-e> =

" Doubletapping *any* parenthesis button generates pair and puts cursor inside
inoremap (( ()<esc>i
inoremap )) ()<esc>i
inoremap {{ {}<esc>i
inoremap }} {}<esc>i
inoremap [[ []<esc>i
inoremap ]] []<esc>i

" Change inside the next parenthesis 
onoremap p i(
onoremap np :<c-u>normal! f(vi(<CR>

" Clear function body
" onoremap b /return<CR>

" }}}

" Leader commands {{{
  
" Use space as <Leader>
" unmap <space>
let mapleader="\<space>"

" [s]av[e] command
noremap <Leader>se :w<CR>

" [qu]it with force command 
nnoremap <Leader>qu :q!<CR>

" [t]ab[c]close and [b]uffer[d]elete
nnoremap <Leader>tc :tabclose!<CR>
nnoremap <Leader>bd :bd!<CR>

" Cycle windows
nnoremap <Leader>w <c-w>w

" Edit .vimrc
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>

" Edit .vim/after/ftplugin/[filetype].vim for the type of bufffer 
" currently edited
" let ft       = &ft
let abs_path = $HOME . "/.vim/after/ftplugin/" . &ft . ".vim"
let cmd  = "normal! :vsplit " . abs_path . "\<CR>"
nnoremap <Leader>ea :execute cmd<CR>

" Source the current file in the current buffer
nnoremap <Leader>sv :source %<CR>

nnoremap <Leader>sap :vsplit $HOME/.vimrc/after/ftplugin/
" nnoremap <Leader>sv :source $MYVIMRC<CR>

" Insert [t]ime[s]tamp
nnoremap <Leader>ts :r !date<CR><up>J

" Add *empasizes*
nnoremap <Leader>em ciw**<esc>P
vnoremap <Leader>em c**<esc>P

" Add "quotes"
nnoremap <Leader>qo ciw""<esc>P
vnoremap <Leader>qo c""<esc>P

" Line manipulation stuff
nnoremap <Leader>d ddO<esc>
nnoremap <Leader>o o<up><esc>
nnoremap <Leader>O O<down><esc>

" [r]e[i]ndent a file
nnoremap <Leader>ri mx:normal gg=G<CR>'xzz

" [k]ill current buffer
" nnoremap <Leader>k :bd!<CR> 

" [a]lign text (Depnds on Align plugin)
nnoremap <Leader>a :Align=<CR>
nnoremap <Leader>a :Align=<CR>
nnoremap <Leader>at :Align\|<CR>
vnoremap <Leader>at :Align\|<CR>

" Add surroundings (Depends on Surround plugin)
" map <Leader>s ysiw

" Init search with CtrlP plugin
nnoremap <Leader>p :CtrlPMixed<CR>

" Start a full build (Depends on Dispatch plugin)
nnoremap <Leader>m :Make<CR>

" Ugly Clearcase stuff for systems that has that installed...
nnoremap <Leader>cco :setlocal autoread<CR>:!ct co -nc %<CR>
nnoremap <Leader>cci :!ct ci -nc %<CR>
nnoremap <Leader>cu :!ct unco %<CR>
nnoremap <Leader>cls :!ct lsco -me -recurse -short<CR>
nnoremap <Leader>clsa :!ct lsco -me -all -short<CR>
nnoremap <Leader>ccia :!ct lsco -me -recurse -short \| xargs ct ci -nc<CR>

" Git stuff (Depends on fugitive plugin)
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gs :Gstatus<CR> 
nnoremap <Leader>gd :Gdiff<CR> 

" Manage sessions (Depends on SessionMan plugin)
nnoremap <Leader>sl :SessionList<CR>
nnoremap <Leader>ss :SessionSave<CR>

" }}}

" Abberivations {{{

" General
iabbrev @@ rasmus.m.mattsson@gmail.com
iabbrev zzm http://zzm.se 

" Vim
iabbrev iab iabbrev
iabbrev nno nnoremap
iabbrev ino inoremap
iabbrev ono onoremap
iabbrev vno vnoremap
iabbrev nor noremap

iabbrev psf public static final
iabbrev ps public static

" Words
iabbrev doesnt doesn't
iabbrev dont don't
iabbrev wasnt wasn't
iabbrev taht that
iabbrev Strign String
iabbrev Isntance Instance
iabbrev isntance instance
iabbrev getIsntance getInstance

" Abberivations to "parry" the swedish programmer layout
inoreabbrev dösnt doesn't
inoreabbrev gös goes
inoreabbrev årdvark aardvark
inoreabbrev jö joe 
inoreabbrev Jö Joe 
" iabbrev iff if() {<CR><CR>}<esc><up><up>f)i
" iabbrev forr for(;;;)<left><left><left><left><del>

" }}}

" Plugin configuration {{{

" Load all plugins
execute pathogen#infect('~/Dropbox/config/vim/bundle/{}')
" execute pathogen#helptags()

" Set the theme
colorscheme Dim2

" Configure syntastic
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs  = 1

" Configure CtrlP
let g:ctrlp_show_hidden  = 1
let g:ctrlp_match_window = 'max:25'

" }}}
