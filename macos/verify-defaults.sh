#!/usr/bin/env bash

# macOS Settings Verification Script
# This script tests macOS defaults commands before applying them

set -euo pipefail

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Test function
test_default() {
    local domain="$1"
    local key="$2"
    local expected_type="${3:-}"
    
    if defaults read "$domain" "$key" &>/dev/null; then
        echo -e "${GREEN}✓${NC} $domain $key exists"
        return 0
    else
        echo -e "${RED}✗${NC} $domain $key not found"
        return 1
    fi
}

# Verify common macOS defaults
echo "Verifying macOS defaults commands..."

# System
test_default "NSGlobalDomain" "AppleLanguages" || true
test_default "NSGlobalDomain" "AppleShowAllExtensions" || true
test_default "NSGlobalDomain" "NSAutomaticWindowAnimationsEnabled" || true

# Finder
test_default "com.apple.finder" "ShowStatusBar" || true
test_default "com.apple.finder" "ShowPathbar" || true
test_default "com.apple.finder" "FXPreferredViewStyle" || true

# Dock
test_default "com.apple.dock" "autohide" || true
test_default "com.apple.dock" "show-recents" || true
test_default "com.apple.dock" "tilesize" || true

echo -e "\n${YELLOW}Note: Some settings may not exist until set for the first time${NC}"