while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "http://anduin.linuxfromscratch.org/BLFS/blfs-bootscripts/blfs-bootscripts-20160902.tar.xz"; make install-random; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
