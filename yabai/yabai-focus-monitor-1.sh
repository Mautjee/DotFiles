#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Change focus to monitor 1
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./image/yabai-icon-32px.png
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Changes the focus to monitor 1
# @raycast.author mautjee
# @raycast.authorURL https://raycast.com/mautjee

yabai -m display --focus 1;
