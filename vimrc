set nocompatible
filetype off

" Plugins  ----------------------------------------------------- {{{

" Vundle
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'bling/vim-bufferline'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/Ag.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-dispatch'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'brookhong/cscope.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'octol/vim-cpp-enhanced-highlight'
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
set tags=./tags;/

" Status Line
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" }}}
" Helper Functions {{{
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
" colorscheme desert
colorscheme jellybeans
" colorscheme badwolf
highlight ColorColumn ctermbg=233

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
noremap <leader>v <c-w>v
noremap <leader>h <c-w>s

" Buffer shortcuts
"nnoremap <c-b> :bprevious<cr>
"nnoremap <c-n> :bnext<cr>
"nnoremap <leader>bd :bd<cr>

" Easy window navigation
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

" Window management
noremap <leader>q :q<cr>
noremap <leader>w :w<cr>

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
nnoremap <leader>W :set wrap!<cr>

"Toggle paste mode
nnoremap <leader>p :set paste!<cr>

" Toggle line numbers and listchars
" nnoremap <leader>L :set relativenumber!<cr>:set number!<cr>:set list!<cr>
nnoremap <leader>L :set number!<cr>:set list!<cr>

" Clear search highlights
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Inverse colors for highlights
hi Visual term=reverse cterm=reverse guibg=Grey

" }}}
" Plugins Mappings {{{
" NERDtree
nnoremap <leader>n :NERDTreeToggle<cr>

"Taglist
"nnoremap <silent> <F8> :TlistToggle<cr>

" Alignment
nnoremap <leader>a :'a,.GTabularize /
vnoremap <leader>a :GTabularize /

nnoremap <c-b> :CtrlPBuffer<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)
" }}}
" Quick editing {{{
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>rv :source $MYVIMRC<cr>
nnoremap <leader>eb :vsp $HOME/.bashrc<cr>
nnoremap <leader>en :vsp $HOME/src/jobnotes/notes.md<cr>

" Fast save
"nmap <leader>w :w!<cr>

" Select entire buffer
"nnoremap vaa ggvGg_
" }}}
" Misc Mappings"{{{

" Common typos remap to what they should be
command! W w
command! Q q
command! Qa qa

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

" Airline theme
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" commentary
nnoremap <leader>c :Commentary<cr>
vnoremap <leader>c :Commentary<cr>

" Cscope
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" Clang format
map <C-f> :pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<cr>
imap <C-f> <c-o>:pyf /usr/share/vim/addons/syntax/clang-format-3.6.py<cr>

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
au BufNewFile,BufFilePre,BufRead *.ino set filetype=c

" }}}

