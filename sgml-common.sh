while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/sgml-common-0.6.3.tgz" &&
        patch -Np1 -i ../sgml-common-0.6.3-manpage-1.patch &&
        autoreconf -f -i &&
        ./configure --prefix=/usr --sysconfdir=/etc &&
        make &&
        make docdir=/usr/share/doc install &&

        install-catalog --add /etc/sgml/sgml-ent.cat \
            /usr/share/sgml/sgml-iso-entities-8879.1986/catalog &&

        install-catalog --add /etc/sgml/sgml-docbook.cat \
            /etc/sgml/sgml-ent.cat ;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
