sudo apt-get install sbuild schroot debootstrap apt-cacher-ng devscripts piuparts
sudo tee ~/.sbuildrc << EOF
$distribution = 'unstable';
$build_arch_all = 1;
$build_source = 1;
$source_only_changes = 1;
$verbose = 1;
$ENV{'DEB_BUILD_OPTIONS'} = 'parallel=5';
$run_lintian = 1;
$lintian_opts = ['-i', '-I'];
$run_piuparts = 1;
$piuparts_opts = ['--schroot', '%r-%a-sbuild', '--no-eatmydata'];
$run_autopkgtest = 1;
$autopkgtest_root_args = '';
$autopkgtest_opts = [ '--', 'schroot', '%r-%a-sbuild' ];
EOF
echo $LOGNAME
sudo sbuild-adduser $LOGNAME
sudo ln -sf ~/.sbuildrc /root/.sbuildrc
newgrp sbuild
sudo sbuild-createchroot --include=eatmydata,ccache unstable /srv/chroot/unstable-amd64-sbuild http://ftp.us.debian.org/debian
