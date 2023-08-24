#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Window focus right
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./image/yabai-icon-32px.png
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Move focus to the window on the right
# @raycast.author mautjee
# @raycast.authorURL https://raycast.com/mautjee

yabai -m window --focus east
