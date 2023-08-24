#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Space reset
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./image/yabai-icon-32px.png
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Reset the current space
# @raycast.author mautjee
# @raycast.authorURL https://raycast.com/mautjee

yabai -m space --balance
