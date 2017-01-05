while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "http://xmlsoft.org/sources/libxml2-2.9.4.tar.gz" &&
        tar xf libxml2-2.9.4 &&
        cd libxml2-2.9.4 &&
        sed -i "/seems to be moved/s/^/#/" ltmain.sh &&
        ./configure --prefix=/usr --disable-static --with-history &&
        make &&
        make install;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
