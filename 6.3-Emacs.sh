while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "http://git.savannah.gnu.org/cgit/emacs.git/snapshot/emacs-25.1-rc2.tar.gz" &&
        tar xf emacs-25.1-rc2 &&
        cd emacs-25.1-rc2 &&
        ./autogen.sh                                   &&
        ./configure --prefix=/usr --localstatedir=/var &&
        make &&
        make install &&
        chown -v -R root:root /usr/share/emacs/25.1 &&
        gtk-update-icon-cache -t -f --include-image-data /usr/share/icons/hicolor &&
        update-desktop-database; 
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
