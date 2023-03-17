sudo apt-get install sbuild schroot debootstrap apt-cacher-ng devscripts piuparts
cp -v .sbuildrc ~/.sbuildrc
echo $USER
whoami
sudo sbuild-adduser $USER
sudo ln -sf ~/.sbuildrc /root/.sbuildrc
newgrp sbuild
sudo sbuild-createchroot --include=eatmydata,ccache unstable /srv/chroot/unstable-amd64-sbuild http://ftp.us.debian.org/debian
