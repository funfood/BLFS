while true; do
    read -p "Do you wish to install this program? " yn
    case $yn in
        [Yy]* ) wget "https://mesa.freedesktop.org/archive/13.0.3/mesa-13.0.3.tar.xz"  &&
        tar xf mesa-13.0.3.tar.xz &&
        cd mesa-13.0.3 &&
        echo "IMPORTANT:: if building kde must add switch! refur to blfs page for more." &&
        sed -i "/pthread_stubs_possible=/s/yes/no/" configure.ac &&
        ./autogen.sh CFLAGS='-O2' CXXFLAGS='-O2'    \
                    --prefix=$XORG_PREFIX           \
                    --sysconfdir=/etc               \
                    --enable-texture-float          \
                    --enable-osmesa                 \
                    --enable-xa                     \
                    --enable-glx-tls                \
                    --with-egl-platforms="drm,x11"  \
                    --with-gallium-drivers=$GLL_DRV &&

        unset GLL_DRV &&

        make &&
        make install &&
        cd ..;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
