#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Move window to space 10
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./image/yabai-icon-32px.png
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Move window to space 10
# @raycast.author mautjee
# @raycast.authorURL https://raycast.com/mautjee

yabai -m window --space 10;
yabai -m space --focus 10;