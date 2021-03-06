FROM openresty/openresty:xenial

RUN apt-get update && apt-get install -y build-essential git cmake \
    libpcre3-dev libcurl4-openssl-dev libcurl3 luarocks

COPY install-c-server-sdk.sh .
RUN ./install-c-server-sdk.sh

RUN mkdir -p /usr/local/openresty/nginx/scripts
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY shared.lua /usr/local/openresty/nginx/scripts/

ADD https://github.com/launchdarkly/lua-server-sdk/archive/1.0.0-beta.3.zip \
    /tmp/lua-server-sdk/sdk.zip

RUN cd /tmp/lua-server-sdk/ && \
    unzip sdk.zip && \
    cd lua-server-sdk-1.0.0-beta.3 && \
    luarocks make launchdarkly-server-sdk-1.0-0.rockspec && \
    cp launchdarkly_server_sdk.so /usr/local/openresty/lualib/
