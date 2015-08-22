# better pattern matching
shopt -s extglob

PS1='\[\e[32m\]\u@\h:\[\e[34m\]\W\[\e[m\]\[\e[32m\]%\[\e[0m\] '

source $HOME/.bash_aliases
source $HOME/.bash_functions
eval `dircolors $HOME/.dircolors`
