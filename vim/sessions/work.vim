let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd /programs/tr3/fpga/wip/nmille01/svn/fc_conv
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +97 src/tb/tb_udp_ipv6/tb_udp_ipv6.vhd
silent! argdel *
edit src/tb/tb_udp_ipv6/tb_udp_ipv6.vhd
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
let s:l = 98 - ((31 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
98
normal! 02|
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
