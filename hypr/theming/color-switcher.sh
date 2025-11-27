#!/bin/bash

# PATHS
THEME_DIR="$HOME/.config/hypr/theming/preset-colors"
ACTIVE_THEME_FILE="$HOME/.config/hypr/theming/theme.conf"
UPDATE_SCRIPT="$HOME/.config/hypr/theming/apply-colors.sh" 

# Select the theme using wofi
CHOICE=$(ls "$THEME_DIR" | wofi --dmenu "Select Theme" -i)

# Exit if nothing selected
if [ -z "$CHOICE" ]; then
    exit 0
fi

# Overwrite the active file with the chosen theme
cp "$THEME_DIR/$CHOICE" "$ACTIVE_THEME_FILE"

# Run existing script to apply changes
if [ -x "$UPDATE_SCRIPT" ]; then
    "$UPDATE_SCRIPT"
else
    echo "Error: Update script not found or not executable."
fi