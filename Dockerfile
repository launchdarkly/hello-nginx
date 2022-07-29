FROM openresty/openresty:xenial

RUN apt-get update && apt-get install -y build-essential git cmake \
    libpcre3-dev libcurl4-openssl-dev luarocks

RUN mkdir -p /usr/local/openresty/nginx/scripts
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY shared.lua /usr/local/openresty/nginx/scripts/

ENV C_SERVER_MAJOR_VERSION=2
ENV LUA_SERVER_MAJOR_VERSION=1


ADD scripts .
RUN ./install-c-server-sdk.sh ${C_SERVER_MAJOR_VERSION}
RUN ./install-lua-server-sdk.sh ${LUA_SERVER_MAJOR_VERSION}
