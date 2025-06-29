# Verified macOS Defaults Configuration

## Overview

This directory contains verified macOS defaults commands that have been tested and documented to work. Unlike many dotfiles repos that contain outdated or non-functional defaults commands, these have been verified against:

- Official Apple documentation
- macos-defaults.com (curated collection of working defaults)
- SS64.com macOS command reference
- Recent testing on macOS Sequoia and Ventura

## Files

### `defaults-verified.sh`
The main configuration script with verified working defaults commands, organized by category:
- Dock configuration
- Finder settings
- Screenshot preferences
- Safari developer settings
- Mission Control
- Keyboard behavior
- Trackpad settings
- System UI preferences
- Menu bar
- Time Machine
- Activity Monitor

### `test-defaults.sh`
A utility script to check current values of common defaults settings. Run this before and after applying defaults to see what changed.

### `verify-defaults.sh`
Tests if specific defaults keys exist on your system (useful for checking compatibility).

## Usage

1. **Test current settings:**
   ```bash
   ./test-defaults.sh
   ```

2. **Apply verified defaults:**
   ```bash
   ./defaults-verified.sh
   ```

3. **Verify specific keys exist:**
   ```bash
   ./verify-defaults.sh
   ```

## Important Notes

### Domains
- `NSGlobalDomain` (or `.GlobalPreferences`) - System-wide settings
- `com.apple.finder` - Finder
- `com.apple.dock` - Dock
- `com.apple.Safari` - Safari
- `com.apple.screencapture` - Screenshots
- `com.apple.desktopservices` - Desktop services

### Data Types
When setting defaults, use the correct data type:
- `-bool true/false` for boolean values
- `-int 123` for integers
- `-float 1.5` for floating point numbers
- `-string "text"` for strings
- `-array` for arrays
- `-dict` for dictionaries

### Common Commands
```bash
# Read a value
defaults read com.apple.dock tilesize

# Write a value
defaults write com.apple.dock tilesize -int 48

# Delete a setting (reset to default)
defaults delete com.apple.dock tilesize

# Find settings containing a word
defaults find dock

# List all domains
defaults domains

# Show all settings in a domain
defaults read com.apple.dock
```

### Application Restart
Many defaults require restarting the affected application:
```bash
killall Dock      # For dock changes
killall Finder    # For Finder changes
killall SystemUIServer  # For menu bar changes
```

Some changes require logging out or restarting.

## Troubleshooting

1. **"Domain does not exist" error**: The app hasn't created its preference file yet. Launch the app first.

2. **Changes not taking effect**: Kill the affected process or restart your Mac.

3. **Permission denied**: Some system-level defaults may require `sudo`.

4. **Setting doesn't work**: Apple may have deprecated or changed the key. Check `defaults read <domain>` to see available keys.

## References

- [macos-defaults.com](https://macos-defaults.com/) - Curated list with examples
- [Apple's defaults man page](https://ss64.com/mac/defaults.html)
- [Apple Support - Edit property lists](https://support.apple.com/guide/terminal/edit-property-lists-apda49a1bb2-577e-4721-8f25-ffc0836f6997/mac)