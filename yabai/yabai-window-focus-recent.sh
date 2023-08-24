#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Window focus recent
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./image/yabai-icon-32px.png
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Move focus to the most recent window
# @raycast.author mautjee
# @raycast.authorURL https://raycast.com/mautjee

yabai -m space --focus recent
