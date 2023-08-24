#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Window focus up
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./image/yabai-icon-32px.png
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Move focused to the window above
# @raycast.author mautjee
# @raycast.authorURL https://raycast.com/mautjee

yabai -m window --focus north
