alias ls='ls -hF --color=auto'
alias da='date "+%A, %B %d, %Y [%T]"'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias df='df -h'
alias du='du -c -h'
alias ports='netstat --all --numeric --programs --inet --inet6'
alias pg='ps -Af | grep -v grep | grep $1'
alias slp='systemctl suspend'

# Git
alias gs='git status'

# Quick cd
alias cdt='cd /mnt/tower'

# Quick Edit
alias ev='vim ~/.vimrc'
alias eba='vim ~/.bash_aliases'
alias eb='vim ~/.bashrc'
alias ebp='vim ~/.bash_profile'

# Python
alias pep8r='find . -name "*.py" | xargs pep8'

# Pacman alias examples
alias pacupg="sudo pacman -Syu"     # Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacdl="pacman -Sw"            # Download specified package(s) as .tar.xz ball
alias pacin="sudo pacman -S"        # Install specific package(s) from the repositories
alias pacins="sudo pacman -U"       # Install specific package not from the repositories but from a file
alias pacre="sudo pacman -R"        # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem="sudo pacman -Rns"     # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep="pacman -Si"           # Display information about a given package in the repositories
alias pacreps="pacman -Ss"          # Search for package(s) in the repositories
alias pacloc="pacman -Qi"           # Display information about a given package in the local database
alias paclocs="pacman -Qs"          # Search for package(s) in the local database
alias paclo="pacman -Qdt"           # List all packages which are orphaned
alias pacc="sudo pacman -Scc"       # Clean cache - delete all the package files in the cache
alias paclf="pacman -Ql"            # List all files installed by a given package
alias pacown="pacman -Qo"           # Show package(s) owning the specified file(s)
alias pacexpl="pacman -D --asexp"   # Mark one or more installed packages as explicitly installed
alias pacimpl="pacman -D --asdep"   # Mark one or more installed packages as non explicitly installed
#
# # Additional pacman alias examples
alias pacupd="sudo pacman -Sy && sudo abs"         # Update and refresh the local package and ABS databases against repositories
alias pacinsd="sudo pacman -S --asdeps"            # Install given package(s) as dependencies
alias pacmir="sudo pacman -Syy"                    # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
