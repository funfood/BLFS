while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "http://anduin.linuxfromscratch.org/BLFS/blfs-bootscripts/blfs-bootscripts-20160902.tar.xz" &&
        tar xf blfs-bootscripts-20160902.tar.xz &&
        cd blfs-bootscripts-20160902 &&
        ./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --enable-unicode=ucs4 &&
        make &&
        make install &&
        chmod -v 755 /usr/lib/libpython2.7.so.1.0 &&
        cd ..; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
