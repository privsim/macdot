#!/usr/bin/env bash

# Additional macOS Settings (Non-duplicate)
# Only settings not already in defaults.sh

set -euo pipefail

echo "Applying additional macOS optimizations..."

# === PERFORMANCE ===
# Speed up window resize animations (different from NSWindowResizeTime)
defaults write -g NSToolbarTitleViewRolloverDelay -float 0

# Disable App Nap system-wide for better performance
defaults write NSGlobalDomain NSAppSleepDisabled -bool YES

# === DEVELOPER TOOLS ===
# Show build times in Xcode
defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES

# Enable additional debug menus
defaults write com.apple.appstore ShowDebugMenu -bool true
defaults write com.apple.addressbook ABShowDebugMenu -bool true

# === FINDER ADDITIONS ===
# Show absolute path in Finder title
defaults write com.apple.finder ShowPathbar -bool true

# Default to column view in Finder
defaults write com.apple.Finder FXPreferredViewStyle clmv

# === SECURITY ===
# Require password immediately after sleep (more strict than defaults.sh)
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# === PRODUCTIVITY ===
# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0.5

# Show percentage in battery icon (if not already set)
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# === SAFARI DEVELOPER ===
# Enable Safari's debug menu (if not already enabled)
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Additional settings applied successfully!"