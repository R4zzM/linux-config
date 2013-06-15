" #################
" Vim configuration
" #################
syntax on

set number
set incsearch
set autoindent
set smartindent

" Use spaces instead of tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" Left, right and backspace wraps
set whichwrap+=<,>,h,l 

" Backspace is backspace
set backspace=2 

" Change common programming chars
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

" { requires some special treatment using autoindent
inoremap { {<CR><CR><BS>}<Esc>ki<Tab>

" ####################
" Plugin Configuration
" ####################
execute pathogen#infect('~/Dropbox/config/vim/bundle/{}')

" NERD Tree
map <C-n> :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1

