set nocompatible
filetype off


" Vundle
" ---------
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/Ag.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary.git'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'plasticboy/vim-markdown'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()

filetype on
filetype indent plugin on

" Basic Options
" --------------
set encoding=utf-8
set modelines=0
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set visualbell
"set cursorline
set ruler
set backspace=indent,eol,start
" set relativenumber
set number
set laststatus=2
set history=1000
set undofile
set undoreload=1000
set cpoptions+=J
set list
set listchars=tab:>\ ,extends:+,precedes:-
set splitbelow
set splitright
set matchtime=3
set notimeout
set ttimeout
set ttimeoutlen=10
set shiftround
set autowrite
set autoread
set title
set dictionary=/usr/share/dict/words
set synmaxcol=800
set backupskip=/tmp/*,/private/tmp/* " Make vim able to edit crontab
set clipboard=exclude:.* " Disable clipboard over X to improve startup time
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set foldmethod=marker
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set shiftwidth=4
set softtabstop=4
set expandtab
set nowrap
set textwidth=100
set formatoptions=qrn1
set colorcolumn=+1
set backup
set noswapfile
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set tags=./tags;/


" AutoCmd
" --------------

" Make sure Vim returns to the same line when you reopen file
augroup line_return
au!
au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \    execute 'normal! g`"zvzz' |
      \ endif
augroup END


" Colors
" -----------
syntax on
set background=dark
set t_Co=256
colorscheme jellybeans
" colorscheme desert
hi ColorColumn ctermbg=0
hi Visual term=reverse cterm=reverse guibg=Grey

" Mappings
" ----------
let mapleader=","
let maplocalleader="\\"
nnoremap Q <nop>
noremap <leader>v <c-w>v
noremap <leader>h <c-w>s
"nnoremap <c-b> :bprevious<cr>
"nnoremap <c-n> :bnext<cr>
nnoremap <leader>bd :bd<cr>
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
nnoremap <up> <c-w>+
nnoremap <down> <c-w>-
nnoremap <left> 3<c-w>>
nnoremap <right> 3<c-w><
nnoremap <leader>W :set wrap!<cr>
nnoremap <leader>p :set paste!<cr>
nnoremap <leader>L :set number!<cr>:set list!<cr>
noremap <leader><space> :noh<cr>:call clearmatches()<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>a :'a,.GTabularize /
vnoremap <leader>a :GTabularize /
nnoremap <c-b> :CtrlPBuffer<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>rv :source $MYVIMRC<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nnoremap k gk
nnoremap j gj
" Next match always in middle of window
nnoremap n nzzzv
nnoremap N Nzzzv
" Reopen last file in split
map <leader>t :vs<bar>:b#<CR>


" Plugins
" -----------
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:50'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" commentary
nnoremap <leader>c :Commentary<cr>
vnoremap <leader>c :Commentary<cr>

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.ino set filetype=c

" jedi
let g:jedi#usages_command = "<leader>u"
let g:jedi#rename_command = "<leader>R"
