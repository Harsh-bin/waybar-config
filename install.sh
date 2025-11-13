#!/bin/bash
WAYBAR_CONFIG_DIR="$HOME/.config/waybar"
WOFI_CONFIG_DIR="$HOME/.config/wofi"
SWAYLOCK_CONFIG_DIR="$HOME/.config/swaylock"

echo "=== Running Installer ==="
echo ""

sleep 0.5
# Backup existing config if it exists
if [ -d "$WAYBAR_CONFIG_DIR" ]; then
    echo "[!] Found existing waybar config at $WAYBAR_CONFIG_DIR"
    echo "[*] Backing up to waybar.old..."
    mv "$WAYBAR_CONFIG_DIR" "$WAYBAR_CONFIG_DIR.old"
fi
sleep 0.5

if [ -d "$WOFI_CONFIG_DIR" ]; then
    echo "[!] Found existing wofi config at $WOFI_CONFIG_DIR"
    echo "[*] Backing up to wofi.old..."
    mv "$WOFI_CONFIG_DIR" "$WOFI_CONFIG_DIR.old"
fi
sleep 0.5

if [ -d "$SWAYLOCK_CONFIG_DIR" ]; then
    echo "[!] Found existing swaylock config at $SWAYLOCK_CONFIG_DIR"
    echo "[*] Backing up to swaylock.old..."
    mv "$SWAYLOCK_CONFIG_DIR" "$SWAYLOCK_CONFIG_DIR.old"
fi

sleep 0.5
echo "[*] Creating waybar config directory..."
mkdir -p "$WAYBAR_CONFIG_DIR"
cp -r config.jsonc style.css scripts styles "$WAYBAR_CONFIG_DIR/"
sleep 0.5
echo "[*] Copying wofi configuration..."
cp -r wofi "$HOME/.config/"
sleep 0.5
echo "[*] Copying swaylock configuration..."
cp -r swaylock "$HOME/.config/"

sleep 0.5
# Make scripts executable
echo "[*] Setting execute permissions on scripts..."
chmod +x "$WAYBAR_CONFIG_DIR/scripts/lock.sh"
chmod +x "$WAYBAR_CONFIG_DIR/scripts/power.sh"
chmod +x "$WAYBAR_CONFIG_DIR/scripts/theme.sh"
chmod +x "$WAYBAR_CONFIG_DIR/scripts/countdown/countdown.sh"
chmod +x "$WAYBAR_CONFIG_DIR/scripts/todo/todo.sh"
chmod +x "$WAYBAR_CONFIG_DIR/scripts/todo/todo_tui.sh"

echo ""
sleep 0.5
echo "=== Installation Complete ==="

