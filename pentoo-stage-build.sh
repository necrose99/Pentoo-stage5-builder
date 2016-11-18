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

dir[0]=/tmp/pentoo-amd64-default 
dir[1]=/tmp/pentoo-amd64-hardened
dir[2]=/tmp/pentoo-x86-default 
dir[3]=/tmp/pentoo-x86-hardened

################################ spinner function , sure thiers a prettier way with cut /tmp = archive name but for now its more work
spiner() {
if
while true dir[0]=/tmp/pentoo-amd64-default
set arch=-amd64
set stub=-default
else
if
while dir[1]=/tmp/pentoo-amd64-hardened
set arch=-amd64
set stub=-hardened
else
if
while dir[2]=/tmp/pentoo-x86-default
set arch=-x86
set stub=-hardened
else
if
while dir[3]=/tmp/pentoo-x86-default
set arch=-x86
set stub=-default
else

}
# where to put the stage5
stage5Location=${STAGE5_LOCATION:-$HOME/stage5/$pv/}

# name prefix
stage5prefix=`pentoo`-stage5-`date +\%Y.\%m.\%d`
#shards 
stage5shards=${STAGE5_LOCATION:-$HOME/stage5/$pv/}
pentoo=${arch}${stub}
pv=${pentoo}
#########################################################################################
setup_resolv
pack_stage5
pack_shards
unsquashfs_rootfs
FINAL_clean

########################## fix /etc/resolv.conf to work as Docker LXC, Chroot etc. 
setup_resolv() {
    cat >>${ $dir[$i]}/etc/resolv.conf <<EOF
nameserver 8.8.8.8 
nameserver 8.8.4.4 
nameserver 2001:4860:4860::8888 
nameserver 2001:4860:4860::8844
EOF
## should be persistive globally, google public dns else others will update# 
}

pack_stage5() {

for (( i = 0 ; i < ${#dir[@]} ; i++ ))
do
        mkdir /home/pentoo/stage5/
        tar -cvpzf /home/pentoo/stage5/pentoo-amd64-default.tar.gz --exclude=/backup.tar.gz --one-file-system /tmp/pentoo-amd64-default
        tar -cvpzf /home/pentoo/stage5/pentoo-amd64-hardened.tar.gz --exclude=/backup.tar.gz --one-file-system /tmp/pentoo-hardened-default
        tar -cvpzf /home/pentoo/stage5/pentoo-x86-default.tar.gz --exclude=/backup.tar.gz --one-file-system /tmp/pentoo-x86-default
        tar -cvpzf /home/pentoo/stage5/pentoo-x86-hardened.tar.gz --exclude=/backup.tar.gz --one-file-system /tmp/pentoo-amd64-default
done

}


############## build "shards" just if the files to big offten dockerhub will crash the machine during build. 
# cat *tar.gz* | tar -xvpzf - -C / 

pack_shards () {

       mkdir /home/pentoo/shards/$PV
 
      # | split -d -b 450m - /home/pentoo/shards/
}
# srv mmm salty (saltstack pilars etc...) 
packArray=( bin boot etc home lib32 lib64 opt root run sbin media  usr var srv )
# split 
packArray=( dev media mnt tmp  var srv )
tar -cvpzf VARS$$$ --exclude=
# chuck to a few KB file.
for packArray in ${packArray[*]}
for packArray1 in ${packArray[*]}
do
  mkdir -p /home/$customerName/{outbound,outbound_backup,dropoff}
done

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


# create the final command
if [ "$tar_output" == "--file" ]; then
	tar_command="$find_command | $tar $zip $tarOptions $verbose --file $stage4Name.$stage4postfix --no-recursion -T -"
else
	tar_command="$find_command | $tar $zip $tarOptions $verbose --no-recursion -T - | split $split_options - "$stage4Name.$stage4postfix"_"
fi

if [ "$verbose" ]; then
	echo -ne "\n* creating the stage4 in $stage4Location with the following command:\n\n"$tar_command
fi
