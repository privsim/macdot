#!/usr/bin/env bash

# Quick Reference: Most Common macOS Defaults

# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Dock on left side
defaults write com.apple.dock orientation -string "left"

# Smaller dock icons
defaults write com.apple.dock tilesize -int 36

# Faster key repeat
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Screenshots to ~/Screenshots
mkdir -p ~/Screenshots
defaults write com.apple.screencapture location -string "~/Screenshots"

# No screenshot shadows
defaults write com.apple.screencapture disable-shadow -bool true

# After making changes, restart affected apps:
killall Dock
killall Finder
killall SystemUIServer