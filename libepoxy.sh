while true; do
    read -p "Do you wish to install this program? " yn
    case $yn in
        [Yy]* ) wget "https://github.com/anholt/libepoxy/releases/download/v1.3.1/libepoxy-1.3.1.tar.bz2"  &&
        tar xf libepoxy-1.3.1.tar.bz2 &&
        cd libepoxy-1.3.1 &&
        ./configure --prefix=/usr &&
        make &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
