#!/bin/bash

# Copyright (c) 2020 VMware, Inc.  All rights reserved.

if [ "$USER" != "root" ] ; then
  echo "Please re-run $0 as root, exiting."
  exit 1
fi

echo "Installing resxtop"

if [ -f /usr/bin/resxtop ]; then
   echo "resxtop is already installed. Please uninstall it using the uninstall.sh."
   exit 2
fi

more "EULA"

read -p "Do you accept the EULA? (y/n) " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
   cp -rf resxtop /usr/bin

   mkdir -p /usr/lib/vmware/resxtop
   cp -rf lib64/* /usr/lib/vmware/resxtop
   echo "Copying libraries to /usr/lib/vmware/resxtop. Please add that folder to LD_LIBRARY_PATH"

   cp -rf doc/esxtop* /usr/share/man/man1
   mandb &> /dev/null
else
   echo "EULA was NOT accepted, exiting."
   exit 3
fi
