#!/usr/bin/env bash

set -ev

TMP_DIR=$(mktemp -d -t ci-XXXXXXXXXX)
cd $TMP_DIR

git clone https://github.com/launchdarkly/c-server-sdk.git
cd c-server-sdk
mkdir build && cd build

cmake ..
make

cp libldserverapidynamic.so /usr/lib/libldserverapi.so
chmod a+rwx /usr/lib/libldserverapi.so

rm -rf $TMP_DIR
