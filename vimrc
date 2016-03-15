set nocompatible

" Plugins  ----------------------------------------------------- {{{

" Vundle
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
"Plugin 'bling/vim-bufferline'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'rking/Ag.vim'
"Plugin 'nanotech/jellybeans.vim'
"Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-obsession'
Plugin 'junegunn/vim-easy-align'
call vundle#end()

filetype on
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
"set cursorline
set ruler
set backspace=indent,eol,start
" set relativenumber
set number
set laststatus=2
set history=1000
" set undofile
" set undoreload=1000
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
set shiftwidth=3
set softtabstop=3
set expandtab
set nowrap
set textwidth=80
set formatoptions=qrn1
"set colorcolumn=+1
set backup
set noswapfile
" set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
" }}}
" AutoCmd {{{

" Make sure Vim returns to the same line when you reopen file
augroup line_return
au!
au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \    execute 'normal! g`"zvzz' |
      \ endif
augroup END
" }}}
" Colors {{{
syntax on
set background=dark
set t_Co=256
colorscheme desert
" }}}
" Mappings {{{
let mapleader=","
let maplocalleader="\\"
" Navigation / Workflow {{{
" Easy beginning/end of line
"noremap H ^
"noremap L g_

" Disable annoying Ex-mode mapping
nnoremap Q <nop>

" Easy vsplit
"noremap <leader>v <c-w>v
"noremap <leader>h <c-w>s

" Buffer shortcuts
"nnoremap <c-b> :bprevious<cr>
"nnoremap <c-n> :bnext<cr>
"nnoremap <leader>bd :bd<cr>

" Easy window navigation
"noremap <c-h> <c-w>h
"noremap <c-j> <c-w>j
"noremap <c-k> <c-w>k
"noremap <c-l> <c-w>l

" Window management
"noremap <leader>q :q<cr>

" Tabs management
"noremap <c-w> :tabclose<cr>
"noremap <c-t> :tabnew<cr>

" Resize windows with arrow keys
nnoremap <up> <c-w>+
nnoremap <down> <c-w>-
nnoremap <left> 3<c-w>>
nnoremap <right> 3<c-w><
" }}}
" Toggle Mappings {{{
" Toggle line numbers
"nnoremap <leader>W :set wrap!<cr>

" Toggle line numbers and listchars
" nnoremap <leader>L :set relativenumber!<cr>:set number!<cr>:set list!<cr>
nnoremap <leader>L :set number!<cr>:set list!<cr>

" Clear search highlights
"noremap <leader><space> :noh<cr>:call clearmatches()<cr>
" }}}
" Plugins Mappings {{{
" NERDtree
"nnoremap <leader>n :NERDTreeToggle<cr>

"Taglist
"nnoremap <silent> <F8> :TlistToggle<cr>

" Alignment
nnoremap <leader>a :'a,.GTabularize /
vnoremap <leader>a :GTabularize /

nnoremap <c-b> :CtrlPBuffer<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" Quick editing {{{
"nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Fast save
"nmap <leader>w :w!<cr>

" Select entire buffer
"nnoremap vaa ggvGg_
" }}}
" Misc Mappings"{{{
" Disable annoying keys
"nnoremap Q <nop>
"nnoremap K <nop>

" Common typos remap to what they should be
"command! W w
"command! Q q
"command! Qa qa

" Intuitive movement over long lines
nnoremap k gk
nnoremap j gj

" Next match always in middle of window
nnoremap n nzzzv
nnoremap N Nzzzv
" }}}
" }}}
" Plugin settings {{{
"let Tlist_Show_One_File = 1
"let g:bufferline_echo = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:50'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" }}}

