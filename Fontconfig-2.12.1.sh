while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " http://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.1.tar.bz2" &&
        tar xf fontconfig-2.12.1.tar.bz2 &&
        cd fontconfig-2.12.1 &&
        ./configure --prefix=/usr        \
            --sysconfdir=/etc    \
            --localstatedir=/var \
            --disable-docs       \
            --docdir=/usr/share/doc/fontconfig-2.12.1 &&
         make &&
         make install ;

        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
