while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " http://download.kde.org/stable/frameworks/5.25/extra-cmake-modules-5.25.0.tar.xz" &&
        tar xf extra-cmake-modules-5.25.0 &&
        cd extra-cmake-modules-5.25.0 &&
        mkdir build &&
        cd    build &&

        cmake -DCMAKE_INSTALL_PREFIX=/usr .. &&
        make &&
        make install;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
