while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " http://ftp.x.org/pub/individual/util/util-macros-1.19.0.tar.bz2" &&
        tar xf util-macros-1.19.0.tar.bz2 &&
        cd util-macros-1.19.0 &&
        ./configure $XORG_CONFIG &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
