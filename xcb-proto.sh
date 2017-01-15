while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " http://xcb.freedesktop.org/dist/xcb-proto-1.12.tar.bz2" &&
        tar xf xcb-proto-1.12.tar.bz2 &&
        cd xcb-proto-1.12 &&
        patch -Np1 -i ../xcb-proto-1.12-schema-1.patch &&
        patch -Np1 -i ../xcb-proto-1.12-python3-1.patch &&
        ./configure $XORG_CONFIG &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
