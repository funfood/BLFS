#if somthing breaks please refur to the note on this blfs page if may have the answer.
while true; do
    read -p "Do you wish to install this program? " yn
    case $yn in
        [Yy]* ) wget "http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.3.tar.xz"  &&
        tar xf gdk-pixbuf-2.36.3.tar.xz &&
        cd gdk-pixbuf-2.36.3 &&
        ./configure --prefix=/usr --with-x11 &&
        make &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
