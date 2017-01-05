while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget " http://downloads.sourceforge.net/boost/boost_1_61_0.tar.bz2" &&
        tar xf boost_1_61_0 &&
        cd boost_1_61_0 &&
        sed -e '/using python/ s@;@: /usr/include/python${PYTHON_VERSION/3*/${PYTHON_VERSION}m} ;@' \
          -i bootstrap.sh &&
        sed -e '1 i#ifndef Q_MOC_RUN' \
            -e '$ a#endif'            \
            -i boost/type_traits/detail/has_binary_operator.hpp &&

        ./bootstrap.sh --prefix=/usr &&
        ./b2 stage threading=multi link=shared &&
        ./b2 install threading=multi link=shared;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
