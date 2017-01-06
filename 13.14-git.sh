while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " https://www.kernel.org/pub/software/scm/git/git-2.9.3.tar.xz" &&
        tar xf git-2.9.3.tar.xz &&
        cd git-2.9.3 &&
        ./configure --prefix=/usr --with-gitconfig=/etc/gitconfig &&
        make &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
