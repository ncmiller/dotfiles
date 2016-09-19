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
badd +132 ~/.vimrc
badd +19 ~/.bashrc
badd +46 ~/.bash_aliases
badd +1 ~/dotfiles/vim/ftplugin/python.vim
badd +1 cryptopals/xor_encode.py
badd +1 ~/.gitigno
badd +1 ~/.gitconfig
badd +1 \$myvimrc
badd +1 ~/.gitignore
badd +28 cryptopals/set1/set1.py
badd +0 cryptopals/set1/xor_decode.py
badd +0 cryptopals/util.py
badd +23 cryptopals/set2/set2.py
argglobal
silent! argdel *
edit cryptopals/set1/xor_decode.py
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
3wincmd h
wincmd w
wincmd w
wincmd w
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 56 + 113) / 226)
exe 'vert 2resize ' . ((&columns * 56 + 113) / 226)
exe 'vert 3resize ' . ((&columns * 55 + 113) / 226)
exe 'vert 4resize ' . ((&columns * 56 + 113) / 226)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 13 - ((12 * winheight(0) + 27) / 55)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 013|
wincmd w
argglobal
edit cryptopals/set2/set2.py
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 20 - ((19 * winheight(0) + 27) / 55)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
20
normal! 022|
wincmd w
argglobal
edit cryptopals/util.py
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 71 - ((27 * winheight(0) + 27) / 55)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
71
normal! 0
wincmd w
argglobal
edit ~/.vimrc
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 165 - ((49 * winheight(0) + 27) / 55)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
165
normal! 0
wincmd w
4wincmd w
exe 'vert 1resize ' . ((&columns * 56 + 113) / 226)
exe 'vert 2resize ' . ((&columns * 56 + 113) / 226)
exe 'vert 3resize ' . ((&columns * 55 + 113) / 226)
exe 'vert 4resize ' . ((&columns * 56 + 113) / 226)
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
