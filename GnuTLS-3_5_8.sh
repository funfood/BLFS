while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "ftp://ftp.gnutls.org/gcrypt/gnutls/v3.5/gnutls-3.5.8.tar.xz" &&
        tar xf gnutls-3.5.8.tar.xz &&
        cd gnutls-3.5.8 &&
        ./configure --prefix=/usr \
            --with-default-trust-store-file=/etc/ssl/ca-bundle.crt &&
        make &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
