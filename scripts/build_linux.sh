#!/bin/bash

mkdir -p dst
mkdir -p rikaitan-import

go build github.com/Ajatt-Tools/rikaitan-import/tree/master/yomichan
go build github.com/Ajatt-Tools/rikaitan-import/tree/master/yomichan-gtk

mv rikaitan rikaitan-import
mv rikaitan-gtk rikaitan-import

tar czvf dst/rikaitan-import_linux.tar.gz rikaitan-import

rm -rf rikaitan-import
