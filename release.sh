#!/bin/bash

VERSION="v1.6.0"
PROJECT_RELEASE="https://github.com/easy-mock/easy-mock/archive/${VERSION}.tar.gz"

mkdir .release

wget ${PROJECT_RELEASE}

tar xf ${VERSION}.tar.gz -C .release/ --strip-components 1
cp Dockerfile .release/Dockerfile
cd .release/

docker build -t goodrainapps/easymock:${VERSION} .

cd .. 

rm -rf .release
rm -rf ./${VERSION}.tar.gz