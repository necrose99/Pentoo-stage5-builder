http://mirror.switch.ch/ftp/mirror/pentoo/latest-iso-symlinks/pentoo-amd64-default.iso
http://mirror.switch.ch/ftp/mirror/pentoo/latest-iso-symlinks/pentoo-amd64-hardened.iso
http://mirror.switch.ch/ftp/mirror/pentoo/latest-iso-symlinks/pentoo-x86-default.iso
http://mirror.switch.ch/ftp/mirror/pentoo/latest-iso-symlinks/pentoo-x86-hardened.iso

unsquashfs -f -d /mnt/gentoo /mnt/cdrom/image.squashfs
unsquashfs -f -d /mnt/gentoo /mnt/cdrom/modules/portage-*.lzm
unsquashfs -f -d /mnt/gentoo /mnt/cdrom/modules/pentoo_overlay-*.lzm
