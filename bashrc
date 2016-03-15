# better pattern matching
shopt -s extglob

PATH="/home/nick/.scripts:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="/usr/bin:$PATH"
PATH="/usr/bin/site_perl:$PATH"
PATH="/usr/bin/vendor_perl:$PATH"
PATH="/usr/bin/core_perl:$PATH"
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export PATH

export EDITOR=vim
export BROWSER=chromium
export VISUAL='vim'

PS1='\[\e[32m\]\u@\h:\[\e[34m\]\W\[\e[m\]\[\e[32m\]%\[\e[0m\] '

source $HOME/.bash_aliases
source $HOME/.bash_functions
eval `dircolors $HOME/.dircolors`
