#!/bin/sh

# https://gist.github.com/1623487
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos

set -e

# Default to On My Mac
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false


# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

## Keyboard

defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# typing
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

## Trackpad

# Enable "tap-and-a-half" to drag.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -int 1
defaults write com.apple.AppleMultitouchTrackpad Dragging -int 1

# Enable 3-finger drag. (Moving with 3 fingers in any window "chrome" moves the window.)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 2
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 2

# tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# 3 finger drag
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -int 1
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
#defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# map bottom right corner to right-click
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2 && \
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true && \
#defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1 && \
#defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

## Windows

# Always show scrollbars
# defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# Disable window animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false


## Mission Control

# defaults read com.apple.symbolichotkeys
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys \
#   -dict-add 44 '{enabled = 1; value = { parameters = (64, 64); type = "modifier"; }; }'
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys \
#   -dict-add 46 '{enabled = 1; value = { parameters = (131136, 131136); type = "modifier"; }; }'

killall "System Preferences" 2>&1 || true

defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys \
  -dict-add 44 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>64</integer><integer>64</integer></array><key>type</key><string>modifier</string></dict></dict>"

defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys \
  -dict-add 46 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>131136</integer><integer>131136</integer></array><key>type</key><string>modifier</string></dict></dict>"

/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

## Dashboard

# No Dashboard
# defaults write com.apple.dashboard mcx-disabled -boolean true

# Turn on dashboard-as-space
#defaults write com.apple.dashboard enabled-state 2


# Disable the “Are you sure you want to open this application?” dialog
# defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable automatic termination of inactive apps
# defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true



# Finder

# Automatically open a new Finder window when a volume is mounted
# defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
# defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show Path bar in Finder
# defaults write com.apple.finder ShowPathbar -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
# defaults write com.apple.finder FXInfoPanesExpanded -dict \
#   General -bool true \
#   OpenWith -bool true \
#   Privileges -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Enable copy in quicklook
defaults write com.apple.finder QLEnableTextSelection -bool YES

# finder files
chflags nohidden ~/Library

defaults write com.apple.finder AppleShowAllFiles true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool false

# defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Set default Finder location to home folder (~/)
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable ext change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
# defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Increase sound quality for Bluetooth headphones/headsets
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Dock

# Show indicator lights for open applications in the Dock
# defaults write com.apple.dock show-process-indicators -bool true

# defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock autohide -int 1
defaults write com.apple.dock autohide-time-modifier -int 1
defaults write com.apple.dock largesize -int 68
defaults write com.apple.dock tilesize -int 28
defaults write com.apple.dock magnification -int 1
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock showAppExposeGestureEnabled -int 1
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0
defaults write com.apple.dock showMissionControlGestureEnabled -int 1
defaults write com.apple.dock minimize-to-application -bool true


# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Disable the Launchpad gesture (pinch with thumb and three fingers)
#defaults write com.apple.dock showLaunchpadGestureEnabled -int 0


# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Top left screen corner → Mission Control
# defaults write com.apple.dock wvous-tl-corner -int 2
# defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
# defaults write com.apple.dock wvous-tr-corner -int 4
# defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
# defaults write com.apple.dock wvous-bl-corner -int 5
# defaults write com.apple.dock wvous-bl-modifier -int 0

# Disable Spotlight indexing for any volume that gets mounted and has not yet
# been indexed before.
# Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.
# sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

# Load new settings before rebuilding the index
# killall mds > /dev/null 2>&1
# Make sure indexing is enabled for the main volume
# sudo mdutil -i on / > /dev/null
# Rebuild the index from scratch
# sudo mdutil -E / > /dev/null

# Safari

# Disable Safari’s thumbnail cache for History and Top Sites
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write -g WebKitDeveloperExtras -bool true

# Disable webkit homepage
# defaults write org.webkit.nightly.WebKit StartPageDisabled -bool true

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
# defaults write com.apple.dock expose-group-by-app -bool false

# Disable Dashboard
# defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
# defaults write com.apple.dock dashboard-in-overlay -bool true

# Don’t automatically rearrange Spaces based on most recent use
# defaults write com.apple.dock mru-spaces -bool false

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
#defaults write com.apple.dock persistent-apps -array

