#!/bin/bash

# --- Configuration ---
SHUTDOWN_CMD="systemctl poweroff"
REBOOT_CMD="systemctl reboot"
LOGOUT_CMD="labwc --exit"  #modify this command based on your DE

# --- Function to Check Dependencies ---
check_dependencies() {
    if ! command -v zenity &> /dev/null; then
        echo "Error: zenity is not installed. Please install it."
        notify-send "Error: zenity is not installed. Please install it."
        exit 1
    fi
}

# Function for Shutdown Confirmation Window
do_shutdown() {
    zenity --question \
        --title="System Shutdown Confirmation" \
        --text="Are you sure you want to SHUTDOWN the system?" \
        --ok-label="Shutdown" \
        --cancel-label="Cancel"

    if [ $? -eq 0 ]; then
        echo "Shutting down the system..."
        $SHUTDOWN_CMD
    else
        echo "Shutdown cancelled."
    fi
}

# Function for Reboot Confirmation Window
do_reboot() {
    zenity --question \
        --title="System Reboot Confirmation" \
        --text="Are you sure you want to REBOOT the system?" \
        --ok-label="Reboot" \
        --cancel-label="Cancel"

    if [ $? -eq 0 ]; then
        echo "Rebooting the system..."
        $REBOOT_CMD
    else
        echo "Reboot cancelled."
    fi
}

# Function for exiting session
do_logout() {
    zenity --question \
        --title="Session Logout Confirmation" \
        --text="Do you want to exit session?" \
        --ok-label="Exit" \
        --cancel-label="Cancel"

    if [ $? -eq 0 ]; then
        echo "Exiting labwc session..."
        $LOGOUT_CMD
    else
        echo "Session not exit."
    fi
}

# --- Main Script Execution ---

check_dependencies

case "$1" in
    --shutdown)
        do_shutdown
        ;;
    --reboot)
        do_reboot
        ;;
    --logout)
        do_logout
        ;;    
    *)
        echo "Usage: $0 {--shutdown | --reboot | --logout}"
        echo
        echo "Example: $0 --shutdown"
        exit 1
        ;;
esac

exit 0