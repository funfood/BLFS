while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " http://www.bennewitz.com/bluefish/stable/source/bluefish-2.2.9.tar.bz2" &&
        tar xf bluefish-2.2.9 &&
        cd bluefish-2.2.9 &&
        ./configure --prefix=/usr --docdir=/usr/share/doc/bluefish-2.2.9 &&
        make &&
        make install &&
        gtk-update-icon-cache -t -f --include-image-data /usr/share/icons/hicolor &&
        update-desktop-database ;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
