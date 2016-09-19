let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +25 todo.txt
badd +38 dotfiles/vimrc
badd +220 dotfiles/i3/config
badd +6 dotfiles/tmux.conf
badd +42 dotfiles/i3/i3status.conf
badd +6 dotfiles/bash_profile
badd +126 .ncmpcpp/config
badd +236 .config/mpd/mpd.conf
argglobal
silent! argdel *
edit dotfiles/i3/config
set splitbelow splitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal fen
40
normal! zo
145
normal! zo
217
normal! zo
let s:l = 219 - ((89 * winheight(0) + 38) / 76)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
219
normal! 054|
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
