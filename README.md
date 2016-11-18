# Pentoo-stage5-builder
Pentoo-stage5-builder and "shard builder"

http://mirror.switch.ch/ftp/mirror/pentoo/latest-iso-symlinks/

###not as yet implemented  (or insert your own URL share) <http://mirror.switch.ch/ftp/mirror/pentoo/latest-taball-symlinks/>

Dockerhub dosnet easily build such large files containers to fit all of pentoo in. quay.io however Will if your paying em... 

for LXC , one could simply fork the Gentoo lxc , file tweak **if thier were public tarballs. ** swap pentoo tarball for gentoo.. 
done.. 

dockerhub also even if you can make a gentoo container to 7zip oppen iso , and remove items, replace gentoo files as needed with pentoo's from iso , rev-dep rebuild , ***wont always get quite that far.** Dockerhub builder will throw a furball and die 


for chroot on your server , you can build against pentoo , whith out  risk of major breakage. or if really pushing the bleeding edge... not giving your base install **"Brain damage"** 

## Shards ? 
 tar --$exlude my-pentoo-$date-$arch /tmp/$pentoo-$arch etc  , run 1 include XYZ , ABC , 
 400 meg-ish tarballs spanned over several arhives, and do a few pentoo dirs 5-8 tarballs in total. 
 2.9G-3.9 Gigs, insize with one hudge file Dockerhub "tends to get a Harball. and ||!DIE "
 
##TESTING: with some testing although SF.net uploads suck mighty Gahones from a desktop client... 
doing a docker file it will download each shard and if from scratch drop and unpack in the root. 


#### Example using "Shards"  , 
Zcat may or may not be on the busybox base image for gentoo , then using rflap etc pain in the arse. and trying to abuse the gentoo offical builder script .. etc..  , and just making clean tarballs to alow dockerhub / Quay.io to unpack and re-merge into the root-fs simple clean , but you can always re-cat them back if you want too. 


FROM scratch
MAINTAINER Necrose99
VOLUME /var/lib/layman:rw, /usr/portage:rw", /usr/portage/distfiles:rw, 
## add binformat to host and to chroot area 
ADD pentoo-*-A.tar.gz /
ADD pentoo-*-B.tar.gz /
ADD pentoo-*-C.tar.gz /
ADD pentoo-*-D.tar.gz /
ADD pentoo-*-E.tar.gz /
ADD pentoo-*-F.tar.gz /
ADD pentoo-*-g.tar.gz /
# Set locales to en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
# Set environment variables.

# fire up the chroot in the cloud... 
# Say hello
echo "Bootstrapped  Pentoo  into /:   and the cloud happy building.. "
ls --color -lah
