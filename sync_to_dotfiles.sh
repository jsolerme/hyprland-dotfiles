#!/usr/bin/env bash

# Copies selected config folders to ~/dotfiles

# === Settings ===
DOTFILES_DIR="$HOME/dotfiles"

# Folders to back up
CONFIGS=(
  "hypr"
  "waybar"
  "kitty"
  "fish"
  "wlogout"
  "btop"
  "fastfetch"
)

# === Script ===
echo -e "\n\e[1;34m>>> Backing up config files to $DOTFILES_DIR\e[0m\n"

# Ensure destination exists
mkdir -p "$DOTFILES_DIR"

# Loop through config directories
for cfg in "${CONFIGS[@]}"; do
  SRC="$HOME/.config/$cfg"
  DEST="$DOTFILES_DIR/$cfg"

  if [ -d "$SRC" ]; then
    echo -e "\e[1;32m✔ Copying $cfg...\e[0m"
    rm -rf "$DEST" 2>/dev/null
    cp -r "$SRC" "$DEST"
  else
    echo -e "\e[1;33m⚠ Skipping $cfg (not found)\e[0m"
  fi
done

echo -e "\n\e[1;36m>>> Done! All selected configs have been copied.\e[0m\n"
