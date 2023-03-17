sudo apt-get install sbuild schroot debootstrap apt-cacher-ng devscripts piuparts debian-keyring debian-archive-keyring
cp -v .sbuildrc ~/.sbuildrc
echo $USER
whoami
sudo sbuild-adduser $USER
sudo ln -sf ~/.sbuildrc /root/.sbuildrc
newgrp sbuild
sudo sbuild-createchroot --include=eatmydata,ccache unstable /srv/chroot/unstable-amd64-sbuild http://ftp.us.debian.org/debian
sudo sbuild-update -udcar u
pwd && mkdir -pv myapp && cd myapp
cat /etc/apt/sources.list
