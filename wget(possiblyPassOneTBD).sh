while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) #somhow obtain  http://ftp.gnu.org/gnu/wget/wget-1.18.tar.xz
        echo "make sure that the dependancys ^^ are here!!!"
        tar xf wget-1.18.tar.xz &&
        cd wget-1.18 &&
        ./configure --prefix=/usr      \
            --sysconfdir=/etc  &&
        make &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
