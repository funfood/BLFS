while true; do
    read -p "Do you wish to install this program? " yn
    case $yn in
        [Yy]* ) wget "http://downloads.sourceforge.net/pcre/pcre-8.35.tar.bz2"  &&
        tar xf nasm-2.12.02.tar.xz &&
        cd nasm-2.12.02 &&
        ./configure --prefix=/usr                     \
                    --docdir=/usr/share/doc/pcre-8.35 \
                    --enable-unicode-properties       \
                    --enable-pcre16                   \
                    --enable-pcre32                   \
                    --enable-pcregrep-libz            \
                    --enable-pcregrep-libbz2          \
                    --enable-pcretest-libreadline     \
                    --disable-static                 &&
        make
        make install                     &&
        mv -v /usr/lib/libpcre.so.* /lib &&
        ln -sfv ../../lib/$(readlink /usr/lib/libpcre.so) /usr/lib/libpcre.so &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
