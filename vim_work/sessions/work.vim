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
badd +61 src/hercules_interface/hercules_elmo/src/elmo.cpp
badd +1 ~/src/jobnotes/notes.md
badd +1 ~/cruise/HEAD^\{}-help:ros/src/hercules_interface/hercules_elmo/src/elmo.cpp
badd +19 src/hercules_interface/hercules_elmo/src/main.cpp
badd +82 src/hercules_interface/hercules_elmo/include/elmo.h
badd +120 ~/.vimrc
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
badd +133 ~/TI-hercules/Lizard/src/canopen.c
silent! argdel *
edit ~/cruise/arduino/cruise_imu_can/cruise_imu_can.ino
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
wincmd =
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 244 - ((95 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
244
normal! 0
wincmd w
argglobal
edit src/hercules_interface/hercules_elmo/src/elmo.cpp
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 16 - ((15 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
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
let s:l = 39 - ((38 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
39
normal! 014|
wincmd w
2wincmd w
wincmd =
tabedit ~/TI-hercules/Lizard/src/canopen.c
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winheight=1 winwidth=1
wincmd =
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 133 - ((64 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
133
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
let s:l = 122 - ((64 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
122
normal! 034|
wincmd w
2wincmd w
wincmd =
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
