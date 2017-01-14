while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) #somhow obtain ftp://ftp.gnutls.org/gcrypt/gnutls/v3.5/gnutls-3.5.8.tar.xz
        echo "make sure that the dependancys ^^ are here!!!"
        tar xf gnutls-3.5.8.tar.xz &&
        cd gnutls-3.5.8 &&
        ./configure --prefix=/usr \
            --with-default-trust-store-file=/etc/ssl/ca-bundle.crt \
            # the reason that we are doing it without any of the dependancys are because wget is not installed (obviosly) so it is mroe trouble than it is worth.
            --with-included-libtasn1 \
            --with-included-unistring \
            --without-p11-kit &&
        make &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
