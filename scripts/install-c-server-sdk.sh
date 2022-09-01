#!/usr/bin/env bash

set -evx


MAJOR_VERSION=$1

TMP_DIR=$(mktemp -d -t ci-XXXXXXXXXX)
cd "$TMP_DIR"

git clone "https://github.com/launchdarkly/c-server-sdk.git"

cd c-server-sdk

git checkout cw/test-cmake-change
mkdir build && cd build

cmake -D BUILD_TESTING=OFF -D BUILD_SHARED_LIBS=ON ..
cmake --build .

chmod a+rwx libldserverapi.so
make install

rm -rf "$TMP_DIR"
