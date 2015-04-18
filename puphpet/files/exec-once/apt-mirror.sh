#!/bin/bash

cat >/etc/apt/mirror.list << 'EOL'
############# config ##################
#
set base_path    /var/www/repo.puphpet.com/vendor/
#
set mirror_path  $base_path/mirror
set skel_path    $base_path/skel
set var_path     $base_path/var
set cleanscript $var_path/clean.sh
# set defaultarch  <running host architecture>
set postmirror_script $var_path/postmirror.sh
set run_postmirror 0
set nthreads     20
set _tilde 0
#
############# end config ##############

deb-amd64 http://packages.dotdeb.org wheezy all
deb-i386 http://packages.dotdeb.org wheezy all
deb-src http://packages.dotdeb.org wheezy all

deb-amd64 http://packages.dotdeb.org squeeze all
deb-i386 http://packages.dotdeb.org squeeze all
deb-src http://packages.dotdeb.org squeeze all

deb-amd64 http://packages.dotdeb.org wheezy-php56 all
deb-i386 http://packages.dotdeb.org wheezy-php56 all
deb-src http://packages.dotdeb.org wheezy-php56 all

deb-amd64 http://packages.dotdeb.org wheezy-php55 all
deb-i386 http://packages.dotdeb.org wheezy-php55 all
deb-src http://packages.dotdeb.org wheezy-php55 all

deb-amd64 http://packages.dotdeb.org squeeze-php54 all
deb-i386 http://packages.dotdeb.org squeeze-php54 all
deb-src http://packages.dotdeb.org squeeze-php54 all

clean http://packages.dotdeb.org
EOL

mkdir -p /var/www/repo.puphpet.com/vendor

apt-mirror

ln -s /var/www/repo.puphpet.com/vendor/mirror/packages.dotdeb.org \
      /var/www/repo.puphpet.com/public_html/dotdeb
