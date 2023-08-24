#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Window split
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./image/yabai-icon-32px.png
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Toggle window split
# @raycast.author mautjee
# @raycast.authorURL https://raycast.com/mautjee

yabai -m window --toggle split
