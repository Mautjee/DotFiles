#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Window float
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./image/yabai-icon-32px.png
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Creates a floating window in the middle of the screen
# @raycast.author mautjee
# @raycast.authorURL https://raycast.com/mautjee

yabai -m window --toggle float --grid 4:4:1:1:2:2
