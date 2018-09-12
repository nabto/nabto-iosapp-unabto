# Simple example of embedding uNabto device in iOS app

This example embeds the uNabto echo stream app (`unabto/apps/stream_echo`) in an iOS app.

Steps to build:

1. adjust `unabto_ios_lib/install.sh` to point to Nabto iOS env file (simple to get rid of this dependency if ever necessary)
2. checkout unabto git repo in `unabto_ios_lib`
3. run `install.sh` in `unabto_ios_lib`
3. open xcode project and build app