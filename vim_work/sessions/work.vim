let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +117 ~/TI-hercules/Gecko/src/cruise_imu.c
badd +9 ~/src/jobnotes/notes.md
badd +265 ~/cruise/ros/src/roscpp/src/libros/statistics.cpp
badd +1 ~/TI-hercules/shared_libs/utils/source/lwip_main.c
badd +12 ~/src/jobnotes/cpuload.md
badd +74 ~/cruise/ros/src/system/scripts/processes.py
badd +60 ~/cruise/ros/src/message_stats/src/message_stats/message_stats_node.py
badd +146 ~/cruise/ros/src/rospy/src/rospy/impl/statistics.py
badd +1 ~/cruise/ros/src/roscpp/include/ros/statistics.h
badd +12 ~/cruise/ros/src/message_stats/launch/main.launch
badd +514 ~/cruise/ros/src/object_tracker/src/object_tracker.cpp
badd +105 ~/cruise/ros/src/watchdog/src/watchdog.cpp
badd +276 ~/cruise/ros/src/watchdog/src/watchdog_node.cpp
badd +19 ~/cruise/ros/scripts/start_fake_ride.sh
badd +79 ~/cruise/ros/src/launcher_db/launch/cruise.launch
argglobal
silent! argdel *
set stal=2
edit ~/TI-hercules/shared_libs/utils/source/lwip_main.c
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 106 + 213) / 426)
exe 'vert 2resize ' . ((&columns * 105 + 213) / 426)
exe 'vert 3resize ' . ((&columns * 213 + 213) / 426)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 1 - ((0 * winheight(0) + 57) / 115)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
lcd ~/TI-hercules
wincmd w
argglobal
edit ~/TI-hercules/Gecko/src/cruise_imu.c
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 1 - ((0 * winheight(0) + 57) / 115)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 09|
lcd ~/ti/ccsv6/tools/compiler/ti-cgt-arm_15.12.1.LTS/include
wincmd w
argglobal
edit ~/src/jobnotes/notes.md
setlocal fdm=expr
setlocal fde=Foldexpr_markdown(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 24 - ((21 * winheight(0) + 57) / 115)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 0
lcd ~/src/jobnotes
wincmd w
exe 'vert 1resize ' . ((&columns * 106 + 213) / 426)
exe 'vert 2resize ' . ((&columns * 105 + 213) / 426)
exe 'vert 3resize ' . ((&columns * 213 + 213) / 426)
tabedit ~/cruise/ros/src/message_stats/src/message_stats/message_stats_node.py
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 142 + 213) / 426)
exe 'vert 2resize ' . ((&columns * 141 + 213) / 426)
exe 'vert 3resize ' . ((&columns * 141 + 213) / 426)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 60 - ((57 * winheight(0) + 57) / 115)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
60
normal! 0
lcd ~/cruise
wincmd w
argglobal
edit ~/src/jobnotes/cpuload.md
setlocal fdm=expr
setlocal fde=Foldexpr_markdown(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 3 - ((2 * winheight(0) + 57) / 115)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 09|
lcd ~/cruise
wincmd w
argglobal
edit ~/src/jobnotes/notes.md
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 6 - ((5 * winheight(0) + 57) / 115)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
6
normal! 0
lcd ~/cruise
wincmd w
exe 'vert 1resize ' . ((&columns * 142 + 213) / 426)
exe 'vert 2resize ' . ((&columns * 141 + 213) / 426)
exe 'vert 3resize ' . ((&columns * 141 + 213) / 426)
tabnext 2
set stal=1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOc
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
