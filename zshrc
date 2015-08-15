export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="simple"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

export PATH="/home/nick/.scripts:/home/nick/.scripts:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

export VISUAL='vim'

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_aliases

alias slp='systemctl suspend'

# ZSH Options
setopt autolist       # Display completion candidates immediately.
setopt cdablevars     # When an argument should be a dir but is not one,
                      # expand it as if it started with ~ (see below).
setopt autonamedirs   # Any parameter that is set to an abosolute directory
                      # name automatically becomes a name for that directory
                      # in the form ~param.
setopt histignoredups # Do not record a command in the history if it is a
                      # duplicate of the previous one.
setopt listtypes      # When listing files that are possible completions,
                      # indicate their types with a trailing character.
setopt nolistbeep     # No bell on ambiguous completion!!

