#!/bin/bash

SIM_ONLY=1

set -e

ENV_FILE=../../../svn/trunk/nabto/build/unix/env-iphone.sh 

if [ ! -f $ENV_FILE ]; then
    echo "Adjust ENV_FILE to point to nabto env-iphone.sh"
    exit 1
fi

if [ ! -f ./unabto/TESTING.md ]; then
    echo "Please checkout unabto in `pwd`"
    exit 1
fi    

rm -rf build

export IPHONEOS_DEPLOYMENT_TARGET=8.0

function install() {
    sdk=$1
    arch=$2
    export APPLE_SDK=$sdk
    export APPLE_ARCH=$arch
    source $ENV_FILE
    rm -rf build-ios-$arch
    mkdir build-ios-$arch
    cd build-ios-$arch
    cmake -GNinja -DIOS=1 -DCMAKE_SYSTEM_NAME="GENERIC" ..
    ninja
    cd ..
}

if [ -z SIM_ONLY ]; then
    for arch in "armv7" "armv7s" "arm64"; do
        install iphoneos $arch
    done
fi

install iphonesimulator x86_64

mkdir -p build-lipo
lipo -create build-ios-*/libunabto_ios_lib.a -output build-lipo/libunabto_ios_lib.a
