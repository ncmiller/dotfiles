# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='ls -hFX --color=auto --group-directories-first'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #

#
#GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n GRC ]
then
   alias colourify="grc -es --colour=auto"
   alias configure='colourify ./configure'
   alias diff='colourify diff'
   alias make='colourify make'
   alias gcc='colourify gcc'
   alias dcc='colourify dcc'
   alias g++='colourify g++'
   alias ld='colourify ld'
   alias netstat='colourify netstat'
   alias ping='colourify ping'
   alias traceroute='colourify /usr/sbin/traceroute'
fi

alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'

alias cd=cd_func
alias cddesk='cd /cygdrive/c/Documents\ and\ Settings/nmille01/Desktop'

# Trusted Switch
alias cdts='cd /cygdrive/y/TrustSwitch/Projects'
alias cdshare='cd S:/Programs/MAP_ENT/IR\&D_Maps/IR\&D_2011/Trusted\ Switch/Software\ Engineering/'

# ClearCase
alias cc='cleartool'
alias pv='cleartool pwv -s'
alias ccco='cleartool co -nc'
alias ccci='cleartool ci'

function vtree() {
   cleartool lsvtree -graphical $1 &
}

alias xw='XWin -multiwindow &> /dev/null &'
