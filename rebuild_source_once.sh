#!/bin/bash

# 该模块用于重新构造cydia源

if [ x$1 == x ]; then
    echo Usage: $0 [debpath] 
    exit 0
fi

debpath=$1
dpkg-scanpackages $debpath > $debpath/Packages
rm -f $debpath/Packages.gz $debpath/Packages.bz2 $debpath/Packages.xz
gzip -k $debpath/Packages 
bzip2 -z -k $debpath/Packages
xz -z -k $debpath/Packages 
