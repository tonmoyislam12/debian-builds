sudo apt install sbuild mmdebstrap
mkdir -p ~/.cache/sbuild
mmdebstrap --variant=buildd unstable ~/.cache/sbuild/unstable-amd64.tar.xz
cat << "EOF" > ~/.sbuildrc
$chroot_mode = 'unshare';
$distribution = 'unstable';

#$run_autopkgtest = 1;
$autopkgtest_root_args = '';
$autopkgtest_opts = [ '--apt-upgrade', '--', 'unshare', '--release', '%r', '--arch', '%a' ];
EOF
