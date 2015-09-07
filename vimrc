" Preamble ----------------------------------------------------- {{{
set nocompatible
filetype off

" Vundle
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nanotech/jellybeans.vim'
call vundle#end()

filetype indent plugin on

" }}}

" Basic Options ------------------------------------------------ {{{
set encoding=utf-8
set modelines=0
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set relativenumber
set number
set laststatus=2
set history=1000
set undofile
set undoreload=1000
set cpoptions+=J
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↲
set splitbelow
set splitright
set lazyredraw
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
" Make vim able to edit crontab
set backupskip=/tmp/*,/private/tmp/*
" Save when losing focus
au FocusLost * :wa

" Resize splits when window resized
au VimResized * exe "normal! \<c-w>="

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END
" }}}

" Wildmenu completion {{{
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
" }}}

" Line Return {{{

" Make sure Vim returns to the same line when you reopen file
augroup line_return
   au!
   au BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \    execute 'normal! g`"zvzz' |
       \ endif
augroup END
" }}}

" Tabs, spaces, wrapping {{{
set shiftwidth=3
set softtabstop=3
set expandtab
set nowrap
"set textwidth=80
set formatoptions=qrn1j
"set colorcolumn=+1
" }}}

" Backups {{{
set backup
set noswapfile

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
" }}}

" Leader {{{
let mapleader=","
let maplocalleader="\\"
" }}}

" Colorscheme {{{
syntax on
set background=dark
"let g:Powerline_symbols = 'fancy'

colorscheme jellybeans
" }}}

" ========================================
" == Mappings ============================
" ========================================
" Toggle line numbers
nnoremap <leader>l :setlocal number!<cr>:setlocal relativenumber!<cr>
" Toggle wrap
nnoremap <leader>W :set wrap!<cr>
" Select entire buffer
nnoremap vaa ggvGg_
" Easy beginning/end of line
noremap H ^
noremap L g_
" Easy vsplit
noremap <leader>v <c-w>v
noremap <leader>h <c-w>s
" NERDtree
nnoremap <leader>n :NERDTreeToggle<cr>

" Disable annoying keys
nnoremap Q <nop>
nnoremap K <nop>

command! W w
command! Q q
command! Qa qa

" Intuitive movement over long lines
nnoremap k gk
nnoremap j gj

" Resize windows with arrow keys
nnoremap <up> <c-w>-
nnoremap <down> <c-w>+
nnoremap <left> 3<c-w>>
nnoremap <right> 3<c-w><

" Quick editing {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Quick switch between buffers
noremap <leader><leader> <c-^>

" Window management
noremap <leader>q :q<cr>

" Tabs management
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tn :tabnew<cr>

" Fast save
nmap <leader>w :w!<cr>

" Searching --------------------------------------------------------------- {{{
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
noremap <leader><space> :noh<cr>:call clearmatches()<cr>
map <tab> %

" Next match always in middle of window
nnoremap n nzzzv
nnoremap N Nzzzv

" Don't move on *j
nnoremap * *<c-o>
" }}}

" Navigation -------------------------------------------------------------- {{{
" Easy window navigation
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
" }}}

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

