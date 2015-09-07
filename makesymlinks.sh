#!/bin/bash

dir=~/dotfiles                    # dotfiles directory
files=" \
       Xresources \
       xinitrc \
       bashrc \
       bash_profile \
       bash_aliases \
       bash_functions \
       Xmodmap
       vimrc \
       vim \
       oh-my-zsh \
       zshrc \
       zlogin \
       zsh_aliases \
       colors \
       dircolors \
       compton.conf \
       gitconfig \
       i3"

##########

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    if [ -e ~/.$file ]; then
       rm ~/.$file
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

