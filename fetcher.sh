#!/bin/bash
####################
#
# file: fetcher.sh
#
# Download the Pentoo  Linux ISO CD's
#
# author: Necrose99
#
####################

mirror=http://mirror.switch.ch/ftp/mirror/pentoo/latest-iso-symlinks/
  
file[0]=pentoo-amd64-default.iso 
file[1]=pentoo-amd64-hardened.iso
file[2]=pentoo-x86-default.iso 
file[3]=pentoo-x86-hardened.iso

for (( i = 0 ; i < ${#file[@]} ; i++ ))
do
        wget $mirror/${file[$i]}
done

unset file
unset mirror
exit
