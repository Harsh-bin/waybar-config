#!/bin/bash

# Config
CONFIG="$HOME/.config/swaylock/swaylock.config"
WALLPAPER_DIR="/usr/share/backgrounds/Live-wallpaper/" # change this to your wallpaper directory
TEMP_FILE="/tmp/swaylock.tmp"

# Verify config exists
[ ! -f "$CONFIG" ] && { echo "Error: Config file not found" >&2; exit 1; }

CURRENT=$(grep -P '^image\s*=\s*\S+' "$CONFIG" | cut -d= -f2 | tr -d ' ')
NEW=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \) | shuf -n 1)
[ -z "$NEW" ] && { echo "Error: No wallpapers found" >&2; exit 1; }

# Create temp config with new background
awk -v new_bg="$NEW" '
    /^image\s*=/ { $0="image=" new_bg }
    { print }
' "$CONFIG" > "$TEMP_FILE" && mv "$TEMP_FILE" "$CONFIG"

UPDATED=$(grep -P '^image\s*=\s*\S+' "$CONFIG" | cut -d= -f2 | tr -d ' ')
[ "$UPDATED" != "$(echo "$NEW" | tr -d ' ')" ] && { echo "Error: Failed to update config" >&2; exit 1; }

echo "Successfully changed wallpaper:"
echo "From: ${CURRENT:-None}"
echo "To:   $NEW"
swaylock --config ~/.config/swaylock/swaylock.config 

