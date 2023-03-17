sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo cp sources.list /etc/apt/sources.list
sudo apt-get update
sudo apt-get install sbuild schroot debootstrap apt-cacher-ng devscripts piuparts debian-keyring debian-archive-keyring
cp -v .sbuildrc ~/.sbuildrc
echo $USER
whoami
sudo sbuild-adduser $USER
sudo ln -sf ~/.sbuildrc /root/.sbuildrc
newgrp sbuild
sudo sbuild-createchroot --include=eatmydata,ccache unstable /srv/chroot/unstable-amd64-sbuild http://ftp.us.debian.org/debian
sudo sbuild-update -udcar u
cat /etc/apt/sources.list
pwd && mkdir -pv aria2 && cd aria2 && sudo apt source aria2
pwd && mkdir -pv qbit && cd qbit && sudo apt source qbittorrent-nox
pwd && mkdir -pv mpeg && cd mpeg && sudo apt source ffmpeg
ls -a aria2
ls -a qbit
ls -a mpeg
cd aria2/aria2-1.36.0/ && sudo sbuild
