#!/bin/bash

CHAPTER_SECTION=35
INSTALL_NAME=stripping

echo ""
echo "### ---------------------------"
echo "###         STRIPPING       ###"
echo "###        CHAPTER 5.$CHAPTER_SECTION     ###"
echo "### Stripping"
echo "### Must be run as \"lfs\" user"
echo ""
echo "### Time estimate:"
echo "### real  0m1.317s"
echo "### user  0m0.488s"
echo "### sys   0m0.700s"
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
check_partitions
is_user lfs
check_tools

echo ""
echo "... Setup building environment"
LOG_FILE=$LFS_BUILD_LOGS_5$CHAPTER_SECTION-$INSTALL_NAME

echo ""
echo "... Installation starts now"
time {

  echo ".... Configuring $SOURCE_FILE_NAME"
  strip --strip-debug /tools/lib/* &> $LOG_FILE-debugs.log
  /usr/bin/strip --strip-unneeded /tools/{,s}bin/* &> $LOG_FILE-unneeded.log
  rm -rf /tools/{,share}/{info,man,doc} &> $LOG_FILE-info-man_doc-files.log

}

echo ""
echo "... Cleaning up $SOURCE_FILE_NAME"
cd $LFS_MOUNT_SOURCES
[ ! $SHOULD_NOT_CLEAN ] && rm -rf $(ls -d  $LFS_MOUNT_SOURCES/$INSTALL_NAME*/)
rm -rf $BUILD_DIRECTORY

get_build_errors_5

echo ""
echo "///// HUMAN REQUIRED \\\\\\\\\\\\\\\\\\\\"
echo "Read carefully the following instructions"
echo ""
echo -e "\a"
read -p "Enter to confirm" -n 1 -r
echo ""

echo ""
echo "######### END OF CHAPTER 5.$CHAPTER_SECTION ########"
echo "### Warning Counter: $WARNINGS_COUNTER"
echo "### Error Counter: $ERRORS_COUNTER"
echo "///// HUMAN REQUIRED \\\\\\\\\\\\\\\\\\\\"
echo "### Please run the next step:"
echo "### exit until you are back on the git repo lfs-7.8"
echo "### ./5.36-root_changing-ownership.sh"
echo ""

if [ $ERRORS_COUNTER -ne 0 ]
then
  exit 6
else
  exit 0
fi
