while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "http://ftp.gnu.org/gnu/parted/parted-3.2.tar.xz";
        tar xf parted-3.2.tar.xz &&
        cd parted-3.2 &&
        ./configure --prefix=/usr --disable-static &&
        make &&

        make -C doc html                                       &&
        makeinfo --html      -o doc/html       doc/parted.texi &&
        makeinfo --plaintext -o doc/parted.txt doc/parted.texi &&
        make install &&
        install -v -m755 -d /usr/share/doc/parted-3.2/html &&
        install -v -m644    doc/html/* \
                            /usr/share/doc/parted-3.2/html &&
        install -v -m644    doc/{FAT,API,parted.{txt,html}} \
                            /usr/share/doc/parted-3.2 &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
