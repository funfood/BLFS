while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz" &&
        tar xf libffi-3.2.1.tar.gz &&
        cd libffi-3.2.1 &&
        sed -e '/^includesdir/ s/$(libdir).*$/$(includedir)/' \
            -i include/Makefile.in &&

        sed -e '/^includedir/ s/=.*$/=@includedir@/' \
            -e 's/^Cflags: -I${includedir}/Cflags:/' \
            -i libffi.pc.in        &&

        ./configure --prefix=/usr --disable-static &&
        make &&
        make install ;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
