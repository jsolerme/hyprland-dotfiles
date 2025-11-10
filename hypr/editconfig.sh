#!/bin/bash

# --- Colors ---
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
RESET='\033[0m'
BOLD='\033[1m'

# List of config files to choose from
declare -A configs=(
    ["Hyprland"]="~/.config/hypr/hyprland.conf"
    ["Waybar"]="~/.config/waybar/config.jsonc"
    ["Hyprpaper"]="~/.config/hypr/hyprpaper.conf"
    ["Wlogout"]="~/.config/wlogout/layout"
    ["Hyprlock"]="~/.config/hypr/hyprlock.conf"
    ["Config Script"]="~/.config/hypr/editconfig.sh"
)

# --- Header ---
echo -e "${CYAN}${BOLD}╭────────────────────────────╮"
echo -e "│  Config Editor Menu (nano) │"
echo -e "╰────────────────────────────╯${RESET}\n"

# --- Menu ---
PS3=$(echo -e "\n${YELLOW}Select a config to edit:${RESET} ")

select choice in "${!configs[@]}" "Cancel"; do
    if [[ "$choice" == "Cancel" ]]; then
        echo -e "${RED}✗ Exiting...${RESET}"
        exit 0
    elif [[ -n "$choice" ]]; then
        config_path=${configs[$choice]}
        config_path=$(eval echo $config_path)

        echo -e "${CYAN}→ Opening ${MAGENTA}$config_path${RESET}\n"
        if [[ -f "$config_path" ]]; then
            sudo nano "$config_path"
            echo -e "\n${GREEN}✓ Done editing $choice.${RESET}"
        else
            echo -e "${RED}✗ Config not found:${RESET} $config_path"
        fi
        break
    else
        echo -e "${YELLOW}⚠ Invalid choice. Try again.${RESET}"
    fi
done
