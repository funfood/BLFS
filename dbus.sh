while true; do
    read -p "Do you wish to install this program? IMPORTANT:: this program should not be installed via chroot!" yn
    case $yn in
        [Yy]* ) wget " http://dbus.freedesktop.org/releases/dbus/dbus-1.10.14.tar.gz"  &&
        tar xf dbus-1.10.14.tar.gz &&
        cd dbus-1.10.14 &&
        groupadd -g 18 messagebus &&
        useradd -c "D-Bus Message Daemon User" -d /var/run/dbus \
                -u 18 -g messagebus -s /bin/false messagebus &&
        ./configure --prefix=/usr                  \
                            --sysconfdir=/etc              \
                            --localstatedir=/var           \
                            --disable-doxygen-docs         \
                            --disable-xml-docs             \
                            --disable-static               \
                            --disable-systemd              \
                            --without-systemdsystemunitdir \
                            --with-console-auth-dir=/run/console/ \
                            --docdir=/usr/share/doc/dbus-1.10.14   &&
        make &&
        make install &&
        echo "this is IMPORTANT: if in chroot run this aswell. or to make matters simpler do not run this in chroot! command:(dbus-uuidgen --ensure)" &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
