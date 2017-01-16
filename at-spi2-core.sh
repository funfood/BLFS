while true; do
    read -p "Do you wish to install this program? " yn
    case $yn in
        [Yy]* ) wget " http://ftp.gnome.org/pub/gnome/sources/at-spi2-core/2.22/at-spi2-core-2.22.0.tar.xz"  &&
        tar xf at-spi2-core-2.22.0.tar.xz &&
        cd at-spi2-core-2.22.0 &&
        ./configure --prefix=/usr \
            --sysconfdir=/etc &&
        make &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
