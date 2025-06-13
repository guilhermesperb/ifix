# Should be used with root user
if [ "$EUID" -ne 0 ]; then
  echo "Please, run this script as root"
  exit 1
fi

if [ -z "$LFS" ]; then
  echo "Variable \$LFS is not defined. Define it with: 'export LFS=/mnt/lfs'"
  exit 1
fi

groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

echo "Set a password for the 'lfs' user:"
passwd lfs

chown -v lfs $LFS/{usr{,/*},var,etc,tools}

if [ "$(uname -m)" == "x86_64" ]; then
  chown -v lfs $LFS/lib64
fi

echo ""
echo "User 'lfs' create and permissions adjusted"
echo "Switch to the user with: 'su - lfs'"
echo ""
