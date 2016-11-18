<html>
<head>

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<h1>Pentoo-stage5-builder</h1>
<p>Pentoo-stage5-builder and "shard builder"</p>
<p><a
href="http://mirror.switch.ch/ftp/mirror/pentoo/latest-iso-symlinks/">http://mirror.switch.ch/ftp/mirror/pentoo/latest-iso-symlinks/</a></p>
<h3><a
id="user-content-not-as-yet-implemented--or-insert-your-own-url-share-httpmirrorswitchchftpmirrorpentoolatest-taball-symlinks"
class="anchor"
href="https://github.com/necrose99/Pentoo-stage5-builder/blob/master/README.md#not-as-yet-implemented--or-insert-your-own-url-share-httpmirrorswitchchftpmirrorpentoolatest-taball-symlinks"
aria-hidden="true"><svg aria-hidden="true" class="octicon
octicon-link" height="16" version="1.1" viewBox="0 0 16 16"
width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5
0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91
2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8
4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2
2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64
1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9
13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>not
as yet implemented (or insert your own URL share) <a
href="http://mirror.switch.ch/ftp/mirror/pentoo/latest-taball-symlinks/">http://mirror.switch.ch/ftp/mirror/pentoo/latest-taball-symlinks/</a></h3>
<p>Dockerhub dosnet easily build such large files containers to fit
all of pentoo in. quay.io however Will if your paying em... </p>
<p>for LXC , one could simply fork the Gentoo lxc , file tweak *<em>if
thier were public tarballs. *</em> swap pentoo tarball for
gentoo.. done.. </p>
<p>dockerhub also even if you can make a gentoo container to 7zip
oppen iso , and remove items, replace gentoo files as needed with
pentoo's from iso , rev-dep rebuild , <em>**wont always get quite
that far.</em>* Dockerhub builder will throw a furball and die </p>
<p>for chroot on your server , you can build against pentoo , whith
out risk of major breakage. or if really pushing the bleeding
edge... not giving your base install <strong>"Brain damage"</strong>
</p>
<h2><a id="user-content-shards-" class="anchor"
href="https://github.com/necrose99/Pentoo-stage5-builder/blob/master/README.md#shards-"
aria-hidden="true"><svg aria-hidden="true" class="octicon
octicon-link" height="16" version="1.1" viewBox="0 0 16 16"
width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5
0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91
2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8
4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2
2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64
1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9
13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Shards
?</h2>
<p>tar --$exlude my-pentoo-$date-$arch /tmp/$pentoo-$arch etc , run
1 include XYZ , ABC , 400 meg-ish tarballs spanned over several
arhives, and do a few pentoo dirs 5-8 tarballs in total. 2.9G-3.9
Gigs, insize with one hudge file Dockerhub "tends to get a
Harball. and ||!DIE "</p>
<h2><a
id="user-content-testing-with-some-testing-although-sfnet-uploads-suck-mighty-gahones-from-a-desktop-client"
class="anchor"
href="https://github.com/necrose99/Pentoo-stage5-builder/blob/master/README.md#testing-with-some-testing-although-sfnet-uploads-suck-mighty-gahones-from-a-desktop-client"
aria-hidden="true"><svg aria-hidden="true" class="octicon
octicon-link" height="16" version="1.1" viewBox="0 0 16 16"
width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5
0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91
2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8
4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2
2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64
1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9
13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>TESTING:
with some testing although SF.net uploads suck mighty Gahones from
a desktop client...</h2>
<p>doing a docker file it will download each shard and if from
scratch drop and unpack in the root. </p>
<h4><a id="user-content-example-using-shards--" class="anchor"
href="https://github.com/necrose99/Pentoo-stage5-builder/blob/master/README.md#example-using-shards--"
aria-hidden="true"><svg aria-hidden="true" class="octicon
octicon-link" height="16" version="1.1" viewBox="0 0 16 16"
width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5
0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91
2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8
4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2
2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64
1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9
13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Example
using "Shards" ,</h4>
<p>Zcat may or may not be on the busybox base image for gentoo ,
then using rflap etc pain in the arse. and trying to abuse the
gentoo offical builder script .. etc.. , and just making clean
tarballs to alow dockerhub / Quay.io to unpack and re-merge into
the root-fs simple clean , but you can always re-cat them back if
you want too.<br>
<br>
</p>
<code>
FROM scratch<br>
MAINTAINER Necrose99<br>
VOLUME /var/lib/layman:rw, /usr/portage:rw",
/usr/portage/distfiles:rw,<br>
## add binformat to host and to chroot area<br>
ADD pentoo-*-A.tar.gz /<br>
ADD pentoo-*-B.tar.gz /<br>
ADD pentoo-*-C.tar.gz /<br>
ADD pentoo-*-D.tar.gz /<br>
ADD pentoo-*-E.tar.gz /<br>
ADD pentoo-*-F.tar.gz /<br>
ADD pentoo-*-g.tar.gz /<br>
# Set locales to en_US.UTF-8<br>
ENV LC_ALL=en_US.UTF-8<br>
# Set environment variables.<br>
<br>
# fire up the chroot in the cloud...<br>
# Say hello<br>
<br>
echo "Bootstrapped Pentoo into /: and the cloud happy building.. "
ls --color -lah ` </code><br>
<br>
</body>
</html>
