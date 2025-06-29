#!/usr/bin/env bash

# Cleanup script to remove redundant enhancement files

echo "Cleaning up redundant enhancement files..."

# Files to remove (created during enhancement suggestions)
files_to_remove=(
    "/Users/lclose/mac_provision/macdot/install/Brewfile.enhanced"
    "/Users/lclose/mac_provision/macdot/install/Codefile-modern"
    "/Users/lclose/mac_provision/macdot/install/security-setup.sh"
    "/Users/lclose/mac_provision/macdot/install/setup-enhanced.sh"
    "/Users/lclose/mac_provision/macdot/macos/defaults-enhanced.sh"
    "/Users/lclose/mac_provision/macdot/Makefile.enhanced"
    "/Users/lclose/mac_provision/macdot/.tool-versions"
    "/Users/lclose/mac_provision/macdot/IMPROVEMENTS.md"
    "/Users/lclose/mac_provision/macdot/bin/update-all"
)

for file in "${files_to_remove[@]}"; do
    if [[ -f "$file" ]]; then
        rm -v "$file"
    fi
done

echo "Cleanup complete!"
echo
echo "Retained files:"
echo "- Brewfile.consolidated (cleaned up package list)"
echo "- defaults-additional.sh (non-duplicate macOS settings)"
echo "- verify-defaults.sh (settings verification tool)"