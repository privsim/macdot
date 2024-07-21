-- Define hyper keys
launchMash = {"⌘", "⌥", "⌃"}
windowMash = {"⌘", "⌥"}

print("Initializing Hammerspoon configuration")

-- Global override for ⌘ + Enter to toggle maximize window
local originalWindowSizes = {}

local function toggleMaximize()
    local win = hs.window.focusedWindow()
    if not win then return end

    local winId = win:id()

    if originalWindowSizes[winId] then
        -- Restore original size
        win:setFrame(originalWindowSizes[winId])
        originalWindowSizes[winId] = nil
    else
        -- Save original size and maximize window
        originalWindowSizes[winId] = win:frame()
        hs.grid.maximizeWindow(win)
    end
end

hs.hotkey.bind({"⌘"}, "Return", toggleMaximize)
print("Bound ⌘ + Enter to toggleMaximize")

-- Load external configuration files
print("Loading external configuration files")
require "apps"
require "grid"
require "clipboard"
require "cycle_windows"
require "move_workspace"

-- Load KSheet Spoon
print("Loading KSheet")
hs.loadSpoon("KSheet")
spoon.KSheet:bindHotkeys({
    toggle = {{"ctrl", "alt", "cmd"}, "/"}
})
print("Bound KSheet to ctrl + alt + cmd + /")

-- Load ClipboardTool Spoon
print("Loading ClipboardTool")
hs.loadSpoon("ClipboardTool")
spoon.ClipboardTool:bindHotkeys({
    toggle_clipboard = {{"ctrl", "alt", "cmd"}, "V"}
})
spoon.ClipboardTool.show_copied_alert = false
spoon.ClipboardTool.paste_on_select = true
spoon.ClipboardTool:start()
print("Bound ClipboardTool to ctrl + alt + cmd + V")

-- Reload Hammerspoon configuration
hs.hotkey.bind(launchMash, "r", function() hs.reload() end)
print("Bound hyper key + R to reload configuration")

-- Lock screen
hs.hotkey.bind(launchMash, "a", function() hs.caffeinate.lockScreen() end)
print("Bound hyper key + a to lock screen")

hs.alert.show("Hammerspoon config loaded")
print("Hammerspoon configuration loaded successfully")
