" Pathogen plugin manager
call pathogen#infect()
call pathogen#helptags()

set nocompatible               " Get rid of Vi compatibility mode
set backspace=indent,eol,start " Fix backspace behavior
filetype plugin indent on
set t_Co=256                   " 256-color terminal
set visualbell t_vb=           " disable beep/flash
syntax on                      " enable syntax highlighting
set ruler
set nowrap                     " Don't wrap lines
set autoindent                 " Auto-indent to current level
set smartindent
set expandtab
set tabstop=3
set shiftwidth=3
set showmatch                  " show matching parenthesis
set incsearch                  " update search results while typing
set nohlsearch
set ignorecase
set number                     " enable line numbering
set backupdir=~/tmp
colo desert
let mapleader = ","

" Popup menu colors
highlight Pmenu ctermfg=White ctermbg=238 cterm=bold
highlight PmenuSel ctermfg=White ctermbg=Blue cterm=bold

" Taglist config
nnoremap <Leader>tl :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1

" NERDTree Config
nnoremap <Leader>nt :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

"General mappings
nmap <Leader>w :w<CR> " Quick Save

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
