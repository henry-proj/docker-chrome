#!/bin/bash

CHROME=https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

wget $CHROME

VERSION=`dpkg-deb -I google-chrome-stable_current_amd64.deb | awk '/Version/{print $2}'`

docker build -t sassv/chrome:$VERSION .

docker build -t sassv/chrome:latest .

docker push sassv/chrome:$VERSION
docker push sassv/chrome:latest

find ./ -type f -name "*.deb" | xargs rm -f
