#!/bin/bash

build_dir="rikaitan-import-linux"
mkdir -p "$build_dir"

go build -o "rikaitan-import-linux" ./rikaitan
go build -o "rikaitan-import-linux" ./rikaitan-gtk

zip -r "$build_dir.zip" "$build_dir"
