let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/cruise/ros
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +391 src/hercules_interface/hercules_elmo/src/elmo.cpp
badd +20 ~/src/jobnotes/notes.md
badd +1 ~/cruise/HEAD^\{}-help:ros/src/hercules_interface/hercules_elmo/src/elmo.cpp
badd +21 src/hercules_interface/hercules_elmo/src/main.cpp
badd +123 src/hercules_interface/hercules_elmo/include/elmo.h
badd +31 ~/.vimrc
badd +20 src/hercules_interface/lib_hercules_udp/include/hercules.h
badd +3 ~/dotfiles/vim/ftplugin/markdown.vim
badd +10 src/automatic_camera_lidar_calibration/src/automatic_camera_lidar_calibration.cpp
badd +313 ~/TI-hercules/Lizard/src/elmo_can.c
badd +1 ~/TI-hercules/.git/refs/heads/feature/can_elmo
badd +2071 src/roscpp/include/ros/node_handle.h
badd +98 ~/.bashrc
badd +7 ~/src/cryptopals/set1.py
badd +45 ~/cruise/arduino/libraries/ros_lib/ros.h
badd +4 src/velodyne_segmentation/src/segmentation_node.cpp
badd +77 src/roscpp/src/libros/node_handle.cpp
badd +19 src/hercules_interface/CMakeLists.txt
badd +1 src/hercules_interface/launch/hercules.launch
badd +92 ~/TI-hercules/Gecko/src/gps.c
badd +199 ~/cruise/arduino/cruise_imu_can/GPS.ino
badd +123 ~/cruise/arduino/cruise_imu_can/Output.ino
badd +244 ~/cruise/arduino/cruise_imu_can/cruise_imu_can.ino
badd +59 ~/TI-hercules/Gecko/src/cruise_imu.c
badd +18 ~/TI-hercules/Gecko/inc/cruise_imu.h
badd +110 ~/TI-hercules/Lizard/src/canopen.c
badd +238 ~/TI-hercules/Gecko/HALCoGen-Gecko/source/HL_sys_main.c
badd +2 src/hercules_interface/msg/elmo_read_req.msg
badd +7 ~/cruise/arduino/libraries/ros_lib/std_msgs/Bool.h
badd +38 ~/cruise/arduino/libraries/ros_lib/ros/subscriber.h
badd +9 ~/cruise/arduino/libraries/ros_lib/rosserial_msgs/Log.h
badd +18 ~/cruise/arduino/libraries/ros_lib/std_msgs/Header.h
badd +50 ~/cruise/arduino/libraries/ros_lib/ros/time.h
badd +1 src/hercules_interface/hercules_elmo/scripts/elmo_read.sh
badd +4 src/hercules_interface/hercules_elmo/scripts/set_target.sh
badd +152 src/hercules_interface/hercules_elmo/include/elmo_structs.h
badd +37 ~/TI-hercules/shared_libs/utils/source/better_can.c
badd +1429 ~/TI-hercules/Gecko/HALCoGen-Gecko/source/HL_can.c
badd +1 ~/TI-hercules/Lizard/HALCoGen-Lizard/source/HL_emac.c
badd +1223 ~/TI-hercules/Lizard/HALCoGen-Lizard/source/HL_can.c
silent! argdel *
edit src/hercules_interface/hercules_elmo/src/elmo.cpp
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
exe 'vert 1resize ' . ((&columns * 166 + 250) / 500)
exe 'vert 2resize ' . ((&columns * 166 + 250) / 500)
exe 'vert 3resize ' . ((&columns * 166 + 250) / 500)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 394 - ((72 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
394
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
let s:l = 34 - ((33 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
34
normal! 0
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
let s:l = 13 - ((12 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 011|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 166 + 250) / 500)
exe 'vert 2resize ' . ((&columns * 166 + 250) / 500)
exe 'vert 3resize ' . ((&columns * 166 + 250) / 500)
tabedit ~/TI-hercules/Lizard/src/canopen.c
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
exe 'vert 1resize ' . ((&columns * 166 + 250) / 500)
exe 'vert 2resize ' . ((&columns * 166 + 250) / 500)
exe 'vert 3resize ' . ((&columns * 166 + 250) / 500)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 116 - ((69 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
116
normal! 0
wincmd w
argglobal
edit ~/TI-hercules/Lizard/src/elmo_can.c
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 346 - ((77 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
346
normal! 019|
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
let s:l = 21 - ((20 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
21
normal! 05|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 166 + 250) / 500)
exe 'vert 2resize ' . ((&columns * 166 + 250) / 500)
exe 'vert 3resize ' . ((&columns * 166 + 250) / 500)
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
