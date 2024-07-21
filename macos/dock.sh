#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Chromium.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/System/Applications/System Settings.app"
dockutil --no-restart --add "/Applications/Spotify.app"

killall Dock
