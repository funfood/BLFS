while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " https://ftp.gnu.org/gnu/nettle/nettle-3.3.tar.gz" &&
        tar xf nettle-3.3.tar.gz &&
        cd nettle-3.3 &&
        ./configure --prefix=/usr --disable-static &&
        make &&
        make install &&
        chmod   -v   755 /usr/lib/lib{hogweed,nettle}.so &&
        install -v -m755 -d /usr/share/doc/nettle-3.3 &&
        install -v -m644 nettle.html /usr/share/doc/nettle-3.3 &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
