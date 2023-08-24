#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Move window to previous display
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./image/yabai-icon-32px.png
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Moves the focused window to the previous display
# @raycast.author mautjee
# @raycast.authorURL https://raycast.com/mautjee

yabai -m window --space next; yabai -m space --focus prev;
