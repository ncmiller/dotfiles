setlocal makeprg=make
setlocal errorformat=**\ Error:\ %f(%l):\ %m
let g:tlist_vhdl_settings   = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;r:procedures'
"map <buffer> <F4> :execute ':!vsim -c -do "run -all;exit" '.expand("%:t:r")<CR>

" Abbreviations
iabbr sig signal
iabbr sl std_logic
iabbr slv std_logic_vector
