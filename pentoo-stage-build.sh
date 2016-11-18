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

dir[0]=/tmp/pentoo-amd64-default 
dir[1]=/tmp/pentoo-amd64-hardened
dir[2]=/tmp/pentoo-x86-default 
dir[3]=/tmp/pentoo-x86-hardened

#########################################################################################
pack_stage5
pack_shards
unsquashfs_rootfs
FINAL_clean

################################################

pack_stage5() {

for (( i = 0 ; i < ${#dir[@]} ; i++ ))
do
        mkdir /home/pentoo/stage5/
        
        tar -cvjSf ${ $dir[$i]}.tar.bz2   /home/pentoo/stage5/
done

}



pack_shards () {
for (( i = 0 ; i < ${#dir[@]} ; i++ ))
do
        mkdir /home/pentoo/shards/
       tar -cvjSf ${ $dir[$i]}.tar.bz2 | split -d -b 450m - /home/pentoo/shards/
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

################################################## not perfect but might be better if cleaned up latter.
### Pack named tarballs however need to improve my loop handelers. 
#mk_pentoo_tarball() {
### EDIT Segments For As needed. 
arch="x86"   # x86 amd64 , 
# ARM7 arm8-64 could also be done in docker however bases would need AMD64 (host)  quemu ARM-Seed 
## Should I get a Server I may. 
stub="hardened"  # hardened default. some bash magic could be added hear too... 
year="2015.0"
release="RC4.0"
end="tar.bz2"  ### curently docker suports tar.gz .tar.bz2 .tar.xz
style="-xvjf"   ### -cvpzf (tar.gz) -cJf (tar.xz) -xvjf (tar.bz2)  tar cf - <source folder> | 7z a -si <Destination archive>.tar.7z
tar $style Pentoo_Linux_"$arch"_"$stub"_"$year"_"$release""$end" --exclude=/$style Pentoo_Linux_"$arch"_"$stub"_"$year"_"$release""$end" --one-file-system / 
#### 
