#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Window swap up
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./image/yabai-icon-32px.png
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Swaps the window above
# @raycast.author mautjee
# @raycast.authorURL https://raycast.com/mautjee

yabai -m window --swap north
