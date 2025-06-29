#!/usr/bin/env bash

# macOS Defaults Test Script
# This script reads current values for common defaults settings

set -euo pipefail

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Function to safely read defaults
read_default() {
    local domain="$1"
    local key="$2"
    local description="$3"
    
    if value=$(defaults read "$domain" "$key" 2>/dev/null); then
        echo -e "${GREEN}✓${NC} $description: $value"
    else
        echo -e "${RED}✗${NC} $description: not set"
    fi
}

echo -e "${BLUE}=== macOS Defaults Current Values ===${NC}\n"

# Dock Settings
echo -e "${YELLOW}DOCK:${NC}"
read_default "com.apple.dock" "orientation" "Dock position"
read_default "com.apple.dock" "tilesize" "Icon size"
read_default "com.apple.dock" "autohide" "Autohide"
read_default "com.apple.dock" "show-recents" "Show recent apps"
read_default "com.apple.dock" "mineffect" "Minimize effect"

echo

# Finder Settings
echo -e "${YELLOW}FINDER:${NC}"
read_default "NSGlobalDomain" "AppleShowAllExtensions" "Show all file extensions"
read_default "com.apple.finder" "AppleShowAllFiles" "Show hidden files"
read_default "com.apple.finder" "ShowPathbar" "Show path bar"
read_default "com.apple.finder" "ShowStatusBar" "Show status bar"
read_default "com.apple.finder" "FXPreferredViewStyle" "Default view style"

echo
# Screenshot Settings
echo -e "${YELLOW}SCREENSHOTS:${NC}"
read_default "com.apple.screencapture" "location" "Save location"
read_default "com.apple.screencapture" "type" "File format"
read_default "com.apple.screencapture" "disable-shadow" "Disable shadow"

echo

# Keyboard Settings
echo -e "${YELLOW}KEYBOARD:${NC}"
read_default "NSGlobalDomain" "ApplePressAndHoldEnabled" "Press and hold for accents"
read_default "NSGlobalDomain" "KeyRepeat" "Key repeat rate"
read_default "NSGlobalDomain" "InitialKeyRepeat" "Initial key repeat delay"
read_default "NSGlobalDomain" "NSAutomaticSpellingCorrectionEnabled" "Auto-correct"

echo

# System UI Settings
echo -e "${YELLOW}SYSTEM UI:${NC}"
read_default "NSGlobalDomain" "NSNavPanelExpandedStateForSaveMode" "Expand save panel"
read_default "NSGlobalDomain" "NSDocumentSaveNewDocumentsToCloud" "Save to iCloud by default"
read_default "com.apple.menuextra.battery" "ShowPercent" "Battery percentage"

echo

# Mission Control
echo -e "${YELLOW}MISSION CONTROL:${NC}"
read_default "com.apple.dock" "mru-spaces" "Auto-rearrange spaces"
read_default "com.apple.dock" "expose-group-apps" "Group windows by app"

echo -e "\n${BLUE}=== Domain Information ===${NC}"
echo -e "${YELLOW}To see all domains:${NC} defaults domains"
echo -e "${YELLOW}To see all keys in a domain:${NC} defaults read <domain>"
echo -e "${YELLOW}To search for settings:${NC} defaults find <keyword>"