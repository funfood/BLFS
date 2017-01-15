while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* )
        mkdir xc &&
        cd xc &&
        export XORG_PREFIX="/usr" &&
        export XORG_CONFIG="--prefix=$XORG_PREFIX --sysconfdir=/etc \
          --localstatedir=/var --disable-static" &&
          cat > /etc/profile.d/xorg.sh << EOF
            XORG_PREFIX="$XORG_PREFIX"
            XORG_CONFIG="--prefix=\$XORG_PREFIX --sysconfdir=/etc --localstatedir=/var --disable-static"
            export XORG_PREFIX XORG_CONFIG
          EOF
          chmod 644 /etc/profile.d/xorg.sh &&
          cat >> /etc/profile.d/xorg.sh << "EOF"

          pathappend $XORG_PREFIX/bin             PATH
          pathappend $XORG_PREFIX/lib/pkgconfig   PKG_CONFIG_PATH
          pathappend $XORG_PREFIX/share/pkgconfig PKG_CONFIG_PATH

          pathappend $XORG_PREFIX/lib             LIBRARY_PATH
          pathappend $XORG_PREFIX/include         C_INCLUDE_PATH
          pathappend $XORG_PREFIX/include         CPLUS_INCLUDE_PATH

          ACLOCAL="aclocal -I $XORG_PREFIX/share/aclocal"

          export PATH PKG_CONFIG_PATH ACLOCAL LIBRARY_PATH C_INCLUDE_PATH CPLUS_INCLUDE_PATH
          EOF &&
          echo "$XORG_PREFIX/lib" >> /etc/ld.so.conf &&
          sed "s@/usr/X11R6@$XORG_PREFIX@g" -i /etc/man_db.conf &&
          ln -sf $XORG_PREFIX/share/X11 /usr/share/X11 &&
          echo "primarily for kde:" &&
          ln -sf $XORG_PREFIX /usr/X11R6 &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
