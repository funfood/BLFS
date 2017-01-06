while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.34/gdk-pixbuf-2.34.0.tar.xz" &&
        tar xf gdk-pixbuf-2.34.0 &&
        cd gdk-pixbuf-2.34.0 &&
        sed -i "/seems to be moved/s/^/#/" ltmain.sh &&
        ./configure --prefix=/usr --with-x11 &&
        make &&
        make install && 
        cd ..;
         break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
