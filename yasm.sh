while true; do
    read -p "Do you wish to install this program? " yn
    case $yn in
        [Yy]* ) wget " http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz"  &&
        tar xf yasm-1.3.0.tar.gz &&
        cd yasm-1.3.0 &&
        sed -i 's#) ytasm.*#)#' Makefile.in &&

        ./configure --prefix=/usr &&
        make &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
