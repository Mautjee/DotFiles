#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Window native fullscreen
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./image/yabai-icon-32px.png
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Puts the focused window in native full screen
# @raycast.author mautjee
# @raycast.authorURL https://raycast.com/mautjee

yabai -m window --toggle native-fullscreen
