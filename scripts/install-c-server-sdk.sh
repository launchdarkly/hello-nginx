#!/usr/bin/env bash

set -evx


MAJOR_VERSION=$1

TMP_DIR=$(mktemp -d -t ci-XXXXXXXXXX)
cd "$TMP_DIR"

git clone "https://github.com/launchdarkly/c-server-sdk.git"

cd c-server-sdk

VERSION=$(git tag -l "${MAJOR_VERSION}.*" --sort=-v:refname | head -n1)
git checkout "$VERSION"
mkdir build && cd build

cmake -D BUILD_TESTING=OFF -D BUILD_SHARED_LIBS=ON ..
cmake --build .

chmod a+rwx libldserverapi.so
make install

rm -rf "$TMP_DIR"
