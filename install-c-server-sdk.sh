#!/usr/bin/env bash

set -ev

TMP_DIR=$(mktemp -d -t ci-XXXXXXXXXX)
cd $TMP_DIR

git clone https://github.com/launchdarkly/c-server-sdk.git
cd c-server-sdk
mkdir build && cd build

cmake -D BUILD_TESTING=OFF -D BUILD_SHARED_LIBS=ON ..
cmake --build .

chmod a+rwx libldserverapi.so
make install

rm -rf $TMP_DIR
