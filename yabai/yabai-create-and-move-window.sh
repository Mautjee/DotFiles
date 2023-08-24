#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Create space and move window
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./image/yabai-icon-32px.png
# @raycast.packageName Yabai

# Documentation:
# @raycast.description Creates a new space and moves the focused window to the created space
# @raycast.author mautjee
# @raycast.authorURL https://raycast.com/mautjee

yabai -m window --space 3;
yabai -m space --focus 3;
