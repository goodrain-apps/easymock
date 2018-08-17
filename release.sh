#!/bin/bash

VERSION="1.6.0"
PROJECT_RELEASE="https://github.com/easy-mock/easy-mock/archive/v${VERSION}.tar.gz"

mkdir .release

wget ${PROJECT_RELEASE}

tar xf v${VERSION}.tar.gz -C .release/
cp Dockerfile .release/easy-mock-${VERSION}/Dockerfile
cd .release/easy-mock-${VERSION}

docker build -t goodrainapps/easymock:v${VERSION} .

cd ../.. 

rm -rf .release
rm -rf ./v${VERSION}.tar.gz