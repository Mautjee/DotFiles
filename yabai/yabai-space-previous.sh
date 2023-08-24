#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Previous space
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./image/yabai-icon-32px.png
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Move to previous space
# @raycast.author mautjee
# @raycast.authorURL https://raycast.com/mautjee

yabai -m space --focus prev
