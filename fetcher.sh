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

dir[0]=/tmp/pentoo-full-beta-amd64-hardened-latest
dir[1]=/tmp/pentoo-full-beta-x86-hardened-latest
# https://pentoo.osuosl.org/latest-iso-symlinks/Daily/pentoo-full-beta-x86-hardened-latest.iso

#########################################################################################

for (( i = 0 ; i < ${#dir[@]} ; i++ ))
do
        mkdir ${ $dir[$i]}
done
mirror=https://pentoo.osuosl.org/latest-iso-symlinks/Daily/
# https://pentoo.osuosl.org/latest-iso-symlinks/Daily/pentoo-beta-amd64-hardened-latest.iso
  
file[0]=pentoo-full-beta-amd64-hardened-latest.iso 
file[1]=pentoo-full-beta-x86-hardened-latest.iso


for (( i = 0 ; i < ${#file[@]} ; i++ ))
do
        wget $mirror/${file[$i]} -O ${ $dir[$i]}
done

unset file
unset mirror
unset dir 
exit
