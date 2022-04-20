#!/usr/bin/env bash

set -evx

MAJOR_VERSION=$1

TMP_DIR=$(mktemp -d -t ci-XXXXXXXXXX)
cd "$TMP_DIR"

git clone "https://github.com/launchdarkly/lua-server-sdk.git"

cd lua-server-sdk

VERSION=$(git tag -l "${MAJOR_VERSION}.*" --sort=-v:refname | head -n1)
git checkout "$VERSION"

luarocks make launchdarkly-server-sdk-1.0-0.rockspec && \
cp launchdarkly_server_sdk.so /usr/local/openresty/lualib/

rm -rf "$TMP_DIR"
