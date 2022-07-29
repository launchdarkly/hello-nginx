# LaunchDarkly Lua server-side SDK NGINX example

We've built a minimal dockerized example of using the Lua SDK with [OpenResty NGINX framework](https://openresty-reference.readthedocs.io/en/latest/Lua_Nginx_API/). For more comprehensive instructions, you can visit the [Using the Lua SDK with NGINX](https://docs.launchdarkly.com/guides/sdk/nginx) or the [Lua reference guide](https://docs.launchdarkly.com/sdk/server-side/lua).

## Build instructions

1. On the command line, build the image from this directory with `docker build -t launchdarkly-nginx .`.
2. 2. Run the demo with `docker run --rm -p 8123:80 -e LD_SDK_KEY="" -e LD_FLAG_KEY="" launchdarkly-nginx`. Set the environment variables LD_SDK_KEY to your LaunchDarkly SDK key, and, if there is an existing boolean feature flag in your LaunchDarkly project that you want to evaluate, set LD_FLAG_KEY to the flag key.

```
docker run --rm -p 8123:80 -e LD_SDK_KEY="1234567890abcdef" -e LD_FLAG_KEY="my-boolean-flag" launchdarkly-nginx
```

3. Open `localhost:8123` in your browser. Toggle the flag on to see a change in the page.

You should receive the message ”Feature flag is <true/false> for this user”.
