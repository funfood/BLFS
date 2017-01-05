while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "http://www.sudo.ws/dist/sudo-1.8.17p1.tar.gz" &&
        tar xf sudo-1.8.17p1 &&
        cd sudo-1.8.17p1 &&
        ./configure --prefix=/usr              \
            --libexecdir=/usr/lib      \
            --with-secure-path         \
            --with-all-insults         \
            --with-env-editor          \
            --docdir=/usr/share/doc/sudo-1.8.17p1 \
            --with-passprompt="[sudo] password for %p" &&
        make &&
        make install &&
        ln -sfv libsudo_util.so.0.0.0 /usr/lib/sudo/libsudo_util.so.0;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
