#!/bin/bash

# Copyright (c) 2020 VMware, Inc.  All rights reserved.

if [ "$USER" != "root" ] ; then
  echo "Please re-run $0 as root, exiting."
  exit 1
fi

echo "Uninstalling resxtop"

rm -rf EULA
rm -rf open_source_licenses.txt

rm -rf /usr/bin/resxtop

rm -rf /usr/lib/vmware/resxtop

rm -rf /usr/share/man/man1/esxtop*
mandb &> /dev/null
