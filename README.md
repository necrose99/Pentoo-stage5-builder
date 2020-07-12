# Pentoo-stage5-builder

Pentoo-stage5-builder and "shard builder"

[http://mirror.switch.ch/ftp/mirror/pentoo/latest-iso-symlinks/](http://mirror.switch.ch/ftp/mirror/pentoo/latest-iso-symlinks/)

7zip  iso , dump squashfs file out

dump squashfs to a temp folder ie /home/isos/pentoo-latest 
make backup , with -C (tar.xz) context to swap root ot $CWD ie /home/isos/pentoo-latest


# Set locales to en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
# Set environment variables.

# fire up the chroot in the cloud...
# Say hello

echo "Bootstrapped Pentoo into /: and the cloud happy building.. " ls --color -lah `

too do clean up / push docker images. add xz file to dropbox or server ,
add curl dockerhub to rebuild statment 

add docker volumes to live cd docker , as one can test build packages , with limited risk to Pentoo install .. especially if stability is in question. 
`
