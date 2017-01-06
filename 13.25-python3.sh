while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tar.xz" &&
        tar xf Python-3.5.2.tar.xz &&
        cd Python-3.5.2 &&
        CXX="/usr/bin/g++"              \
        ./configure --prefix=/usr       \
                    --enable-shared     \
                    --with-system-expat \
                    --with-system-ffi   \
                    --without-ensurepip &&
        make &&
        make install &&
        chmod -v 755 /usr/lib/libpython3.5m.so &&
        chmod -v 755 /usr/lib/libpython3.so &&
        ln -svfn python-3.5.2 /usr/share/doc/python-3 &&
        export PYTHONDOCS=/usr/share/doc/python-3/html &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
