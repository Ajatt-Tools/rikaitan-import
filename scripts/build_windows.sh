#!/bin/bash

build_dir="rikaitan-import-windows"
mkdir -p "$build_dir"

CGO_ENABLED=1 CC=/usr/bin/x86_64-w64-mingw32-gcc CXX=/usr/bin/x86_64-w64-mingw32-g++ GOOS=windows OARCH=amd64 go build -o "rikaitan-import-windows" -ldflags '-extldflags "-static"' ./rikaitan
CGO_ENABLED=1 CC=/usr/bin/x86_64-w64-mingw32-gcc CXX=/usr/bin/x86_64-w64-mingw32-g++ GOOS=windows OARCH=amd64 go build -o "rikaitan-import-windows" -ldflags '-extldflags "-static"' ./rikaitan-gtk

zip -r "$build_dir.zip" "$build_dir"
