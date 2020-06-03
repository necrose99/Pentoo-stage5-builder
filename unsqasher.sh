#!/bin/bash
####################
#
# file: unsqasher.sh
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
#####################################################################################

dir[0]=/tmp/pentoo-full-beta-amd64-hardened-latest
dir[1]=/tmp/pentoo-full-beta-x86-hardened-latest

#########################################################################################
unpack_iso
file_mover
unsquashfs_rootfs
file_clean

################################################

unpack_iso() {

for (( i = 0 ; i < ${#dir[@]} ; i++ ))
do
        7z e -r ${ $dir[$i]}/*.iso
done

}

#### move files to /temporary FS ROOT.... 
mover () {
for (( i = 0 ; i < ${#dir[@]} ; i++ ))
do
        mv  ${ $dir[$i]}/modules/*.lzm ${ $dir[$i]}
done

}

unsquashfs_rootfs() {

for (( i = 0 ; i < ${#dir[@]} ; i++ ))
do
        unsquashfs -f -d ${ $dir[$i]}/*.squashfs
        unsquashfs -f -d ${ $dir[$i]}/*.lzm
done

}


################### clean out 
file_clean() {

for (( i = 0 ; i < ${#dir[@]} ; i++ ))
do

       rm -f ${ $dir[$i]}/*.iso syslinux.cfg README.txt livecd *.squashfs *.lzm
       rm -r ${ $dir[$i]}/isolinux
      rmdir  ${ $dir[$i]}/isolinux
       rmdir ${ $dir[$i]}/modules
done

}

########################### Finish

unset dir

fi 
