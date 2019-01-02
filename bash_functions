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

black='\E[30m'
red='\E[31m'
green='\E[32m'
yellow='\E[33m'
blue='\E[34m'
magenta='\E[35m'
cyan='\E[36m'
white='\E[37m'
normal=$(tput sgr0)
bold=$(tput bold)

openprs() {
    hub pr list -f "%sC%>(8)%i%Creset %t% l%n %au" | grep $1
}

banner() {
    local default_msg="No message passed"
    message=${1:-$default_msg}
    color=${2:-$white}

    echo -e "$bold$color"
    echo "*******************************"
    echo ""
    echo ""
    echo $message
    echo ""
    echo ""
    echo "*******************************"
    echo -e "$normal"
}

full_test() {
    python ~/cruise/ros/scripts/trigger_circleci.py --branch $1 --test-types="full,smoke"
}
