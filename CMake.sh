while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " http://www.cmake.org/files/v3.6/cmake-3.6.1.tar.gz" &&
        tar xf cmake-3.6.1 &&
        cd cmake-3.6.1 &&
        ./bootstrap --prefix=/usr       \
            --system-libs       \
            --mandir=/share/man \
            --no-system-jsoncpp \
            --docdir=/share/doc/cmake-3.6.1 &&
        make &&
        make install ;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
