#!/usr/bin/env bash

MODE="$1"
DIR="$HOME/.config/hypr/feel-mode"
TARGET="$HOME/.config/hypr/conf-files/look-n-feel.conf"

# Verify if the new mode exists.
if [ ! -f "$DIR/$MODE.conf" ]; then
    notify-send "Hypr-Feel" "Mode '$MODE' does not exist."
    exit 1
fi

# Replacement with new feel mode.
sed -i "s|\(source[[:space:]]*=\)[[:space:]]*.*|\1 $DIR/$MODE.conf|" "$TARGET"

notify-send "Hypr-Feel" "Switched to $MODE mode"