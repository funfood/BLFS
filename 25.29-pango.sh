while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " http://ftp.gnome.org/pub/gnome/sources/pango/1.40/pango-1.40.1.tar.xz" &&
        tar xf pango-1.40.1 &&
        cd pango-1.40.1 &&
        sed -i "/seems to be moved/s/^/#/" ltmain.sh &&
        ./configure --prefix=/usr --sysconfdir=/etc &&
        make &&
        make install ;
         break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
