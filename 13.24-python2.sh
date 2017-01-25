while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "https://www.python.org/ftp/python/2.7.12/Python-2.7.12.tar.xz" &&
        tar xf Python-2.7.12.tar.xz &&
        cd Python-2.7.12 &&
        ./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --enable-unicode=ucs4 &&
        make &&
        make install &&
        chmod -v 755 /usr/lib/libpython2.7.so.1.0 &&
        install -v -dm755 /usr/share/doc/python-2.7.12 &&

        tar --strip-components=1                     \
            --no-same-owner                          \
            --directory /usr/share/doc/python-2.7.12 \
            -xvf ../python-2.7.12-docs-html.tar.bz2 &&

        find /usr/share/doc/python-2.7.12 -type d -exec chmod 0755 {} \; &&
        find /usr/share/doc/python-2.7.12 -type f -exec chmod 0644 {} \; &&
        export PYTHONDOCS=/usr/share/doc/python-2.7.12 &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
