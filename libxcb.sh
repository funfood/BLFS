while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " http://xcb.freedesktop.org/dist/libxcb-1.12.tar.bz2" &&
        tar xf libxcb-1.12.tar.bz2 &&
        cd libxcb-1.12 &&
        patch -Np1 -i ../libxcb-1.12-python3-1.patch &&
        sed -i "s/pthread-stubs//" configure &&

        ./configure $XORG_CONFIG      \
                    --enable-xinput   \
                    --without-doxygen \
                    --docdir='${datadir}'/doc/libxcb-1.12 &&
        make &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
