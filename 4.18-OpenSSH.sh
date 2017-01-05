while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) wget "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.3p1.tar.gz" &&
        tar xf openssh-7.3p1 &&
        cd openssh-7.3p1 &&
        install  -v -m700 -d /var/lib/sshd &&
        chown    -v root:sys /var/lib/sshd &&

        groupadd -g 50 sshd        &&
        useradd  -c 'sshd PrivSep' \
                 -d /var/lib/sshd  \
                 -g sshd           \
                 -s /bin/false     \
                 -u 50 sshd &&
        ./configure --prefix=/usr                     \
                   --sysconfdir=/etc/ssh             \
                   --with-md5-passwords              \
                   --with-privsep-path=/var/lib/sshd &&
        make &&
        make install &&
        install -v -m755    contrib/ssh-copy-id /usr/bin     &&

        install -v -m644    contrib/ssh-copy-id.1 \
                            /usr/share/man/man1              &&
        install -v -m755 -d /usr/share/doc/openssh-7.3p1     &&
        install -v -m644    INSTALL LICENCE OVERVIEW README* \
                            /usr/share/doc/openssh-7.3p1;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
