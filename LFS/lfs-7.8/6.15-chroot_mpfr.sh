#!/bin/bash

CHAPTER_SECTION=15
INSTALL_NAME=mpfr

echo ""
echo "### ---------------------------"
echo "###             MPFR        ###"
echo "###        CHAPTER 6.$CHAPTER_SECTION      ###"
echo "### MPFR-3.1.3"
echo "### Must be run as \"chroot\" user"
echo ""
echo "### Time estimate:"
echo "### real  1m52.472s"
echo "### user  1m26.453s"
echo "### sys   0m7.604s"
echo "### ---------------------------"

echo ""
echo "... Loading commun functions and variables"
if [ ! -f ./script-all_commun-functions.sh ]
then
  echo "!! Fatal Error 1: './script-all_commun-functions.sh' not found."
  exit 1
fi
source ./script-all_commun-functions.sh

if [ ! -f ./script-all_commun-variables.sh ]
then
  echo "!! Fatal Error 1: './script-all_commun-variables.sh' not found."
  exit 1
fi
source ./script-all_commun-variables.sh

echo ""
echo "... Validating the environment"
is_user root
check_chroot

echo ""
echo "... Setup building environment"
LOG_FILE=$LFS_BUILD_LOGS_6$CHAPTER_SECTION-$INSTALL_NAME
cd /sources
check_tarball_uniqueness
extract_tarball
cd $(ls -d /sources/$INSTALL_NAME*/)

echo ""
echo "... Installation starts now"
time {

  echo ".... Pre-Configuring $SOURCE_FILE_NAME"
  patch -Np1 -i ../mpfr-3.1.3-upstream_fixes-1.patch &> $LOG_FILE-patch.log

  echo ".... Configuring $SOURCE_FILE_NAME"
  ./configure                          \
    --prefix=/usr                       \
    --disable-static                    \
    --enable-thread-safe                \
    --docdir=/usr/share/doc/mpfr-3.1.3 \
    &> $LOG_FILE-configure.log

  echo ".... Making $SOURCE_FILE_NAME"
  make $PROCESSOR_CORES &> $LOG_FILE-make.log

  echo ".... Making HTML $SOURCE_FILE_NAME"
  make html $PROCESSOR_CORES &> $LOG_FILE-make-html.log

  echo ".... Make Checking $SOURCE_FILE_NAME"
  make check $PROCESSOR_CORES &> $LOG_FILE-make-check.log

  echo ".... Installing $SOURCE_FILE_NAME"
  make install $PROCESSOR_CORES &> $LOG_FILE-make-install.log

  echo ".... Installing HTML $SOURCE_FILE_NAME"
  make install-html $PROCESSOR_CORES &> $LOG_FILE-make-install-html.log

}

echo ""
echo "... Cleaning up $SOURCE_FILE_NAME"
cd /sources
[ ! $SHOULD_NOT_CLEAN ] && rm -rf $(ls -d /sources/$INSTALL_NAME*/)
get_build_errors_6

echo ""
echo "######### END OF CHAPTER 6.$CHAPTER_SECTION ########"
echo "///// HUMAN REQUIRED \\\\\\\\\\\\\\\\\\\\"
echo "### Please run the next step:"
echo "### ./6.16-chroot_mpc.sh"
echo ""

exit
