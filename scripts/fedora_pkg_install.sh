#!/bin/bash

sudo dnf -y update
sudo dnf -y copr enable spot-chromium
sudo dnf -y install chromium
sudo dnf -y install vim-enhanced
sudo dnf -y install tmux
sudo dnf -y install git
sudo dnf -y install @cinnamon-desktop
sudo dnf -y install qemu
sudo dnf -y install keepassx
sudo dnf -y install owncloud-client
sudo dnf -y install ruby
sudo dnf -y install python
sudo dnf -y install python-pip
sudo dnf -y install htop
sudo dnf -y install fedpkg fedora-packager rpmdevtools ncurses-devel pesign
sudo dnf -y install screenfetch
sudo dnf -y install gcc gcc-c++
sudo dnf -y install openssl-devel
sudo dnf -y install inxi