# Show only open applications in the Dock
#defaults write com.apple.dock static-only -bool true
# Chrome

# disable print preview
# defaults write com.google.Chrome DisablePrintPreview -boolean true



# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Auto-play videos when opened with QuickTime Player
defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen 1


# Hiding the morons file locations
# chflags hidden ~/Creative\ Cloud\ Files
# chflags hidden ~/Pictures/VueScan

# defaults write NSGlobalDomain AppleLanguages -array "en" "de"
# defaults write NSGlobalDomain AppleLocale -string "en_US@currency=EUR"
# defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
# defaults write NSGlobalDomain AppleMetricUnits -bool true

# Show language menu in the top right corner of the boot screen
# sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
# sudo systemsetup -settimezone "Europe/Brussels" > /dev/null

# Enable lid wakeup
# sudo pmset -a lidwake 1

# Restart automatically on power loss
# sudo pmset -a autorestart 1

# Restart automatically if the computer freezes
# sudo systemsetup -setrestartfreeze on

# Sleep the display after 15 minutes
# sudo pmset -a displaysleep 15

# Disable machine sleep while charging
# sudo pmset -c sleep 0

# Set machine sleep to 5 minutes on battery
# sudo pmset -b sleep 5

# Set standby delay to 24 hours (default is 1 hour)
# sudo pmset -a standbydelay 86400

# Never go into computer sleep mode
# sudo systemsetup -setcomputersleep Off > /dev/null

# Hibernation mode
# 0: Disable hibernation (speeds up entering sleep mode)
# 3: Copy RAM to disk so the system state can still be restored in case of a
#    power failure.
# sudo pmset -a hibernatemode 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
# defaults write com.apple.screencapture disable-shadow -bool true


## Terminal

defaults write com.apple.terminal StringEncodings -array 4

# # Use a modified version of the Solarized Dark theme by default in Terminal.app
# osascript <<EOD
# tell application "Terminal"
#   local allOpenedWindows
#   local initialOpenedWindows
#   local windowID
#   set themeName to "Solarized Dark xterm-256color"
#   (* Store the IDs of all the open terminal windows. *)
#   set initialOpenedWindows to id of every window
#   (* Open the custom theme so that it gets added to the list
#      of available terminal themes (note: this will open two
#      additional terminal windows). *)
#   do shell script "open '$HOME/init/" & themeName & ".terminal'"
#   (* Wait a little bit to ensure that the custom theme is added. *)
#   delay 1
#   (* Set the custom theme as the default terminal theme. *)
#   set default settings to settings set themeName
#   (* Get the IDs of all the currently opened terminal windows. *)
#   set allOpenedWindows to id of every window
#   repeat with windowID in allOpenedWindows
#     (* Close the additional windows that were opened in order
#        to add the custom theme to the list of terminal themes. *)
#     if initialOpenedWindows does not contain windowID then
#       close (every window whose id is windowID)
#     (* Change the theme for the initial opened terminal windows
#        to remove the need to close them in order for the custom
#        theme to be applied. *)
#     else
#       set current settings of tabs of (every window whose id is windowID) to settings set themeName
#     end if
#   end repeat
# end tell
# EOD

# Enable “focus follows mouse” for Terminal.app and all X11 apps
# i.e. hover over a window and start typing in it without clicking first
#defaults write com.apple.terminal FocusFollowsMouse -bool true

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
# defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Disable the annoying line marks
# defaults write com.apple.Terminal ShowLineMarks -int 0

# Disable local Time Machine backups
# hash tmutil &> /dev/null && sudo tmutil disablelocal

## Activity Monitor

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

## Photos

defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true


killall Dock
killall Finder


# for app in "Activity Monitor" \
#   "Address Book" \
#   "Calendar" \
#   "cfprefsd" \
#   "Contacts" \
#   "Dock" \
#   "Finder" \
#   "Google Chrome Canary" \
#   "Google Chrome" \
#   "Mail" \
#   "Messages" \
#   "Opera" \
#   "Photos" \
#   "Safari" \
#   "SizeUp" \
#   "Spectacle" \
#   "SystemUIServer" \
#   "Terminal" \
#   "Transmission" \
#   "Tweetbot" \
#   "Twitter" \
#   "iCal"; do
#   killall "${app}" &> /dev/null
# done