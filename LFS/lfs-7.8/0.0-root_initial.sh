#!/bin/bash
echo ""
echo "### ---------------------------"
echo "### START OF INITIALIZATION ###"
echo "### Checking the host system"
echo "### Must be run as \"root\""
echo "### ---------------------------"

echo ""
echo "... Loading commun functions"
if [ ! -f ./script-all_commun-functions.sh ]
then
    echo "!! Fatal Error 1: './script-all_commun-functions.sh' not found."
    exit 1
fi
source ./script-all_commun-functions.sh

echo ""
echo "... Validating the environment"
is_user root
if [ $( readlink -f /bin/sh ) != "/bin/bash" ]
then
    echo "!! Fatal Error 3: /bin/sh is not symlinked to /bin/bash"
    echo "sudo rm /bin/sh && sudo ln -s /bin/bash /bin/sh"
    exit 3
fi

echo ""
echo "... Self check"
self_check

echo ""
echo "... Validating required software versions"
sh script-root_version-check.sh
echo ""
echo "... Validating required libraries"
sh script-root_library-check.sh
echo "--> Either all three (libgmp.la, libmpfr.la, libmpc.la) should be present or absent, but not only one or two. If the problem exists on your system, either rename or delete the .la files or install the appropriate missing package."
echo ""
# echo "... Updating environment"
# rm -f /etc/motd
# mv motd /etc/
# echo "" >> /etc/motd
# echo "Host Machine" >> /etc/motd
# echo "Scripts used for building the LFS: https://github.com/Rocla/lfs-7.8" >> /etc/motd
# echo ""

echo ""
echo "///// HUMAN REQUIRED \\\\\\\\\\\\\\\\\\\\"
echo "### Please follow the instructions below:"
echo "### Verify that the versions match"
echo "### Also cross check with the book 7.8"
echo ""
echo "- Bash-3.2"
echo "- >= Binutils-2.17 -> Binutils-2.25.1 (Versions greater than 2.25.1 are not recommended as they have not been tested)"
echo "- >= Bison-2.3 (/usr/bin/yacc should be a link to bison or small script that executes bison)"
echo "- >= Bzip2-1.0.4"
echo "- >= Coreutils-6.9"
echo "- >= Diffutils-2.8.1"
echo "- >= Findutils-4.2.31"
echo "- >= Gawk-4.0.1 (/usr/bin/awk should be a link to gawk)"
echo "- >= GCC-4.1.2 -> GCC-5.2.0 including the C++ compiler, g++ (Versions greater than 5.2.0 are not recommended as they have not been tested)"
echo "- >= Glibc-2.11 -> Glibc-2.22 (Versions greater than 2.22 are not recommended as they have not been tested)"
echo "- >= Grep-2.5.1a"
echo "- >= Gzip-1.3.12"
echo "- >= Linux Kernel-2.6.32"
echo "- >= M4-1.4.10"
echo "- >= Make-3.81"
echo "- >= Patch-2.5.4"
echo "- >= Perl-5.8.8"
echo "- >= Sed-4.1.5"
echo "- >= Tar-1.22"
echo "- >= Texinfo-4.7"
echo "- >= Xz-5.0.0"
echo ""

echo -e "\a"
read -p "Enter to confirm" -n 1 -r

echo ""
echo "####### END OF INITIALIZATION #######"
echo "///// HUMAN REQUIRED \\\\\\\\\\\\\\\\\\\\"
echo "### Please run the next step:"
echo "### ./2.3-root_create-files-system-on-partitions.sh"
echo ""

exit 0
