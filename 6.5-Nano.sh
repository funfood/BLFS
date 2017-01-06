while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "https://www.nano-editor.org/dist/v2.6/nano-2.6.3.tar.xz" &&
        tar xf nano-2.6.3 &&
        cd nano-2.6.3 &&
        ./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --enable-utf8     \
            --docdir=/usr/share/doc/nano-2.6.3 &&
        make &&
        make install &&
        install -v -m644 doc/nanorc.sample /etc &&
        install -v -m644 doc/texinfo/nano.html /usr/share/doc/nano-2.6.3 &&
        cd ..; 
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
