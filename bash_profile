PATH="$HOME/.scripts:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="/usr/bin:$PATH"
PATH="/usr/bin/site_perl:$PATH"
PATH="/usr/bin/vendor_perl:$PATH"
PATH="/usr/bin/core_perl:$PATH"
export PATH

export EDITOR=vim
export BROWSER=firefox
export VISUAL='vim'

source ~/.bash_aliases

#eval `dircolors $HOME/.dircolors`

#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

#[ ! -s ~/.config/mpd/pid ] && mpd ~/.config/mpd/mpd.conf

case $- in *i*) . ~/.bashrc;; esac
