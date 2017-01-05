while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " http://ftp.gnome.org/pub/gnome/sources/atk/2.20/atk-2.20.0.tar.xz" &&
        tar xf atk-2.20.0 &&
        cd atk-2.20.0 &&
        ./configure --prefix=/usr &&
        make &&
        make install ;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
