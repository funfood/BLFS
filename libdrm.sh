while true; do
    read -p "Do you wish to install this program? " yn
    case $yn in
        [Yy]* ) wget "http://dri.freedesktop.org/libdrm/libdrm-2.4.74.tar.bz2"  &&
        tar xf libdrm-2.4.74.tar.bz2 &&
        cd libdrm-2.4.74 &&
        sed -i "/pthread-stubs/d" configure.ac  &&
        autoreconf -fiv                         &&

        ./configure --prefix=/usr --enable-udev &&
        make &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
