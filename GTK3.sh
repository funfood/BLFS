while true; do
    read -p "Do you wish to install this program? " yn
    case $yn in
        [Yy]* ) wget "http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.6.tar.xz"  &&
        tar xf gtk+-3.22.6.tar.xz &&
        cd gtk+-3.22.6 &&
        echo "there are many things that can and will go wrong here, please refur to the docs at blfs it would be a suprice if we get through the first test without many major fails!" &&
        ./configure --prefix=/usr             \
            --sysconfdir=/etc         \
            --enable-broadway-backend \
            --enable-x11-backend      \
            --disable-wayland-backend &&
        make &&
        make install &&
        #Here is an example of how you could configure it. I may need to run this i have no idea. ¯\_(ツ)_/¯
        #also, you are not expected to understand this (actualy you sort of are I just wanted to put that in here (¬‿¬)  )
        #
        # mkdir -vp ~/.config/gtk-3.0
        # cat > ~/.config/gtk-3.0/settings.ini << "EOF"
        # [Settings]
        # gtk-theme-name = Adwaita
        # gtk-icon-theme-name = oxygen
        # gtk-font-name = DejaVu Sans 12
        # gtk-cursor-theme-size = 18
        # gtk-toolbar-style = GTK_TOOLBAR_BOTH_HORIZ
        # gtk-xft-antialias = 1
        # gtk-xft-hinting = 1
        # gtk-xft-hintstyle = hintslight
        # gtk-xft-rgba = rgb
        # gtk-cursor-theme-name = Adwaita
        # EOF
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
