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
badd +20 ~/src/jobnotes/notes.md
badd +148 ~/TI-hercules/shared_libs/utils/source/lwip_main.c
badd +50 vim_work/vim_functions.vim
badd +69 ~/TI-hercules/shared_libs/utils/include/logger.h
badd +1 ~/TI-hercules/shared_libs/utils/include/board_config_common.h
badd +150 ~/TI-hercules/shared_libs/utils/source/logger.c
badd +32 ~/TI-hercules/shared_libs/utils/source/udp_logger.c
badd +10 ~/TI-hercules/shared_libs/utils/include/udp_logger.h
badd +49 ~/TI-hercules/Komodo/src/sd.c
badd +43 ~/TI-hercules/shared_libs/utils/source/console_utils.c
badd +12 ~/TI-hercules/shared_libs/utils/include/console_utils.h
badd +38 ~/TI-hercules/shared_libs/utils/source/board_utils.c
badd +5 ~/TI-hercules/shared_libs/utils/include/board_utils.h
badd +2 ~/TI-hercules/shared_libs/utils/source/better_can.c
badd +61 ~/TI-hercules/comm_structs/error_codes.h
badd +65 ~/TI-hercules/shared_libs/utils/include/board_env.h
badd +28 ~/TI-hercules/shared_libs/utils/include/compiler_utils.h
badd +73 ~/TI-hercules/Bootloader/src/bl_main.c
badd +142 ~/TI-hercules/shared_libs/utils/include/lwipopts.h
badd +1 ~/TI-hercules/Komodo/src/can_logger.c
badd +36 ~/TI-hercules/Komodo/inc/can_logger.h
badd +15 ~/TI-hercules/shared_libs/utils/include/time_utils.h
badd +73 ~/TI-hercules/shared_libs/utils/source/rti_utils.c
badd +196 ~/TI-hercules/Komodo/HALCoGen-Komodo/source/HL_sys_main.c
badd +1 ~/TI-hercules/Komodo/Build-Komodo/.cproject
badd +55 ~/TI-hercules/Komodo/Build-Komodo/.project
badd +149 ~/TI-hercules/Gecko/HALCoGen-Gecko/source/HL_sys_vim.c
badd +29 ~/TI-hercules/Lizard/inc/board_config.h
badd +19 ~/TI-hercules/Komodo/inc/board_config.h
badd +154 ~/TI-hercules/Komodo/HALCoGen-Komodo/source/HL_sys_link.cmd
badd +58 ~/cruise/ros/src/hercules_interface/hercules_board/src/board.cpp
badd +164 ~/TI-hercules/Gecko/src/cruise_ntp.c
badd +21 ~/TI-hercules/shared_libs/utils/source/cruise_udp.c
badd +85 ~/TI-hercules/shared_libs/utils/source/fw_update_udp.c
badd +490 ~/TI-hercules/shared_libs/lwip-1.4.1/src/core/udp.c
badd +132 vimrc_work
badd +1 ~/.clang-format
badd +45 ~/TI-hercules/shared_libs/lwip-1.4.1/src/include/lwip/err.h
badd +382 ~/TI-hercules/shared_libs/lwip-1.4.1/src/core/pbuf.c
badd +147 ~/TI-hercules/shared_libs/lwip-1.4.1/src/include/lwip/pbuf.h
badd +20 ~/TI-hercules/Gecko/inc/board_config.h
badd +60 ~/TI-hercules/shared_libs/utils/source/board_reports.c
badd +4 ~/TI-hercules/shared_libs/utils/include/board_reports.h
badd +191 ~/TI-hercules/Lizard/HALCoGen-Lizard/source/HL_sys_main.c
badd +194 ~/TI-hercules/Gecko/HALCoGen-Gecko/source/HL_sys_main.c
badd +1 ~/TI-hercules/Komodo/HALCoGen-Komodo/source/HL_notification.c
badd +535 ~/cruise/ros/src/hercules_interface/hercules_elmo/src/elmo.cpp
badd +79 ~/TI-hercules/shared_libs/lwip-1.4.1/src/core/mem.c
badd +103 ~/TI-hercules/shared_libs/lwip-1.4.1/src/include/lwip/sys.h
badd +46 ~/TI-hercules/shared_libs/lwip-1.4.1/src/include/lwip/debug.h
badd +435 ~/TI-hercules/shared_libs/lwip-1.4.1/src/core/memp.c
badd +52 ~/TI-hercules/shared_libs/utils/source/bosch_raw_radar.c
badd +19 ~/TI-hercules/comm_structs/bosch_radar_structs.h
badd +3 ~/TI-hercules/shared_libs/lwip-1.4.1/test/unit/lwipopts.h
badd +1841 ~/TI-hercules/shared_libs/lwip-1.4.1/src/include/lwip/opt.h
badd +267 ~/TI-hercules/BeardedDragon/HALCoGen-BeardedDragon/include/HL_emac.h
badd +56 ~/TI-hercules/shared_libs/utils/source/time_utils.c
badd +252 ~/TI-hercules/shared_libs/lwip-1.4.1/src/core/ipv4/inet_chksum.c
badd +119 ~/TI-hercules/BeardedDragon/HALCoGen-BeardedDragon/include/HL_sys_common.h
badd +7 ~/TI-hercules/BeardedDragon/HALCoGen-BeardedDragon/source/HL_gio.c
badd +3550 ~/TI-hercules/shared_libs/fatfs/ff.c
badd +19 ~/TI-hercules/shared_libs/fatfs/integer.h
badd +271 ~/cruise/ros/src/hercules_interface/hercules_imu/src/imu.cpp
badd +159 ~/cruise/ros/src/hercules_interface/hercules_imu/include/gps_imu_structs.h
badd +157 ~/TI-hercules/comm_structs/gps_imu_structs.h
badd +72 ~/cruise/arduino/cruise_imu_can/Output.ino
badd +59 ~/cruise/arduino/cruise_imu_can/Sensors.ino
badd +77 ~/cruise/arduino/cruise_imu_can/cruise_imu_can.ino
badd +113 ~/TI-hercules/Gecko/src/cruise_imu.c
badd +14 ~/TI-hercules/Gecko/inc/cruise_imu.h
badd +94 ~/ti/ccsv6/tools/compiler/ti-cgt-arm_15.12.1.LTS/include/time.h
badd +0 ~/cruise/arduino/cruise_imu/Output.ino
badd +42 ~/TI-hercules/Gecko/inc/gps.h
badd +217 ~/cruise/ros/src/lane_localizer/include/lane_localizer/lane_localizer.h
badd +50 ~/cruise/ros/src/rosserial/rosserial_client/src/ros_lib/ros/time.h
badd +40 ~/cruise/ros/src/rosserial/rosserial_client/src/ros_lib/time.cpp
badd +333 ~/TI-hercules/Gecko/src/gps.c
argglobal
silent! argdel *
set stal=2
edit ~/TI-hercules/comm_structs/gps_imu_structs.h
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
let s:l = 192 - ((119 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
192
normal! 014|
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
let s:l = 115 - ((63 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
115
normal! 0
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
let s:l = 24 - ((23 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 05|
lcd ~/TI-hercules
wincmd w
exe 'vert 1resize ' . ((&columns * 166 + 250) / 500)
exe 'vert 2resize ' . ((&columns * 166 + 250) / 500)
exe 'vert 3resize ' . ((&columns * 166 + 250) / 500)
tabedit ~/cruise/arduino/cruise_imu_can/Output.ino
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
exe 'vert 1resize ' . ((&columns * 124 + 250) / 500)
exe 'vert 2resize ' . ((&columns * 124 + 250) / 500)
exe 'vert 3resize ' . ((&columns * 124 + 250) / 500)
exe 'vert 4resize ' . ((&columns * 125 + 250) / 500)
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 72 - ((62 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
72
normal! 029|
lcd ~/cruise
wincmd w
argglobal
edit ~/cruise/ros/src/hercules_interface/hercules_imu/src/imu.cpp
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=3
setlocal nofen
let s:l = 286 - ((76 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
286
normal! 05|
lcd ~/cruise
wincmd w
argglobal
edit ~/cruise/arduino/cruise_imu/Output.ino
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
normal! 0
lcd ~/cruise
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
let s:l = 17 - ((16 * winheight(0) + 62) / 124)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 017|
lcd ~/cruise
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 124 + 250) / 500)
exe 'vert 2resize ' . ((&columns * 124 + 250) / 500)
exe 'vert 3resize ' . ((&columns * 124 + 250) / 500)
exe 'vert 4resize ' . ((&columns * 125 + 250) / 500)
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
