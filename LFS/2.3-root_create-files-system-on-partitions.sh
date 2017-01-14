#!/bin/bash
echo ""
echo "### ---------------------------------------"
echo "###  START OF NEW PARTITION PREPARATION ###"
echo "###              CHAPTER 2.3            ###"
echo "### Creating a File System on the Partition"
echo "### Must be run as \"root\""
echo "### ---------------------------------------"

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
if [ $( readlink -f /bin/sh ) != "/bin/bash" ]
then
  echo "!! Fatal Error 3: /bin/sh is not symlinked to /bin/bash"
  exit 3
fi

echo ""
echo "... Verifying lfs health"
if id -u $LFS_USERNAME >/dev/null 2>&1
then
  echo "///// HUMAN REQUIRED \\\\\\\\\\\\\\\\\\\\"
  echo "### We have dectected that the lfs default user account exists."
  echo "### This user is used to build LFS."
  echo "### Do you wish to start from scratch a new LFS build?"
  echo "### We would delete the user, its group, backuped tools and logs"
  echo ""
  echo -e "\a"
  read -p "Enter [y] to start from scratch" -n 1 -r
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]];
  then
    userdel -r $LFS_USERNAME
    groupdel $LFS_GROUPNAME
    rm -rf $LFS_ROOT_BACKUP_FOLDER
    rm -rf $LFS_ROOT_BACKUP_LOGS/*build-logs
  fi
fi

echo ""
echo "... Validating SDB directory"
if [ -b "$LFS_PARTITION_SWAP" ]
then
  cat <<EOF | fdisk $LFS_HDD
d
1
d
w
EOF
  echo ""
  echo "!! Info: $LFS_HDD has been erased"
fi

cat <<EOF | fdisk $LFS_HDD
n
p
1

+2G
n
p
2


t
1
82
w
EOF
echo ""
echo "!! Info: $LFS_HDD has been partitioned"
echo ""
lsblk
echo ""
echo "///// HUMAN REQUIRED \\\\\\\\\\\\\\\\\\\\"
echo "### Please note that $LFS_PARTITION_ROOT and $LFS_PARTITION_SWAP will be formated."
echo -e "\a"
read -p "Enter [y] to confirm" -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 0
fi

echo ""
echo  "... Formatting Root Partition On $LFS_PARTITION_ROOT"
mkfs -t ext4 $LFS_PARTITION_ROOT

echo ""
echo  "... Formatting Swap Drive On $LFS_PARTITION_SWAP"
mkswap $LFS_PARTITION_SWAP

echo ""
echo "####### END OF CHAPTER 2.3 #######"
echo "///// HUMAN REQUIRED \\\\\\\\\\\\\\\\\\\\"
echo "### Please run the next step:"
echo "### ./2.4-root_set-lfs-variable.sh"
echo ""

exit 0
