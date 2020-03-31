# LaunchDarkly Lua NGINX integration

This is a minimal dockerized example of using the SDK with the OpenResty NGINX framework.

## Usage

Build the image from this directory with: `docker build -t launchdarkly-nginx .`.

Run the demo with `docker run --rm -p 8123:80 -e LD_SDK_KEY="" -e LD_FLAG_KEY="" launchdarkly-nginx`. The environment variable `LD_SDK_KEY` is your projects SDK key, and `LD_FLAG_KEY` is the key for a boolean flag in that project.

Open `localhost:8123` in your browser and try flipping the flag to see a change in the page.
