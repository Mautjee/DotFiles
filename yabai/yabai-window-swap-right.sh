#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Window swap right
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./image/yabai-icon-32px.png
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Swap focused window with the window on the right
# @raycast.author mautjee
# @raycast.authorURL https://raycast.com/mautjee

yabai -m window --swap east
