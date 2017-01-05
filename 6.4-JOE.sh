while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " http://downloads.sourceforge.net/joe-editor/joe-4.3.tar.gz" &&
        tar xf joe-4.3.tar &&
        cd joe-4.3.tar &&
        ./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/joe-4.3 &&
        make &&
        make install &&

        install -vm 755 joe/util/{stringify,termidx,uniproc} /usr/bin &&

        install -vdm755 /usr/share/joe/util &&
        install -vm 644 joe/util/{*.txt,README} /usr/share/joe/util;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
