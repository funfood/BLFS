while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " https://github.com/fontforge/fontforge/releases/download/20160404/fontforge-dist-20160404.tar.gz" &&
        tar xf fontforge-dist-20160404 &&
        cd fontforge-dist-20160404 &&
        sed -i 's/20140101/20160404/g' configure inc/fontforge-config.h \
                                       tests/package.m4 tests/testsuite
        ./configure --prefix=/usr     \
                    --enable-gtk2-use \
                    --disable-static  \
                    --docdir=/usr/share/doc/fontforge-20160404 &&
        make &&
        make install ;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
