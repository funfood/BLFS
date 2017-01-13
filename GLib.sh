while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "http://ftp.gnome.org/pub/gnome/sources/glib/2.48/glib-2.48.2.tar.xz" &&
        tar xf glib-2.48.2.tar.xz &&
        cd glib-2.48.2 &&
        ./configure --prefix=/usr --with-pcre=system &&
        make &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
