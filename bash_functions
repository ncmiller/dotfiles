dirsize() {
    du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
    egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
    egrep '^ *[0-9.]*M' /tmp/list
    egrep '^ *[0-9.]*G' /tmp/list
    rm -rf /tmp/list &> /dev/null
}

# colored man pages
man() {
   env \
   LESS_TERMCAP_mb=$(printf "\e[1;31m") \
   LESS_TERMCAP_md=$(printf "\e[1;31m") \
   LESS_TERMCAP_me=$(printf "\e[0m") \
   LESS_TERMCAP_se=$(printf "\e[0m") \
   LESS_TERMCAP_so=$(printf "\e[1;46;37m") \
   LESS_TERMCAP_ue=$(printf "\e[0m") \
   LESS_TERMCAP_us=$(printf "\e[1;32m") \
   man "$@"
}
