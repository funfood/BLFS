while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "http://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.xz" &&
        tar xf ruby-2.3.1.tar.xz &&
        cd ruby-2.3.1 &&
        ./configure --prefix=/usr   \
            --enable-shared \
            --docdir=/usr/share/doc/ruby-2.3.1 &&
        make &&
        make capi &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
