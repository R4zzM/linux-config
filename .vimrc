" ####################
" Editor configuration
" ####################

" This section of the config handles configuration of the vim editor itself.

" Use highlightnig of text for different type of files (mostly code).
syntax on

" Show line numbers
set number

" Start searching as soon as text is typed after an '/'
set incsearch

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
set paste

" ############# 
" Key remapping
" #############

" This section is about remapping keys. 

" Add autoclose for brackets and quotes
inoremap ( ()<Esc>i
inoremap () ()<Esc>i  
inoremap [ []<Esc>i
inoremap [] []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

" { requires some special treatment using autoindent
inoremap { {<CR><CR><BS>}<Esc>ki<Tab>

" The forward breakout
inoremap <C-f> <Esc>/)\\|]\\|}\\|"\\|'<CR>a

" Forward block cycle
noremap <silent> <C-f>  /(\\|[\\|{\\|"\\|'<ESC>a<ESC>

" ####################
" Plugin Configuration
" ####################
execute pathogen#infect('~/Dropbox/config/vim/bundle/{}')

" Set the theme, different in gvim and vim
" if has("gui_running") 
colorscheme Dim2
" endif

" NERD Tree
map <C-n> :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1
