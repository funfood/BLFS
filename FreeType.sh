while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "http://downloads.sourceforge.net/freetype/freetype-2.6.5.tar.bz2" &&
        tar xf freetype-2.6.5 &&
        cd freetype-2.6.5 &&
        sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg &&

        sed -r "s:.*(#.*SUBPIXEL_(RENDERING|HINTING 2)) .*:\1:g" \
            -i include/freetype/config/ftoption.h  &&

        ./configure --prefix=/usr --disable-static &&
        make &&
        make install &&
        install -v -m755 -d /usr/share/doc/freetype-2.6.5 &&
        cp -v -R docs/*     /usr/share/doc/freetype-2.6.5 ; 
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
