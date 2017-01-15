while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " http://ftp.x.org/pub/individual/lib/libXau-1.0.8.tar.bz2" &&
        tar xf libXau-1.0.8.tar.bz2 &&
        cd libXau-1.0.8 &&
        ./configure $XORG_CONFIG &&
        make &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
