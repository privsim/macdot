#!/usr/bin/env bash

# Verified macOS Defaults Commands
# Sources: macos-defaults.com, ss64.com, Apple Support, and verified documentation
# Test with: defaults read <domain> <key> before writing

set -euo pipefail

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${BLUE}Applying verified macOS defaults...${NC}"

# === DOCK ===
echo -e "\n${GREEN}Configuring Dock...${NC}"

# Dock position (left, bottom, right)
defaults write com.apple.dock orientation -string "bottom"

# Icon size
defaults write com.apple.dock tilesize -int 48

# Magnification
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock largesize -int 64

# Autohide
defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock autohide-delay -float 0.5
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Show recents
defaults write com.apple.dock show-recents -bool false

# Minimize animation effect (genie, scale)
defaults write com.apple.dock mineffect -string "genie"

# Show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true

# Make hidden app icons translucent
defaults write com.apple.dock showhidden -bool true
# === FINDER ===
echo -e "\n${GREEN}Configuring Finder...${NC}"

# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Default view style (icnv, clmv, Flwv, Nlsv)
# icnv = Icon View, clmv = Column View, Flwv = Cover Flow View, Nlsv = List View
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Default search scope (SCev = This Mac, SCcf = Current Folder, SCsp = Previous Scope)
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable file extension change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable quit menu item for Finder
defaults write com.apple.finder QuitMenuItem -bool true

# Show full POSIX path in title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Disable .DS_Store file creation on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable .DS_Store file creation on USB volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# === SCREENSHOTS ===
echo -e "\n${GREEN}Configuring Screenshots...${NC}"

# Set location (create directory if needed)
mkdir -p ~/Screenshots
defaults write com.apple.screencapture location -string "~/Screenshots"

# Set format (png, jpg, pdf, tiff)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Include date in filename
defaults write com.apple.screencapture include-date -bool true

# Show thumbnail after taking screenshot
defaults write com.apple.screencapture show-thumbnail -bool true

# === SAFARI ===
echo -e "\n${GREEN}Configuring Safari...${NC}"

# Show full URL
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Show status bar
defaults write com.apple.Safari ShowStatusBar -bool true

# Show Developer menu
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Don't open safe files after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# === MISSION CONTROL ===
echo -e "\n${GREEN}Configuring Mission Control...${NC}"

# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Group windows by application
defaults write com.apple.dock expose-group-apps -bool true
# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# === KEYBOARD ===
echo -e "\n${GREEN}Configuring Keyboard...${NC}"

# Enable key repeat (not just hold for accents)
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set key repeat rate (lower = faster)
defaults write NSGlobalDomain KeyRepeat -int 2

# Set delay until key repeat (lower = shorter)
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# === TRACKPAD ===
echo -e "\n${GREEN}Configuring Trackpad...${NC}"

# Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Three finger drag
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
# === SYSTEM UI ===
echo -e "\n${GREEN}Configuring System UI...${NC}"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# === MENU BAR ===
echo -e "\n${GREEN}Configuring Menu Bar...${NC}"

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -bool true

# Clock format (e.g., "EEE MMM d  h:mm a")
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  h:mm a"

# === TIME MACHINE ===
echo -e "\n${GREEN}Configuring Time Machine...${NC}"

# Don't offer new disks for Time Machine backup
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# === ACTIVITY MONITOR ===
echo -e "\n${GREEN}Configuring Activity Monitor...${NC}"

# Show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0
# === APPLY CHANGES ===
echo -e "\n${YELLOW}Restarting affected applications...${NC}"

# Kill affected applications
for app in "Dock" "Finder" "SystemUIServer" "Safari" "Activity Monitor"; do
    killall "${app}" &> /dev/null || true
done

echo -e "\n${GREEN}✅ Verified defaults applied successfully!${NC}"
echo -e "${YELLOW}Note: Some changes may require a logout or restart to take full effect.${NC}"

# === ADDITIONAL NOTES ===
# To read current values:
#   defaults read <domain> <key>
#
# To delete a setting:
#   defaults delete <domain> <key>
#
# To see all domains:
#   defaults domains
#
# To find settings containing a word:
#   defaults find <word>
#
# Common domains:
#   NSGlobalDomain (or .GlobalPreferences) - System-wide settings
#   com.apple.finder - Finder
#   com.apple.dock - Dock
#   com.apple.Safari - Safari
#   com.apple.screencapture - Screenshots
#   com.apple.desktopservices - Desktop services