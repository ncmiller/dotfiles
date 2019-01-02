#!/bin/bash
# Purges old kernels to free up space on /boot
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d;/^linux-\(headers\|image\)/!d' | xargs apt-get -y purge
apt-get autoremove -y
df -h /boot
