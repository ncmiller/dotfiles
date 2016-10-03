let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/src
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/.vimrc
badd +19 ~/.bashrc
badd +46 ~/.bash_aliases
badd +1 ~/dotfiles/vim/ftplugin/python.vim
badd +1 cryptopals/xor_encode.py
badd +1 ~/.gitigno
badd +1 ~/.gitconfig
badd +1 \$myvimrc
badd +1 ~/.gitignore
badd +20 cryptopals/set1/set1.py
badd +41 cryptopals/set1/xor_decode.py
badd +50 cryptopals/util.py
badd +6 cryptopals/set2/set2.py
badd +1 \'__doc__\'
badd +1 /usr/lib64/python2.7/site-packages/Crypto/Cipher/AES.py
badd +12 nodeschool/stream-adventure/lines.js
badd +13 nodeschool/stream-adventure/transform.js
badd +1 nodeschool/stream-adventure/io.js
badd +1 nodeschool/stream-adventure/meetpipe.js
badd +1 nodeschool/stream-adventure/program.js
badd +4 nodeschool/how-to-markdown/gfm.md
badd +2 nodeschool/how-to-markdown/html.md
badd +3 nodeschool/how-to-markdown/code.md
badd +1 ~/dotfiles/vimrc_common
badd +22 ~/.vim/statusline.vim
badd +155 ~/.vim/vimrc_common.vim
badd +27 ~/.tmux.conf
argglobal
silent! argdel *
edit ~/.tmux.conf
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 157 + 158) / 316)
exe 'vert 2resize ' . ((&columns * 158 + 158) / 316)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 27 - ((26 * winheight(0) + 35) / 70)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
27
normal! 0
wincmd w
argglobal
edit ~/.tmux.conf
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 33 - ((32 * winheight(0) + 35) / 70)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
33
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 157 + 158) / 316)
exe 'vert 2resize ' . ((&columns * 158 + 158) / 316)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
let g:this_obsession_status = 2
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
