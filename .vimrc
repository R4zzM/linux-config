" ####################
" Editor configuration
" ####################

" This section of the config handles configuration of the vim editor itself.

" Use highlightnig of text for different type of files (mostly code).
syntax on

" Read custom filetype konfiguration from ~/.vim/ftplugin/
filetype plugin on

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
set wildignore+=*.swp,*.class,*.jar,*.tar

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

" ############# 
" Key remapping
" #############

" Another way to quit
nnoremap <F12> :wq!<CR>

" Go to beginning and end of current line
nnoremap H ^
vnoremap H ^
onoremap H ^
nnoremap L $
vnoremap L $
onoremap L $

" Swedish Programmer experiment
inoremap aa å
inoremap ae ä
inoremap oe ö

" Fundamental ESC remapping!
inoremap jk <esc>
inoremap <esc> <nop>

" Delete line 
inoremap <c-d> <esc>ddi

" Delete word
inoremap <c-w> <esc>diwi

" [U]PPERCASE word 
inoremap <c-u> <right><esc>viwUi

" *[e]mpasize* word
inoremap <c-e> <esc><right>bdiwi**<esc>P<right><right>i

" "qu[o]te" word.
inoremap <c-o> <esc><right>bdiwi""<esc>P<right><right>i

" Double quotaionmaks => Put cursor inbetween
inoremap "" ""<esc>i
inoremap '' ''<esc>i

" Double semi-colons closes the line and goes to the next one
inoremap ;; <esc>A;<CR>

" Double comma adds comma outside of quotationmarks.
inoremap ,, <esc>f"a, 

" Change inside the next parenthesis
onoremap p i(
onoremap np :<c-u>normal! f(vi(<CR>

" Clear function body
" onoremap b /return<CR>

" ###############
" Leader commands
" ###############

" Use space as <Leader>
" unmap <space>
let mapleader="\<space>"

" [s]av[e] command
noremap <Leader>se :w<CR>

" [qu]it with force command 
nnoremap <Leader>qu :q!<CR>

" Manage .vimrc
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Insert [t]ime[s]tamp
nnoremap <Leader>ts :r !date<CR><up>J

" Line manipulation stuff
nnoremap <Leader>d ddO<esc>
nnoremap <Leader>o o<up><esc>
nnoremap <Leader>O O<down><esc>

" re[i]ndent a file
nnoremap <Leader>i :normal gg=G<CR>

" [k]ill current buffer
nnoremap <Leader>k :bd!<CR> 

" [a]lign text (Depends on Align plugin)
nnoremap <Leader>a :Align=<CR>
nnoremap <Leader>at :Align\|<CR>

" Add surroundings (Depends on Surround plugin)
" map <Leader>s ysiw

" Init search with CtrlP plugin
nnoremap <Leader>p :CtrlPMixed<CR>

" Start a full build (Depends on Dispatch plugin)
nnoremap <Leader>m :Make<CR>

" Ugly Clearcase stuff for systems that has that installed...
nnoremap <Leader>ccco :setlocal autoread<CR>:!ct co -nc %<CR>
nnoremap <Leader>ccci :!ct ci -nc %<CR>
nnoremap <Leader>ccu :!ct unco %<CR>

" Git stuff (Depends on fugitive plugin)
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gs :Gstatus<CR> 
nnoremap <Leader>gd :Gdiff<CR> 

" ###############
" # Abberivations
" ###############

" General
iabbrev @@ rasmus.m.mattsson@gmail.com
iabbrev zzm http://zzm.se 

" Vim
iabbrev <l <Leader>
iabbrev nno nnoremap
iabbrev ino inoremap
iabbrev ono onoremap
iabbrev vno vnoremap
iabbrev nor noremap

" Java
iabbrev psf public static final
iabbrev ps public static
" iabbrev iff if() {<CR><CR>}<esc><up><up>f)i
" iabbrev forr for(;;;)<left><left><left><left><del>

" Training 

" ####################
" Plugin Configuration
" ####################

" Load all plugins
execute pathogen#infect('~/Dropbox/config/vim/bundle/{}')

" Set the theme
colorscheme Dim2

" NERD Tree
map <C-n> :NERDTreeToggle<CR>

" Configure syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1

" Configure CtrlP
let g:ctrlp_match_window = 'max:25'
