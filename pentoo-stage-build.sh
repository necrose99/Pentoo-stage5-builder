#!/bin/bash
####################
#
# file: pentoo-stage-build.sh
#
# Unpack Pentoo ISO's into /tmp/$dirs
#
# author: Necrose99
#       %%% %%%%%%%            |#|
#     %%%% %%%%%%%%%%%        |#|####
#  %%%%% %         %%%       |#|=#####
#  %%%%% %   @    @   %%      | | ==####
# %%%%%% % (_  ()  )  %%     | |    ===##
# %%  %%% %  \_    | %%      | |       =##
# %    %%%% %  u^uuu %%     | |         ==#
#       %%%% %%%%%%%%%      | |           V
### Brought to you by Necrose99 , Put a Scythe to your problem shall we...
# some items swiped from https://github.com/greglook/toolkit-packages/blob/master/gentoo/stage4-backup.sh or inspired by/of. 
#####################################################################################
source fetcher.sh
source unsqasher.sh

########################

dir[0]=/home/pentoo./tmp/pentoo-full-beta-amd64-hardened-latest
dir[1]=/home/pentoo./tmp/pentoo-full-beta-x86-hardened-latest

################################ spinner function , sure thiers a prettier way with cut /tmp = archive name but for now its more work
spiner() {
if
while true dir[0]=/tmp/pentoo-full-beta-amd64-hardened-latest

else
if
while dir[1]=/tmp/pentoo-full-beta-x86-hardened-latest
fi

}
# where to put the stage5
stage5Location=${STAGE5_LOCATION:-$HOME/stage5/$pv/}

# name prefix
stage5prefix="pentoo-stage5-"
stage5shards=${STAGE5_LOCATION:-$HOME/stage5/$pv/}
pentoo=${arch}${stub}
pv=${pentoo}

#########################################################################################
fetch_iso
unsqasher
setup_resolv
charoot
do-portage
unchroot
pack_stage5
unsquashfs_rootfs
FINAL_clean
build_docker
push_docker

########################## fix /etc/resolv.conf to work as Docker LXC, Chroot etc. 
setup_resolv() {
spiner
    cat >>${#dir[@]}/etc/resolv.conf <<EOF
nameserver 8.8.8.8 
nameserver 8.8.4.4 
nameserver 2001:4860:4860::8888 
nameserver 2001:4860:4860::8844
EOF
## should be persistive globally, google public dns else others will update# 
}
#################
charoot() {
spiner
# https://wiki.gentoo.org/wiki/User:Zeekec/schroot
for (( i = 0 ; i < ${#dir[@]} ; i++ ))
do

mount --rbind /dev ${#dir[@]}/dev
mount --make-rslave ${#dir[@]}/dev
mount -t proc /proc ${#dir[@]}/proc
mount --rbind /sys ${#dir[@]}/sys
mount --make-rslave ${#dir[@]}/sys
mount --rbind /tmp ${#dir[@]}/tmp
}

do-portage() {
spiner
#emerge --ask dev-util/schroot can run as a user level chronjob, emerge-webrsync in trees +pentoo should be ok. 
## run a few cmd's to fetch updates and not be in all day. 
for (( i = 0 ; i < ${#dir[@]} ; i++ ))
do schroot emerge-webrsync && emerge --sync pentoo && emerge app-eselect/eselect-repository
} 
unchroot() {
# https://wiki.gentoo.org/wiki/User:Zeekec/schroot
spiner
for (( i = 0 ; i < ${#dir[@]} ; i++ ))
do

umount --rbind /dev ${#dir[@]}/dev
umount --make-rslave ${#dir[@]}/dev
umount -t proc /proc ${#dir[@]}/proc
umount --rbind /sys ${#dir[@]}/sys
umount --make-rslave ${#dir[@]}/sys
umount --rbind /tmp ${#dir[@]}/tmp
}

if
while true dir[0]=/tmp/pentoo-full-beta-amd64-hardened-latest

else
if
while dir[1]=/tmp/pentoo-amd64-hardened

else
}



###################
pack_stage5() {

for (( i = 0 ; i < ${#dir[@]} ; i++ ))
do
        mkdir /home/pentoo/stage5/
        tar -cvpzf /home/pentoo/stage5/pentoo-full-beta-amd64-hardened-latest.tar.gz --exclude=/backup.tar.gz --one-file-system /home/pentoo./tmp/pentoo-full-beta-amd64-hardened-latest

        tar -cvpzf /home/pentoo/stage5/pentoo-x86-hardened-latest.tar.gz --exclude=/backup.tar.gz --one-file-system /home/pentoo./tmp/pentoo-amd64-default
done

}






################### FINAL Clean out clean out all the temp files in rootfs dirs. 
FINAL_clean() {

for (( i = 0 ; i < ${#dir[@]} ; i++ ))
do
      rm -r ${ $dir[$i]}/
      rmdir -r  ${ $dir[$i]}/*
done

}

########################### Finish

unset dir

fi 

