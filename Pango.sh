while true; do
    read -p "Do you wish to install this program? " yn
    case $yn in
        [Yy]* ) wget "http://ftp.gnome.org/pub/gnome/sources/pango/1.40/pango-1.40.3.tar.xz"  &&
        tar xf libepoxy-1.3.1.tar.bz2 &&
        cd libepoxy-1.3.1 &&
        ./configure --prefix=/usr --sysconfdir=/etc &&
        make &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
