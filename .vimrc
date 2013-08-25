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
  
" ############# 
" Key remapping
" #############

" <F12> does a :wq!
nmap <F12> :wq!<CR>

" The forward breakout
"inoremap <C-f> <Esc>/)\\|]\\|}\\|"\\|'<CR>a

" Forward block cycle
"noremap <silent> <C-f>  /(\\|[\\|{\\|"\\|'<ESC>a<ESC>

" ###############
" Leader commands
" ###############

" Requires Align plugin
map <Leader>a :Align=<CR>

" Requires Surround plugin
map <Leader>s ysiw

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
" let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1
