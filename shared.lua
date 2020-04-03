local ld = require("launchdarkly-server-sdk")
local os = require("os")

return ld.clientInit({
    key = os.getenv("LD_SDK_KEY")
}, 1000)
