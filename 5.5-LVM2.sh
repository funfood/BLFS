while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "ftp://sources.redhat.com/pub/lvm2/releases/LVM2.2.02.164.tgz" &&
        tar xf LVM2.2.02.164.tgz &&
        cd LVM2.2.02.164 &&
        SAVEPATH=$PATH                  &&
        PATH=$PATH:/sbin:/usr/sbin      &&
        ./configure --prefix=/usr       \
                    --exec-prefix=      \
                    --enable-applib     \
                    --enable-cmdlib     \
                    --enable-pkgconfig  \
                    --enable-udev_sync  &&
        make                            &&
        PATH=$SAVEPATH                  &&
        unset SAVEPATH &&
        make -C tools install_dmsetup_dynamic &&
        make -C udev  install                 &&
        make -C libdm install &&
        make install &&
        cd ..;
         break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
