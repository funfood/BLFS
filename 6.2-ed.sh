while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " http://ftp.gnu.org/pub/gnu/ed/ed-1.13.tar.lz" &&
        tar xf ed-1.13.tar &&
        cd ed-1.13.tar &&
        ./configure --prefix=/usr --bindir=/bin &&
        make &&
        make install ;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
