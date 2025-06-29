#!/usr/bin/env bash

# Simple script to apply only the new improvements

set -euo pipefail

echo "🚀 Applying consolidated improvements..."

# Check if running the cleanup first
read -p "Run cleanup of redundant files first? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./cleanup-redundant.sh
fi

# Option to install new brew packages
echo
read -p "Install new essential packages? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing new packages..."
    brew install asdf gnupg pinentry-mac age direnv lazygit mkcert eza procs bottom duf mas
    
    read -p "Install new casks (Warp, OrbStack)? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        brew install --cask warp orbstack
    fi
fi

# Option to verify defaults
echo
read -p "Verify macOS defaults? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./macos/verify-defaults.sh
fi

# Option to apply additional defaults
echo
read -p "Apply additional macOS settings? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ./macos/defaults-additional.sh
fi

echo "✅ Done! Check CONSOLIDATED_IMPROVEMENTS.md for details."