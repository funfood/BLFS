while true; do
    read -p "Do you wish to install this program? " yn
    case $yn in
        [Yy]* ) wget "http://downloads.sourceforge.net/libpng/libpng-1.6.28.tar.xz"  &&
        tar xf libpng-1.6.28.tar.xz &&
        cd libpng-1.6.28 &&
        ./configure --prefix=/usr --disable-static &&
        make &&
        make install &&
        mkdir -v /usr/share/doc/libpng-1.6.28 &&
        cp -v README libpng-manual.txt /usr/share/doc/libpng-1.6.28 &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
