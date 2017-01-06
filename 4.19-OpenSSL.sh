while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "https://openssl.org/source/openssl-1.0.2h.tar.gz" &&
        tar xf openssl-1.0.2h.tar.gz &&
        cd openssl-1.0.2h &&
        ./config --prefix=/usr         \
                 --openssldir=/etc/ssl \
                 --libdir=lib          \
                 shared                \
                 zlib-dynamic &&
        make depend           &&
        make &&
        make MANDIR=/usr/share/man MANSUFFIX=ssl install &&
        install -dv -m755 /usr/share/doc/openssl-1.0.2h  &&
        cp -vfr doc/*     /usr/share/doc/openssl-1.0.2h &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
