while true; do
    read -p "Do you wish to install this program? " yn
    case $yn in
        [Yy]* ) wget "http://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-1.5.1.tar.gz"  &&
        tar xf libjpeg-turbo-1.5.1.tar.gz &&
        cd libjpeg-turbo-1.5.1 &&
        ./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-jpeg8            \
            --disable-static        \
            --docdir=/usr/share/doc/libjpeg-turbo-1.5.1 &&
        make &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
