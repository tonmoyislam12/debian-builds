
sudo apt-get install sbuild schroot debootstrap apt-cacher-ng devscripts piuparts
cp .sbuildrc ~/.sbuildrc
echo $USER
echo $LOGNAME
whoami
sudo sbuild-adduser $LOGNAME
whoami
sudo ln -sf ~/.sbuildrc /root/.sbuildrc
newgrp sbuild
sudo sbuild-createchroot --include=eatmydata,ccache unstable /srv/chroot/unstable-amd64-sbuild http://ftp.us.debian.org/debian
