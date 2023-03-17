sudo apt-get install sbuild schroot debootstrap apt-cacher-ng devscripts piuparts
sudo tee ~/.sbuildrc << EOF
##############################################################################
# PACKAGE BUILD RELATED (additionally produce _source.changes)
##############################################################################
# -d
$distribution = 'unstable';
# -A
$build_arch_all = 1;
# -s
$build_source = 1;
# --source-only-changes (applicable for dput. irrelevant for dgit push-source).
$source_only_changes = 1;
# -v
$verbose = 1;
# parallel build
$ENV{'DEB_BUILD_OPTIONS'} = 'parallel=5';
##############################################################################
# POST-BUILD RELATED (turn off functionality by setting variables to 0)
##############################################################################
$run_lintian = 1;
$lintian_opts = ['-i', '-I'];
$run_piuparts = 1;
$piuparts_opts = ['--schroot', '%r-%a-sbuild', '--no-eatmydata'];
$run_autopkgtest = 1;
$autopkgtest_root_args = '';
$autopkgtest_opts = [ '--', 'schroot', '%r-%a-sbuild' ];

##############################################################################
# PERL MAGIC
##############################################################################
1;
EOF
sudo sbuild-adduser $LOGNAME
sudo ln -sf ~/.sbuildrc /root/.sbuildrc
newgrp sbuild
sudo sbuild-createchroot --include=eatmydata,ccache unstable /srv/chroot/unstable-amd64-sbuild http://ftp.us.debian.org/debian
